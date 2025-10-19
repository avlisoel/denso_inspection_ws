from launch import LaunchDescription
from launch.actions import DeclareLaunchArgument, ExecuteProcess
from launch.substitutions import LaunchConfiguration
from launch_ros.actions import Node

def generate_launch_description():
    inspection_name = LaunchConfiguration('inspection_name')

    return LaunchDescription([
        # Allow dynamic selection of inspection routine
        DeclareLaunchArgument(
            'inspection_name',
            default_value='battery',
            description='Name of the inspection routine (e.g., battery, motor)'
        ),

        # Start camera publisher node
        Node(
            package='cobotta_inspection',
            executable='camera_publisher',
            name='camera_publisher',
            output='screen'
        ),

        # Start inspection executor node
        Node(
            package='cobotta_inspection',
            executable='inspection_executor',
            name='inspection_executor',
            output='screen',
            arguments=[inspection_name]
        ),

        # Optional: Start DENSO Cobotta driver nodes
        # Uncomment and adjust if you have a launch file for them
        # IncludeLaunchDescription(
        #     PythonLaunchDescriptionSource([
        #         PathJoinSubstitution([
        #             FindPackageShare('denso_cobotta_driver'),
        #             'launch',
        #             'cobotta_driver.launch.py'
        #         ])
        #     ])
        # ),
    ])