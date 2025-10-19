from sensor_msgs.msg import Image
from cv_bridge import CvBridge
import cv2
from rclpy.node import Node
from typing import Optional

class ImageSaver:
    def __init__(self, node: Node):
        self.node = node
        self.bridge = CvBridge()
        self.latest_image = None
        self.node.create_subscription(Image, '/image_raw', self.image_callback, 10)

    def image_callback(self, msg: Image):
        try:
            self.latest_image = self.bridge.imgmsg_to_cv2(msg, desired_encoding='bgr8')
        except Exception as e:
            self.node.get_logger().error(f"❌ Failed to convert image: {e}")

    def save(self, name: str, index: int) -> Optional[str]:
        if self.latest_image is None:
            self.node.get_logger().warn("⚠️ No image available to save.")
            return None

        path = f"/tmp/{name}_pose_{index}.jpg"
        try:
            cv2.imwrite(path, self.latest_image)
            self.node.get_logger().info(f"📸 Image saved to {path}")
            self.latest_image = None
            return path
        except Exception as e:
            self.node.get_logger().error(f"❌ Failed to save image: {e}")
            return None