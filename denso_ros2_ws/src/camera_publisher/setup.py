from setuptools import setup
import os
from glob import glob

package_name = 'camera_publisher'

setup(
    name=package_name,
    version='0.0.1',
    packages=[
        package_name,
        f'{package_name}.pybcapclient',
    ],
    include_package_data=True,
    install_requires=[
        'setuptools',
        'numpy<2',  # Ensures compatibility with cv_bridge
        'opencv-python',
        'Pillow',
    ],
    zip_safe=True,
    maintainer='your_name',
    maintainer_email='leandro.batista@pwc.com',
    description='ROS 2 node to publish camera images using pybcapclient',
    license='MIT',
    tests_require=['pytest'],
    entry_points={
        'console_scripts': [
            'camera_node = camera_publisher.camera_node:main',
            'multi_pose_capture_node = camera_publisher.multi_pose_capture_node:main',
        ],
    },
    data_files=[
        ('share/' + package_name, ['package.xml']),
        ('share/' + package_name + '/launch', glob('launch/*.py')),
        ('share/' + package_name + '/resource', ['resource/' + package_name]),
    ],
)