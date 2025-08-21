import rclpy
from rclpy.node import Node
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
import cv2
import time

class MultiPoseCapture(Node):
    def __init__(self):
        super().__init__('multi_pose_capture')
        self.bridge = CvBridge()
        self.image_sub = self.create_subscription(Image, '/image_raw', self.image_callback, 10)
        self.latest_image = None
        self.images = []

        # Define 3 poses (example XYZ)
        self.capture_poses = [
            [100, 0, 200],
            [150, 0, 200],
            [200, 0, 200],
        ]

        # Initialize COBOTTA controller (you’ll need to define this)
        self.robot = RobotInterface()

        self.get_logger().info("MultiPoseCapture node started.")
        self.capture_sequence()

    def image_callback(self, msg):
        self.latest_image = self.bridge.imgmsg_to_cv2(msg, desired_encoding='bgr8')

    def capture_sequence(self):
        for i, pose in enumerate(self.capture_poses):
            self.get_logger().info(f"Moving to pose {i+1}: {pose}")
            self.robot.move_to(pose)
            time.sleep(1.0)  # Wait for stabilization

            # Wait until image is received
            while self.latest_image is None:
                rclpy.spin_once(self, timeout_sec=0.1)

            # Save image
            filename = f"/tmp/capture_pose_{i+1}.jpg"
            cv2.imwrite(filename, self.latest_image)
            self.images.append(self.latest_image)
            self.get_logger().info(f"📸 Saved image to {filename}")

            self.latest_image = None  # Reset for next capture

def main(args=None):
    rclpy.init(args=args)
    node = MultiPoseCapture()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()
