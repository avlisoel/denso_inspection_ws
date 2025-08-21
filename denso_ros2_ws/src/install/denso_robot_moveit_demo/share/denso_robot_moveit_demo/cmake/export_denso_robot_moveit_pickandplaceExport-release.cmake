#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "denso_robot_moveit_demo::denso_robot_moveit_pickandplace" for configuration "Release"
set_property(TARGET denso_robot_moveit_demo::denso_robot_moveit_pickandplace APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(denso_robot_moveit_demo::denso_robot_moveit_pickandplace PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/denso_robot_moveit_demo/denso_robot_moveit_pickandplace"
  )

list(APPEND _IMPORT_CHECK_TARGETS denso_robot_moveit_demo::denso_robot_moveit_pickandplace )
list(APPEND _IMPORT_CHECK_FILES_FOR_denso_robot_moveit_demo::denso_robot_moveit_pickandplace "${_IMPORT_PREFIX}/lib/denso_robot_moveit_demo/denso_robot_moveit_pickandplace" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
