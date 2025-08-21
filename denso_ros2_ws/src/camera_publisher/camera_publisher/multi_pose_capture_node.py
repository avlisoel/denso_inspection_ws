import rclpy
from rclpy.node import Node
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
import cv2
import time
import math
import os
import json
from camera_publisher.robot_interface import RobotInterface

def deg(degrees):
    return degrees * math.pi / 180.0

class MultiPoseCapture(Node):
    def __init__(self, run_index):
        super().__init__('multi_pose_capture')
        self.bridge = CvBridge()
        self.image_sub = self.create_subscription(Image, '/image_raw', self.image_callback, 10)
        self.latest_image = None
        self.latest_image_time = None
        self.images = []
        self.run_index = run_index
        self.metadata = []

        # Define 3 poses
        self.capture_joints = [
            [deg(-14.128), deg(7.170), deg(73.585), deg(0.032), deg(99.315), deg(-14.151)],  # Pose 1
            [deg(8.758), deg(-0.413), deg(81.584), deg(0.057), deg(98.880), deg(8.741)],      # Pose 2
            [deg(29.256), deg(1.584), deg(79.562), deg(0.071), deg(98.883), deg(29.240)],    # Pose 3
        ]

        # Initialize COBOTTA controller
        self.robot = RobotInterface(self)
        self.get_logger().info(f"✅ MultiPoseCapture node started for run {run_index}")

        # Ensure save directory exists
        self.save_dir = os.path.expanduser("~/ros2_ws/captures")
        os.makedirs(self.save_dir, exist_ok=True)

    def image_callback(self, msg):
        self.latest_image = self.bridge.imgmsg_to_cv2(msg, desired_encoding='bgr8')
        self.latest_image_time = time.time()

    def wait_until_reached(self, target_pose, tolerance=deg(1.0), timeout=15.0):
        start_time = time.time()
        while time.time() - start_time < timeout:
            current_pose = self.robot.get_current_joint_positions()
            if current_pose is None:
                self.get_logger().warn("⚠️ No joint state received.")
                rclpy.spin_once(self, timeout_sec=0.2)
                continue

            deltas = [abs(c - t) for c, t in zip(current_pose, target_pose)]
            if all(delta < tolerance for delta in deltas):
                return True

            rclpy.spin_once(self, timeout_sec=0.1)

        self.get_logger().warn("⏱️ Timeout waiting for robot to reach target pose.")
        return False

    def capture_sequence(self):
        for i, pose in enumerate(self.capture_joints):
            pose_index = i + 1
            self.get_logger().info(f"➡️ Moving to pose {pose_index}: {pose}")
            self.robot.move_to_joints(pose, duration=5)

            self.get_logger().info("🕒 Waiting for robot to reach pose...")
            if not self.wait_until_reached(pose):
                self.get_logger().warn(f"❌ Pose {pose_index} not reached in time. Skipping capture.")
                self.metadata.append({
                    "run": self.run_index,
                    "pose": pose_index,
                    "timestamp": time.strftime("%Y-%m-%d %H:%M:%S"),
                    "status": "failed",
                    "pose_joints": pose,
                    "image_path": None
                })
                continue

            self.get_logger().info("⏸️ Stabilizing for 3 seconds before capture...")
            time.sleep(3.0)

            prev_image_time = self.latest_image_time
            start_time = time.time()
            while self.latest_image_time == prev_image_time and time.time() - start_time < 7.0:
                rclpy.spin_once(self, timeout_sec=0.1)

            if self.latest_image_time == prev_image_time or self.latest_image is None:
                self.get_logger().warn("⚠️ No fresh image received after stabilization.")
                self.metadata.append({
                    "run": self.run_index,
                    "pose": pose_index,
                    "timestamp": time.strftime("%Y-%m-%d %H:%M:%S"),
                    "status": "no_image",
                    "pose_joints": pose,
                    "image_path": None
                })
                continue

            timestamp = time.strftime("%Y%m%d_%H%M%S")
            filename = os.path.join(self.save_dir, f"run_{self.run_index}_pose_{pose_index}_{timestamp}.jpg")
            cv2.imwrite(filename, self.latest_image)
            self.images.append(self.latest_image)
            self.get_logger().info(f"📸 Saved image to {filename}")

            self.metadata.append({
                "run": self.run_index,
                "pose": pose_index,
                "timestamp": timestamp,
                "status": "success",
                "pose_joints": pose,
                "image_path": filename
            })

            self.latest_image = None

        # Save metadata
        metadata_file = os.path.join(self.save_dir, f"run_{self.run_index}_metadata.json")
        with open(metadata_file, 'w') as f:
            json.dump(self.metadata, f, indent=2)
        self.get_logger().info(f"📝 Metadata saved to {metadata_file}")

def main():
    rclpy.init()
    try:
        for i in range(20):
            print(f"📸 Run {i+1}/20 starting...")
            node = MultiPoseCapture(run_index=i+1)
            time.sleep(5)
            node.capture_sequence()
            node.destroy_node()
            print(f"✅ Run {i+1}/20 complete. Sleeping for 5 seconds...\n")
    except KeyboardInterrupt:
        print("🛑 Interrupted by user. Exiting early.")
    finally:
        rclpy.shutdown()

if __name__ == '__main__':
    main()
