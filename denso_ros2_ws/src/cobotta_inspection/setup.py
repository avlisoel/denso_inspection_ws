from setuptools import setup

package_name = 'cobotta_inspection'

setup(
    name=package_name,
    version='0.1.0',
    packages=[package_name],
    data_files=[
        # Install resource files
        ('share/' + package_name + '/resource', ['resource/battery.txt', 'resource/motor.txt']),
        ('share/' + package_name, ['package.xml']),
    ],
    install_requires=['setuptools'],
    zip_safe=True,
    maintainer='Leandro',
    maintainer_email='your.email@example.com',
    description='Cobotta inspection system with ROS 2, FastAPI, and camera integration',
    license='MIT',
    tests_require=['pytest'],
    entry_points={
        'console_scripts': [
            'inspection_executor = cobotta_inspection.inspection_executor:main',
            'camera_publisher = cobotta_inspection.image_saver:main',
        ],
    },
)