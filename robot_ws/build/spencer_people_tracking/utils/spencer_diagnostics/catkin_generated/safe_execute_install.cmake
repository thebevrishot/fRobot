execute_process(COMMAND "/home/anakin/Workspace/2016/Robot/fRobot/robot_ws/build/spencer_people_tracking/utils/spencer_diagnostics/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/anakin/Workspace/2016/Robot/fRobot/robot_ws/build/spencer_people_tracking/utils/spencer_diagnostics/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
