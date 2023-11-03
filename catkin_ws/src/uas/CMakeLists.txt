cmake_minimum_required(VERSION 3.0.2)
project(uas)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
)

## Generate messages in the 'msg' folder
# add_message_files(
#   FILES
#   Message1.msg
#   Message2.msg
# )

## Generate services in the 'srv' folder
# add_service_files(
#   FILES
#   Service1.srv
#   Service2.srv
# )

catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES uas
#  CATKIN_DEPENDS roscpp rospy std_msgs
#  DEPENDS system_lib
)

include_directories(
# include
  ${catkin_INCLUDE_DIRS}
)

add_executable(uas_mission src/uas_mission.cpp)
target_link_libraries(uas_mission ${catkin_LIBRARIES})
# add_dependencies(uas_arm uas_gencpp)
