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
include CMakeFiles/uas_control.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/uas_control.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/uas_control.dir/flags.make

CMakeFiles/uas_control.dir/src/uas_control.cpp.o: CMakeFiles/uas_control.dir/flags.make
CMakeFiles/uas_control.dir/src/uas_control.cpp.o: /home/xipiter/UAS-2023/xipiter_ws/src/xipiter_ros/src/uas_control.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/xipiter/UAS-2023/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/uas_control.dir/src/uas_control.cpp.o"
	/usr/lib/ccache/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/uas_control.dir/src/uas_control.cpp.o -c /home/xipiter/UAS-2023/xipiter_ws/src/xipiter_ros/src/uas_control.cpp

CMakeFiles/uas_control.dir/src/uas_control.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/uas_control.dir/src/uas_control.cpp.i"
	/usr/lib/ccache/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/xipiter/UAS-2023/xipiter_ws/src/xipiter_ros/src/uas_control.cpp > CMakeFiles/uas_control.dir/src/uas_control.cpp.i

CMakeFiles/uas_control.dir/src/uas_control.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/uas_control.dir/src/uas_control.cpp.s"
	/usr/lib/ccache/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/xipiter/UAS-2023/xipiter_ws/src/xipiter_ros/src/uas_control.cpp -o CMakeFiles/uas_control.dir/src/uas_control.cpp.s

# Object files for target uas_control
uas_control_OBJECTS = \
"CMakeFiles/uas_control.dir/src/uas_control.cpp.o"

# External object files for target uas_control
uas_control_EXTERNAL_OBJECTS =

devel/lib/libuas_control.so: CMakeFiles/uas_control.dir/src/uas_control.cpp.o
devel/lib/libuas_control.so: CMakeFiles/uas_control.dir/build.make
devel/lib/libuas_control.so: CMakeFiles/uas_control.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/xipiter/UAS-2023/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library devel/lib/libuas_control.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/uas_control.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/uas_control.dir/build: devel/lib/libuas_control.so

.PHONY : CMakeFiles/uas_control.dir/build

CMakeFiles/uas_control.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/uas_control.dir/cmake_clean.cmake
.PHONY : CMakeFiles/uas_control.dir/clean

CMakeFiles/uas_control.dir/depend:
	cd /home/xipiter/UAS-2023/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/xipiter/UAS-2023/xipiter_ws/src/xipiter_ros /home/xipiter/UAS-2023/xipiter_ws/src/xipiter_ros /home/xipiter/UAS-2023/build /home/xipiter/UAS-2023/build /home/xipiter/UAS-2023/build/CMakeFiles/uas_control.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/uas_control.dir/depend

