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
CMAKE_SOURCE_DIR = /home/xipiter/UAS-2023/xipiter_ws/src/xipiter_ros

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/xipiter/UAS-2023/build

# Include any dependencies generated for this target.
include CMakeFiles/ros_services.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/ros_services.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/ros_services.dir/flags.make

CMakeFiles/ros_services.dir/src/ros_services.cpp.o: CMakeFiles/ros_services.dir/flags.make
CMakeFiles/ros_services.dir/src/ros_services.cpp.o: /home/xipiter/UAS-2023/xipiter_ws/src/xipiter_ros/src/ros_services.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/xipiter/UAS-2023/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/ros_services.dir/src/ros_services.cpp.o"
	/usr/lib/ccache/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ros_services.dir/src/ros_services.cpp.o -c /home/xipiter/UAS-2023/xipiter_ws/src/xipiter_ros/src/ros_services.cpp

CMakeFiles/ros_services.dir/src/ros_services.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ros_services.dir/src/ros_services.cpp.i"
	/usr/lib/ccache/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/xipiter/UAS-2023/xipiter_ws/src/xipiter_ros/src/ros_services.cpp > CMakeFiles/ros_services.dir/src/ros_services.cpp.i

CMakeFiles/ros_services.dir/src/ros_services.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ros_services.dir/src/ros_services.cpp.s"
	/usr/lib/ccache/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/xipiter/UAS-2023/xipiter_ws/src/xipiter_ros/src/ros_services.cpp -o CMakeFiles/ros_services.dir/src/ros_services.cpp.s

# Object files for target ros_services
ros_services_OBJECTS = \
"CMakeFiles/ros_services.dir/src/ros_services.cpp.o"

# External object files for target ros_services
ros_services_EXTERNAL_OBJECTS =

devel/lib/libros_services.so: CMakeFiles/ros_services.dir/src/ros_services.cpp.o
devel/lib/libros_services.so: CMakeFiles/ros_services.dir/build.make
devel/lib/libros_services.so: CMakeFiles/ros_services.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/xipiter/UAS-2023/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library devel/lib/libros_services.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ros_services.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/ros_services.dir/build: devel/lib/libros_services.so

.PHONY : CMakeFiles/ros_services.dir/build

CMakeFiles/ros_services.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/ros_services.dir/cmake_clean.cmake
.PHONY : CMakeFiles/ros_services.dir/clean

CMakeFiles/ros_services.dir/depend:
	cd /home/xipiter/UAS-2023/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/xipiter/UAS-2023/xipiter_ws/src/xipiter_ros /home/xipiter/UAS-2023/xipiter_ws/src/xipiter_ros /home/xipiter/UAS-2023/build /home/xipiter/UAS-2023/build /home/xipiter/UAS-2023/build/CMakeFiles/ros_services.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/ros_services.dir/depend

