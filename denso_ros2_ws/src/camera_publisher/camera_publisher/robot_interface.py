from trajectory_msgs.msg import JointTrajectory, JointTrajectoryPoint
from std_msgs.msg import Header
from builtin_interfaces.msg import Time
from sensor_msgs.msg import JointState

class RobotInterface:
    def __init__(self, node):
        
        self.node = node
        self.publisher = node.create_publisher(
            JointTrajectory,
            '/denso_joint_trajectory_controller/joint_trajectory',
            10
        )

        self.joint_state = None
        self.node.create_subscription(
            JointState,
            '/joint_states',
            self.joint_state_callback,
            10
        )
        
        self.joint_names = [
            'joint_1', 'joint_2', 'joint_3',
            'joint_4', 'joint_5', 'joint_6'
        ]

    def joint_state_callback(self, msg):
        self.joint_state = msg

    def get_current_joint_positions(self):
        if self.joint_state is None:
            return None

        name_to_position = dict(zip(self.joint_state.name, self.joint_state.position))
        ordered_positions = [name_to_position[name] for name in self.joint_names if name in name_to_position]

        if len(ordered_positions) != len(self.joint_names):
            self.node.get_logger().warn("Mismatch in joint names. Some joints missing in joint_states.")
            return None

        return ordered_positions

    def move_to_joints(self, joint_positions, duration=2.0):
        msg = JointTrajectory()
        msg.joint_names = self.joint_names
        msg.header = Header()
        msg.header.stamp = self.node.get_clock().now().to_msg()

        point = JointTrajectoryPoint()
        point.positions = joint_positions
        point.time_from_start.sec = int(duration)
        point.time_from_start.nanosec = int((duration - int(duration)) * 1e9)

        msg.points.append(point)
        self.publisher.publish(msg)
        self.node.get_logger().info(f"🧠 Sent joint trajectory: {joint_positions}")
