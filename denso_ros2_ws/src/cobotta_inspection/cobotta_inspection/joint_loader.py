import os
import math
import pkg_resources

def deg(degrees):
    return degrees * math.pi / 180.0

def load_joint_file(name):
    path = pkg_resources.resource_filename('cobotta_inspection', f'resource/{name}.txt')
    if not os.path.exists(path):
        raise FileNotFoundError(f"Joint file not found: {path}")

    joints = []
    with open(path, 'r') as f:
        for line in f:
            values = [deg(float(val)) for val in line.strip().split(',')]
            if len(values) == 6:
                joints.append(values)
    return joints