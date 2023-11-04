# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "xipiter_ros: 1 messages, 1 services")

set(MSG_I_FLAGS "-Ixipiter_ros:/home/greyson/xipiter_ws/src/xipiter_ros/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(xipiter_ros_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/greyson/xipiter_ws/src/xipiter_ros/msg/Num.msg" NAME_WE)
add_custom_target(_xipiter_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "xipiter_ros" "/home/greyson/xipiter_ws/src/xipiter_ros/msg/Num.msg" ""
)

get_filename_component(_filename "/home/greyson/xipiter_ws/src/xipiter_ros/srv/AddTwoInts.srv" NAME_WE)
add_custom_target(_xipiter_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "xipiter_ros" "/home/greyson/xipiter_ws/src/xipiter_ros/srv/AddTwoInts.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(xipiter_ros
  "/home/greyson/xipiter_ws/src/xipiter_ros/msg/Num.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/xipiter_ros
)

### Generating Services
_generate_srv_cpp(xipiter_ros
  "/home/greyson/xipiter_ws/src/xipiter_ros/srv/AddTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/xipiter_ros
)

### Generating Module File
_generate_module_cpp(xipiter_ros
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/xipiter_ros
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(xipiter_ros_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(xipiter_ros_generate_messages xipiter_ros_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/greyson/xipiter_ws/src/xipiter_ros/msg/Num.msg" NAME_WE)
add_dependencies(xipiter_ros_generate_messages_cpp _xipiter_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/greyson/xipiter_ws/src/xipiter_ros/srv/AddTwoInts.srv" NAME_WE)
add_dependencies(xipiter_ros_generate_messages_cpp _xipiter_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(xipiter_ros_gencpp)
add_dependencies(xipiter_ros_gencpp xipiter_ros_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS xipiter_ros_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(xipiter_ros
  "/home/greyson/xipiter_ws/src/xipiter_ros/msg/Num.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/xipiter_ros
)

### Generating Services
_generate_srv_eus(xipiter_ros
  "/home/greyson/xipiter_ws/src/xipiter_ros/srv/AddTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/xipiter_ros
)

### Generating Module File
_generate_module_eus(xipiter_ros
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/xipiter_ros
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(xipiter_ros_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(xipiter_ros_generate_messages xipiter_ros_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/greyson/xipiter_ws/src/xipiter_ros/msg/Num.msg" NAME_WE)
add_dependencies(xipiter_ros_generate_messages_eus _xipiter_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/greyson/xipiter_ws/src/xipiter_ros/srv/AddTwoInts.srv" NAME_WE)
add_dependencies(xipiter_ros_generate_messages_eus _xipiter_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(xipiter_ros_geneus)
add_dependencies(xipiter_ros_geneus xipiter_ros_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS xipiter_ros_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(xipiter_ros
  "/home/greyson/xipiter_ws/src/xipiter_ros/msg/Num.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/xipiter_ros
)

### Generating Services
_generate_srv_lisp(xipiter_ros
  "/home/greyson/xipiter_ws/src/xipiter_ros/srv/AddTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/xipiter_ros
)

### Generating Module File
_generate_module_lisp(xipiter_ros
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/xipiter_ros
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(xipiter_ros_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(xipiter_ros_generate_messages xipiter_ros_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/greyson/xipiter_ws/src/xipiter_ros/msg/Num.msg" NAME_WE)
add_dependencies(xipiter_ros_generate_messages_lisp _xipiter_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/greyson/xipiter_ws/src/xipiter_ros/srv/AddTwoInts.srv" NAME_WE)
add_dependencies(xipiter_ros_generate_messages_lisp _xipiter_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(xipiter_ros_genlisp)
add_dependencies(xipiter_ros_genlisp xipiter_ros_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS xipiter_ros_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(xipiter_ros
  "/home/greyson/xipiter_ws/src/xipiter_ros/msg/Num.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/xipiter_ros
)

### Generating Services
_generate_srv_nodejs(xipiter_ros
  "/home/greyson/xipiter_ws/src/xipiter_ros/srv/AddTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/xipiter_ros
)

### Generating Module File
_generate_module_nodejs(xipiter_ros
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/xipiter_ros
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(xipiter_ros_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(xipiter_ros_generate_messages xipiter_ros_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/greyson/xipiter_ws/src/xipiter_ros/msg/Num.msg" NAME_WE)
add_dependencies(xipiter_ros_generate_messages_nodejs _xipiter_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/greyson/xipiter_ws/src/xipiter_ros/srv/AddTwoInts.srv" NAME_WE)
add_dependencies(xipiter_ros_generate_messages_nodejs _xipiter_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(xipiter_ros_gennodejs)
add_dependencies(xipiter_ros_gennodejs xipiter_ros_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS xipiter_ros_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(xipiter_ros
  "/home/greyson/xipiter_ws/src/xipiter_ros/msg/Num.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/xipiter_ros
)

### Generating Services
_generate_srv_py(xipiter_ros
  "/home/greyson/xipiter_ws/src/xipiter_ros/srv/AddTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/xipiter_ros
)

### Generating Module File
_generate_module_py(xipiter_ros
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/xipiter_ros
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(xipiter_ros_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(xipiter_ros_generate_messages xipiter_ros_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/greyson/xipiter_ws/src/xipiter_ros/msg/Num.msg" NAME_WE)
add_dependencies(xipiter_ros_generate_messages_py _xipiter_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/greyson/xipiter_ws/src/xipiter_ros/srv/AddTwoInts.srv" NAME_WE)
add_dependencies(xipiter_ros_generate_messages_py _xipiter_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(xipiter_ros_genpy)
add_dependencies(xipiter_ros_genpy xipiter_ros_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS xipiter_ros_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/xipiter_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/xipiter_ros
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(xipiter_ros_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/xipiter_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/xipiter_ros
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(xipiter_ros_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/xipiter_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/xipiter_ros
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(xipiter_ros_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/xipiter_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/xipiter_ros
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(xipiter_ros_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/xipiter_ros)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/xipiter_ros\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/xipiter_ros
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(xipiter_ros_generate_messages_py std_msgs_generate_messages_py)
endif()
