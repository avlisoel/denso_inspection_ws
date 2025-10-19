import rclpy
from rclpy.node import Node
import sys
import time
from cobotta_inspection.joint_loader import load_joint_file
from cobotta_inspection.robot_interface import RobotInterface
from cobotta_inspection.image_saver import ImageSaver

class InspectionExecutor(Node):
    def __init__(self, name):
        super().__init__('inspection_executor')
        self.name = name
        self.robot = RobotInterface(self)
        self.saver = ImageSaver(self)

        try:
            self.joints = load_joint_file(name)
        except Exception as e:
            self.get_logger().error(f"❌ Failed to load joint file: {e}")
            rclpy.shutdown()
            return

        self.get_logger().info(f"🔍 Starting inspection: {name}")

    def run(self):
        for i, pose in enumerate(self.joints):
            self.get_logger().info(f"➡️ Pose {i+1}: {pose}")
            self.robot.move_to_joints(pose, duration=5.0)
            time.sleep(1.0)

            # Wait for image
            start = time.time()
            while self.saver.latest_image is None and time.time() - start < 5.0:
                rclpy.spin_once(self, timeout_sec=0.1)

            path = self.saver.save(self.name, i+1)
            if path:
                self.get_logger().info(f"📸 Image saved: {path}")
            else:
                self.get_logger().warn("⚠️ No image captured.")

def main(args=None):
    rclpy.init(args=args)
    if len(sys.argv) < 2:
        print("❗ Usage: ros2 run cobotta_inspection inspection_executor <name>")
        rclpy.shutdown()
        return

    node = InspectionExecutor(sys.argv[1])
    time.sleep(1.0)
    node.run()
    node.destroy_node()
    rclpy.shutdown()