import rclpy
from rclpy.node import Node
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
from camera_publisher.pybcapclient import bcapclient

import io
import cv2
import numpy as np
from PIL import Image as PILImage
from typing import Optional

# ──────────────────────────────────
#  Configs
# ──────────────────────────────────
class CameraConfig:
    host: str = "192.168.1.92"

class RobotConfig:
    host: str = "192.168.1.222"
    port: int = 5007
    timeout: int = 2000
    speed: int = 100
    pixel_to_mm: float = 0.1135
    camera_offset_x: float = 227.3
    camera_offset_y: float = -55.3
    img_cx: int = 960
    img_cy: int = 540

# ──────────────────────────────────
#  Camera Controller
# ──────────────────────────────────
class CameraController:
    def __init__(self, rconf: RobotConfig, cconf: CameraConfig):
        self.rc = rconf
        self.cc = cconf
        self.client = self.ctrl = self.camera = None

    def initialize(self):
        self.client = bcapclient.BCAPClient(self.rc.host, self.rc.port, self.rc.timeout)
        self.client.service_start("")
        self.ctrl = self.client.controller_connect(
            "", "CaoProv.Canon.N10-W02", "", f"Server={self.cc.host}"
        )
        self.camera = self.client.controller_getvariable(self.ctrl, "IMAGE", "")
        return self

    def capture_image(self) -> Optional[np.ndarray]:
        data = self.client.variable_getvalue(self.camera)
        if not data:
            return None
        img = PILImage.open(io.BytesIO(data))
        return cv2.cvtColor(np.array(img), cv2.COLOR_RGB2BGR)

    def cleanup(self):
        if self.camera:
            self.client.variable_release(self.camera)
        if self.ctrl:
            self.client.controller_disconnect(self.ctrl)
        if self.client:
            self.client.service_stop()
            del self.client

# ──────────────────────────────────
#  ROS 2 Node
# ──────────────────────────────────
class CameraPublisher(Node):
    def __init__(self):
        super().__init__('camera_publisher')
        self.publisher_ = self.create_publisher(Image, 'image_raw', 10)
        self.bridge = CvBridge()
        self.timer = self.create_timer(0.1, self.publish_image)  # 10 FPS

        self.camera = CameraController(RobotConfig(), CameraConfig()).initialize()
        self.get_logger().info("CameraPublisher node started.")

    def publish_image(self):
        frame = self.camera.capture_image()
        if frame is not None:
            msg = self.bridge.cv2_to_imgmsg(frame, encoding='bgr8')
            self.publisher_.publish(msg)
        else:
            self.get_logger().warn("No image captured.")

    def destroy_node(self):
        self.camera.cleanup()
        super().destroy_node()

def main(args=None):
    rclpy.init(args=args)
    node = CameraPublisher()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        pass
    node.destroy_node()
    rclpy.shutdown()
