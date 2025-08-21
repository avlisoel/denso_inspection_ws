# Install script for directory: /home/isg/workspace/denso_ros2_ws/src/denso_robot_drivers_ros2/denso_robot_moveit_demo

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/isg/workspace/denso_ros2_ws/src/install/denso_robot_moveit_demo")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/denso_robot_moveit_demo/denso_robot_moveit_demo" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/denso_robot_moveit_demo/denso_robot_moveit_demo")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/denso_robot_moveit_demo/denso_robot_moveit_demo"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/denso_robot_moveit_demo" TYPE EXECUTABLE FILES "/home/isg/workspace/denso_ros2_ws/src/build/denso_robot_moveit_demo/denso_robot_moveit_demo")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/denso_robot_moveit_demo/denso_robot_moveit_demo" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/denso_robot_moveit_demo/denso_robot_moveit_demo")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/denso_robot_moveit_demo/denso_robot_moveit_demo"
         OLD_RPATH "/opt/ros/humble/lib:/opt/ros/humble/lib/x86_64-linux-gnu:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/denso_robot_moveit_demo/denso_robot_moveit_demo")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/denso_robot_moveit_demo/denso_robot_moveit_pickandplace" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/denso_robot_moveit_demo/denso_robot_moveit_pickandplace")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/denso_robot_moveit_demo/denso_robot_moveit_pickandplace"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/denso_robot_moveit_demo" TYPE EXECUTABLE FILES "/home/isg/workspace/denso_ros2_ws/src/build/denso_robot_moveit_demo/denso_robot_moveit_pickandplace")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/denso_robot_moveit_demo/denso_robot_moveit_pickandplace" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/denso_robot_moveit_demo/denso_robot_moveit_pickandplace")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/denso_robot_moveit_demo/denso_robot_moveit_pickandplace"
         OLD_RPATH "/opt/ros/humble/lib:/opt/ros/humble/lib/x86_64-linux-gnu:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/denso_robot_moveit_demo/denso_robot_moveit_pickandplace")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/denso_robot_moveit_demo/denso_robot_moveit_pickandplace_scara" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/denso_robot_moveit_demo/denso_robot_moveit_pickandplace_scara")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/denso_robot_moveit_demo/denso_robot_moveit_pickandplace_scara"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/denso_robot_moveit_demo" TYPE EXECUTABLE FILES "/home/isg/workspace/denso_ros2_ws/src/build/denso_robot_moveit_demo/denso_robot_moveit_pickandplace_scara")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/denso_robot_moveit_demo/denso_robot_moveit_pickandplace_scara" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/denso_robot_moveit_demo/denso_robot_moveit_pickandplace_scara")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/denso_robot_moveit_demo/denso_robot_moveit_pickandplace_scara"
         OLD_RPATH "/opt/ros/humble/lib:/opt/ros/humble/lib/x86_64-linux-gnu:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/denso_robot_moveit_demo/denso_robot_moveit_pickandplace_scara")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/denso_robot_moveit_demo" TYPE DIRECTORY FILES "/home/isg/workspace/denso_ros2_ws/src/denso_robot_drivers_ros2/denso_robot_moveit_demo/launch")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/denso_robot_moveit_demo" TYPE DIRECTORY FILES "/home/isg/workspace/denso_ros2_ws/src/denso_robot_drivers_ros2/denso_robot_moveit_demo/config")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/package_run_dependencies" TYPE FILE FILES "/home/isg/workspace/denso_ros2_ws/src/build/denso_robot_moveit_demo/ament_cmake_index/share/ament_index/resource_index/package_run_dependencies/denso_robot_moveit_demo")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/parent_prefix_path" TYPE FILE FILES "/home/isg/workspace/denso_ros2_ws/src/build/denso_robot_moveit_demo/ament_cmake_index/share/ament_index/resource_index/parent_prefix_path/denso_robot_moveit_demo")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/denso_robot_moveit_demo/environment" TYPE FILE FILES "/opt/ros/humble/share/ament_cmake_core/cmake/environment_hooks/environment/ament_prefix_path.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/denso_robot_moveit_demo/environment" TYPE FILE FILES "/home/isg/workspace/denso_ros2_ws/src/build/denso_robot_moveit_demo/ament_cmake_environment_hooks/ament_prefix_path.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/denso_robot_moveit_demo/environment" TYPE FILE FILES "/opt/ros/humble/share/ament_cmake_core/cmake/environment_hooks/environment/path.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/denso_robot_moveit_demo/environment" TYPE FILE FILES "/home/isg/workspace/denso_ros2_ws/src/build/denso_robot_moveit_demo/ament_cmake_environment_hooks/path.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/denso_robot_moveit_demo" TYPE FILE FILES "/home/isg/workspace/denso_ros2_ws/src/build/denso_robot_moveit_demo/ament_cmake_environment_hooks/local_setup.bash")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/denso_robot_moveit_demo" TYPE FILE FILES "/home/isg/workspace/denso_ros2_ws/src/build/denso_robot_moveit_demo/ament_cmake_environment_hooks/local_setup.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/denso_robot_moveit_demo" TYPE FILE FILES "/home/isg/workspace/denso_ros2_ws/src/build/denso_robot_moveit_demo/ament_cmake_environment_hooks/local_setup.zsh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/denso_robot_moveit_demo" TYPE FILE FILES "/home/isg/workspace/denso_ros2_ws/src/build/denso_robot_moveit_demo/ament_cmake_environment_hooks/local_setup.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/denso_robot_moveit_demo" TYPE FILE FILES "/home/isg/workspace/denso_ros2_ws/src/build/denso_robot_moveit_demo/ament_cmake_environment_hooks/package.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/packages" TYPE FILE FILES "/home/isg/workspace/denso_ros2_ws/src/build/denso_robot_moveit_demo/ament_cmake_index/share/ament_index/resource_index/packages/denso_robot_moveit_demo")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/denso_robot_moveit_demo/cmake/export_denso_robot_moveit_demoExport.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/denso_robot_moveit_demo/cmake/export_denso_robot_moveit_demoExport.cmake"
         "/home/isg/workspace/denso_ros2_ws/src/build/denso_robot_moveit_demo/CMakeFiles/Export/share/denso_robot_moveit_demo/cmake/export_denso_robot_moveit_demoExport.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/denso_robot_moveit_demo/cmake/export_denso_robot_moveit_demoExport-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/denso_robot_moveit_demo/cmake/export_denso_robot_moveit_demoExport.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/denso_robot_moveit_demo/cmake" TYPE FILE FILES "/home/isg/workspace/denso_ros2_ws/src/build/denso_robot_moveit_demo/CMakeFiles/Export/share/denso_robot_moveit_demo/cmake/export_denso_robot_moveit_demoExport.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/denso_robot_moveit_demo/cmake" TYPE FILE FILES "/home/isg/workspace/denso_ros2_ws/src/build/denso_robot_moveit_demo/CMakeFiles/Export/share/denso_robot_moveit_demo/cmake/export_denso_robot_moveit_demoExport-release.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/denso_robot_moveit_demo/cmake/export_denso_robot_moveit_pickandplaceExport.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/denso_robot_moveit_demo/cmake/export_denso_robot_moveit_pickandplaceExport.cmake"
         "/home/isg/workspace/denso_ros2_ws/src/build/denso_robot_moveit_demo/CMakeFiles/Export/share/denso_robot_moveit_demo/cmake/export_denso_robot_moveit_pickandplaceExport.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/denso_robot_moveit_demo/cmake/export_denso_robot_moveit_pickandplaceExport-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/denso_robot_moveit_demo/cmake/export_denso_robot_moveit_pickandplaceExport.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/denso_robot_moveit_demo/cmake" TYPE FILE FILES "/home/isg/workspace/denso_ros2_ws/src/build/denso_robot_moveit_demo/CMakeFiles/Export/share/denso_robot_moveit_demo/cmake/export_denso_robot_moveit_pickandplaceExport.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/denso_robot_moveit_demo/cmake" TYPE FILE FILES "/home/isg/workspace/denso_ros2_ws/src/build/denso_robot_moveit_demo/CMakeFiles/Export/share/denso_robot_moveit_demo/cmake/export_denso_robot_moveit_pickandplaceExport-release.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/denso_robot_moveit_demo/cmake/export_denso_robot_moveit_pickandplace_scaraExport.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/denso_robot_moveit_demo/cmake/export_denso_robot_moveit_pickandplace_scaraExport.cmake"
         "/home/isg/workspace/denso_ros2_ws/src/build/denso_robot_moveit_demo/CMakeFiles/Export/share/denso_robot_moveit_demo/cmake/export_denso_robot_moveit_pickandplace_scaraExport.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/denso_robot_moveit_demo/cmake/export_denso_robot_moveit_pickandplace_scaraExport-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/denso_robot_moveit_demo/cmake/export_denso_robot_moveit_pickandplace_scaraExport.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/denso_robot_moveit_demo/cmake" TYPE FILE FILES "/home/isg/workspace/denso_ros2_ws/src/build/denso_robot_moveit_demo/CMakeFiles/Export/share/denso_robot_moveit_demo/cmake/export_denso_robot_moveit_pickandplace_scaraExport.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/denso_robot_moveit_demo/cmake" TYPE FILE FILES "/home/isg/workspace/denso_ros2_ws/src/build/denso_robot_moveit_demo/CMakeFiles/Export/share/denso_robot_moveit_demo/cmake/export_denso_robot_moveit_pickandplace_scaraExport-release.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/denso_robot_moveit_demo/cmake" TYPE FILE FILES "/home/isg/workspace/denso_ros2_ws/src/build/denso_robot_moveit_demo/ament_cmake_export_targets/ament_cmake_export_targets-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/denso_robot_moveit_demo/cmake" TYPE FILE FILES
    "/home/isg/workspace/denso_ros2_ws/src/build/denso_robot_moveit_demo/ament_cmake_core/denso_robot_moveit_demoConfig.cmake"
    "/home/isg/workspace/denso_ros2_ws/src/build/denso_robot_moveit_demo/ament_cmake_core/denso_robot_moveit_demoConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/denso_robot_moveit_demo" TYPE FILE FILES "/home/isg/workspace/denso_ros2_ws/src/denso_robot_drivers_ros2/denso_robot_moveit_demo/package.xml")
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/isg/workspace/denso_ros2_ws/src/build/denso_robot_moveit_demo/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
