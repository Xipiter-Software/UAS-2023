# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/greyson/xipiter_ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/greyson/xipiter_ws/build

# Include any dependencies generated for this target.
include xipiter_ros/CMakeFiles/takeoff_demo.dir/depend.make

# Include the progress variables for this target.
include xipiter_ros/CMakeFiles/takeoff_demo.dir/progress.make

# Include the compile flags for this target's objects.
include xipiter_ros/CMakeFiles/takeoff_demo.dir/flags.make

xipiter_ros/CMakeFiles/takeoff_demo.dir/src/takeoff_demo.cpp.o: xipiter_ros/CMakeFiles/takeoff_demo.dir/flags.make
xipiter_ros/CMakeFiles/takeoff_demo.dir/src/takeoff_demo.cpp.o: /home/greyson/xipiter_ws/src/xipiter_ros/src/takeoff_demo.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/greyson/xipiter_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object xipiter_ros/CMakeFiles/takeoff_demo.dir/src/takeoff_demo.cpp.o"
	cd /home/greyson/xipiter_ws/build/xipiter_ros && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/takeoff_demo.dir/src/takeoff_demo.cpp.o -c /home/greyson/xipiter_ws/src/xipiter_ros/src/takeoff_demo.cpp

xipiter_ros/CMakeFiles/takeoff_demo.dir/src/takeoff_demo.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/takeoff_demo.dir/src/takeoff_demo.cpp.i"
	cd /home/greyson/xipiter_ws/build/xipiter_ros && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/greyson/xipiter_ws/src/xipiter_ros/src/takeoff_demo.cpp > CMakeFiles/takeoff_demo.dir/src/takeoff_demo.cpp.i

xipiter_ros/CMakeFiles/takeoff_demo.dir/src/takeoff_demo.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/takeoff_demo.dir/src/takeoff_demo.cpp.s"
	cd /home/greyson/xipiter_ws/build/xipiter_ros && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/greyson/xipiter_ws/src/xipiter_ros/src/takeoff_demo.cpp -o CMakeFiles/takeoff_demo.dir/src/takeoff_demo.cpp.s

# Object files for target takeoff_demo
takeoff_demo_OBJECTS = \
"CMakeFiles/takeoff_demo.dir/src/takeoff_demo.cpp.o"

# External object files for target takeoff_demo
takeoff_demo_EXTERNAL_OBJECTS =

/home/greyson/xipiter_ws/devel/lib/xipiter_ros/takeoff_demo: xipiter_ros/CMakeFiles/takeoff_demo.dir/src/takeoff_demo.cpp.o
/home/greyson/xipiter_ws/devel/lib/xipiter_ros/takeoff_demo: xipiter_ros/CMakeFiles/takeoff_demo.dir/build.make
/home/greyson/xipiter_ws/devel/lib/xipiter_ros/takeoff_demo: /opt/ros/noetic/lib/libroscpp.so
/home/greyson/xipiter_ws/devel/lib/xipiter_ros/takeoff_demo: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/greyson/xipiter_ws/devel/lib/xipiter_ros/takeoff_demo: /usr/lib/x86_64-linux-gnu/libboost_chrono.so.1.71.0
/home/greyson/xipiter_ws/devel/lib/xipiter_ros/takeoff_demo: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so.1.71.0
/home/greyson/xipiter_ws/devel/lib/xipiter_ros/takeoff_demo: /opt/ros/noetic/lib/librosconsole.so
/home/greyson/xipiter_ws/devel/lib/xipiter_ros/takeoff_demo: /opt/ros/noetic/lib/librosconsole_log4cxx.so
/home/greyson/xipiter_ws/devel/lib/xipiter_ros/takeoff_demo: /opt/ros/noetic/lib/librosconsole_backend_interface.so
/home/greyson/xipiter_ws/devel/lib/xipiter_ros/takeoff_demo: /usr/lib/x86_64-linux-gnu/liblog4cxx.so
/home/greyson/xipiter_ws/devel/lib/xipiter_ros/takeoff_demo: /usr/lib/x86_64-linux-gnu/libboost_regex.so.1.71.0
/home/greyson/xipiter_ws/devel/lib/xipiter_ros/takeoff_demo: /opt/ros/noetic/lib/libxmlrpcpp.so
/home/greyson/xipiter_ws/devel/lib/xipiter_ros/takeoff_demo: /opt/ros/noetic/lib/libroscpp_serialization.so
/home/greyson/xipiter_ws/devel/lib/xipiter_ros/takeoff_demo: /opt/ros/noetic/lib/librostime.so
/home/greyson/xipiter_ws/devel/lib/xipiter_ros/takeoff_demo: /usr/lib/x86_64-linux-gnu/libboost_date_time.so.1.71.0
/home/greyson/xipiter_ws/devel/lib/xipiter_ros/takeoff_demo: /opt/ros/noetic/lib/libcpp_common.so
/home/greyson/xipiter_ws/devel/lib/xipiter_ros/takeoff_demo: /usr/lib/x86_64-linux-gnu/libboost_system.so.1.71.0
/home/greyson/xipiter_ws/devel/lib/xipiter_ros/takeoff_demo: /usr/lib/x86_64-linux-gnu/libboost_thread.so.1.71.0
/home/greyson/xipiter_ws/devel/lib/xipiter_ros/takeoff_demo: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so.0.4
/home/greyson/xipiter_ws/devel/lib/xipiter_ros/takeoff_demo: xipiter_ros/CMakeFiles/takeoff_demo.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/greyson/xipiter_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/greyson/xipiter_ws/devel/lib/xipiter_ros/takeoff_demo"
	cd /home/greyson/xipiter_ws/build/xipiter_ros && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/takeoff_demo.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
xipiter_ros/CMakeFiles/takeoff_demo.dir/build: /home/greyson/xipiter_ws/devel/lib/xipiter_ros/takeoff_demo

.PHONY : xipiter_ros/CMakeFiles/takeoff_demo.dir/build

xipiter_ros/CMakeFiles/takeoff_demo.dir/clean:
	cd /home/greyson/xipiter_ws/build/xipiter_ros && $(CMAKE_COMMAND) -P CMakeFiles/takeoff_demo.dir/cmake_clean.cmake
.PHONY : xipiter_ros/CMakeFiles/takeoff_demo.dir/clean

xipiter_ros/CMakeFiles/takeoff_demo.dir/depend:
	cd /home/greyson/xipiter_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/greyson/xipiter_ws/src /home/greyson/xipiter_ws/src/xipiter_ros /home/greyson/xipiter_ws/build /home/greyson/xipiter_ws/build/xipiter_ros /home/greyson/xipiter_ws/build/xipiter_ros/CMakeFiles/takeoff_demo.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : xipiter_ros/CMakeFiles/takeoff_demo.dir/depend
