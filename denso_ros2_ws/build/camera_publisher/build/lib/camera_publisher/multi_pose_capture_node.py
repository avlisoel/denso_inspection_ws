import rclpy
from rclpy.node import Node
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
import cv2
import time
import math
from camera_publisher.robot_interface import RobotInterface

def deg(degrees):
    return degrees * math.pi / 180.0

class MultiPoseCapture(Node):
    def __init__(self):
        super().__init__('multi_pose_capture')
        self.bridge = CvBridge()
        self.image_sub = self.create_subscription(Image, '/image_raw', self.image_callback, 10)
        self.latest_image = None
        self.images = []

        # Define 3 poses
        self.capture_joints = [
            [deg(-15.21), deg(-0.349), deg(110.397), deg(-0.002), deg(69.944), deg(-15.235)],  # Pose 1
            [deg(2.014), deg(-7.109), deg(116.790), deg(0.055), deg(70.379), deg(1.991)],      # Pose 2
            [deg(29.084), deg(-7.588), deg(111.202), deg(0.076), deg(70.416), deg(29.052)],    # Pose 3
        ]

        # Initialize COBOTTA controller 
        self.robot = RobotInterface(self)
        self.get_logger().info("MultiPoseCapture node started.")

    def image_callback(self, msg):
        self.latest_image = self.bridge.imgmsg_to_cv2(msg, desired_encoding='bgr8')

    def capture_sequence(self):
        for i, pose in enumerate(self.capture_joints):
            self.get_logger().info(f"Moving to pose {i+1}: {pose}")
            self.robot.move_to_joints(pose,5)
            time.sleep(1.0)  # Wait for stabilization

            # Wait until image is received
            start_time = time.time()
            while self.latest_image is None and time.time() - start_time < 5.0:
                rclpy.spin_once(self, timeout_sec=0.1)

            if self.latest_image is None:
                self.get_logger().warn("No image received within timeout.")
                continue

            # Save image
            filename = f"/tmp/capture_pose_{i+1}.jpg"
            cv2.imwrite(filename, self.latest_image)
            self.images.append(self.latest_image)
            self.get_logger().info(f"📸 Saved image to {filename}")

            self.latest_image = None  # Reset for next capture

def main(args=None):
    rclpy.init(args=args)
    node = MultiPoseCapture()

    # Let ROS spin for a moment to establish subscriptions
    time.sleep(1.0)
    node.capture_sequence()

    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()
