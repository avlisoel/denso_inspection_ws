from trajectory_msgs.msg import JointTrajectory, JointTrajectoryPoint
from std_msgs.msg import Header

class RobotInterface:
    def __init__(self, node):
        self.node = node
        self.publisher = node.create_publisher(
            JointTrajectory,
            '/denso_joint_trajectory_controller/joint_trajectory',
            10
        )
        self.joint_names = [
            'joint_1', 'joint_2', 'joint_3',
            'joint_4', 'joint_5', 'joint_6'
        ]

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