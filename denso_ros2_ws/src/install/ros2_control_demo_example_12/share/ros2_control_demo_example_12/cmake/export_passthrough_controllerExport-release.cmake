#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "ros2_control_demo_example_12::passthrough_controller" for configuration "Release"
set_property(TARGET ros2_control_demo_example_12::passthrough_controller APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ros2_control_demo_example_12::passthrough_controller PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libpassthrough_controller.so"
  IMPORTED_SONAME_RELEASE "libpassthrough_controller.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS ros2_control_demo_example_12::passthrough_controller )
list(APPEND _IMPORT_CHECK_FILES_FOR_ros2_control_demo_example_12::passthrough_controller "${_IMPORT_PREFIX}/lib/libpassthrough_controller.so" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
