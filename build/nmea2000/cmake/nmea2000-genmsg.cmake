# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "nmea2000: 2 messages, 0 services")

set(MSG_I_FLAGS "-Inmea2000:/home/ubuntu/Documents/test_ws/src/nmea2000/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(nmea2000_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ubuntu/Documents/test_ws/src/nmea2000/msg/Magnetometer.msg" NAME_WE)
add_custom_target(_nmea2000_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "nmea2000" "/home/ubuntu/Documents/test_ws/src/nmea2000/msg/Magnetometer.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/ubuntu/Documents/test_ws/src/nmea2000/msg/Cartesian.msg" NAME_WE)
add_custom_target(_nmea2000_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "nmea2000" "/home/ubuntu/Documents/test_ws/src/nmea2000/msg/Cartesian.msg" "std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(nmea2000
  "/home/ubuntu/Documents/test_ws/src/nmea2000/msg/Magnetometer.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nmea2000
)
_generate_msg_cpp(nmea2000
  "/home/ubuntu/Documents/test_ws/src/nmea2000/msg/Cartesian.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nmea2000
)

### Generating Services

### Generating Module File
_generate_module_cpp(nmea2000
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nmea2000
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(nmea2000_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(nmea2000_generate_messages nmea2000_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/Documents/test_ws/src/nmea2000/msg/Magnetometer.msg" NAME_WE)
add_dependencies(nmea2000_generate_messages_cpp _nmea2000_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/Documents/test_ws/src/nmea2000/msg/Cartesian.msg" NAME_WE)
add_dependencies(nmea2000_generate_messages_cpp _nmea2000_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(nmea2000_gencpp)
add_dependencies(nmea2000_gencpp nmea2000_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS nmea2000_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(nmea2000
  "/home/ubuntu/Documents/test_ws/src/nmea2000/msg/Magnetometer.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nmea2000
)
_generate_msg_eus(nmea2000
  "/home/ubuntu/Documents/test_ws/src/nmea2000/msg/Cartesian.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nmea2000
)

### Generating Services

### Generating Module File
_generate_module_eus(nmea2000
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nmea2000
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(nmea2000_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(nmea2000_generate_messages nmea2000_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/Documents/test_ws/src/nmea2000/msg/Magnetometer.msg" NAME_WE)
add_dependencies(nmea2000_generate_messages_eus _nmea2000_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/Documents/test_ws/src/nmea2000/msg/Cartesian.msg" NAME_WE)
add_dependencies(nmea2000_generate_messages_eus _nmea2000_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(nmea2000_geneus)
add_dependencies(nmea2000_geneus nmea2000_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS nmea2000_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(nmea2000
  "/home/ubuntu/Documents/test_ws/src/nmea2000/msg/Magnetometer.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nmea2000
)
_generate_msg_lisp(nmea2000
  "/home/ubuntu/Documents/test_ws/src/nmea2000/msg/Cartesian.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nmea2000
)

### Generating Services

### Generating Module File
_generate_module_lisp(nmea2000
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nmea2000
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(nmea2000_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(nmea2000_generate_messages nmea2000_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/Documents/test_ws/src/nmea2000/msg/Magnetometer.msg" NAME_WE)
add_dependencies(nmea2000_generate_messages_lisp _nmea2000_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/Documents/test_ws/src/nmea2000/msg/Cartesian.msg" NAME_WE)
add_dependencies(nmea2000_generate_messages_lisp _nmea2000_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(nmea2000_genlisp)
add_dependencies(nmea2000_genlisp nmea2000_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS nmea2000_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(nmea2000
  "/home/ubuntu/Documents/test_ws/src/nmea2000/msg/Magnetometer.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/nmea2000
)
_generate_msg_nodejs(nmea2000
  "/home/ubuntu/Documents/test_ws/src/nmea2000/msg/Cartesian.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/nmea2000
)

### Generating Services

### Generating Module File
_generate_module_nodejs(nmea2000
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/nmea2000
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(nmea2000_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(nmea2000_generate_messages nmea2000_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/Documents/test_ws/src/nmea2000/msg/Magnetometer.msg" NAME_WE)
add_dependencies(nmea2000_generate_messages_nodejs _nmea2000_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/Documents/test_ws/src/nmea2000/msg/Cartesian.msg" NAME_WE)
add_dependencies(nmea2000_generate_messages_nodejs _nmea2000_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(nmea2000_gennodejs)
add_dependencies(nmea2000_gennodejs nmea2000_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS nmea2000_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(nmea2000
  "/home/ubuntu/Documents/test_ws/src/nmea2000/msg/Magnetometer.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nmea2000
)
_generate_msg_py(nmea2000
  "/home/ubuntu/Documents/test_ws/src/nmea2000/msg/Cartesian.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nmea2000
)

### Generating Services

### Generating Module File
_generate_module_py(nmea2000
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nmea2000
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(nmea2000_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(nmea2000_generate_messages nmea2000_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/Documents/test_ws/src/nmea2000/msg/Magnetometer.msg" NAME_WE)
add_dependencies(nmea2000_generate_messages_py _nmea2000_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/Documents/test_ws/src/nmea2000/msg/Cartesian.msg" NAME_WE)
add_dependencies(nmea2000_generate_messages_py _nmea2000_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(nmea2000_genpy)
add_dependencies(nmea2000_genpy nmea2000_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS nmea2000_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nmea2000)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nmea2000
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(nmea2000_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nmea2000)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nmea2000
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(nmea2000_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nmea2000)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nmea2000
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(nmea2000_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/nmea2000)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/nmea2000
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(nmea2000_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nmea2000)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nmea2000\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nmea2000
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(nmea2000_generate_messages_py std_msgs_generate_messages_py)
endif()
