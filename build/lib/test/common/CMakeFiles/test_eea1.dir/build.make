# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

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
CMAKE_SOURCE_DIR = /home/ggarcia/srsLTE

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ggarcia/srsLTE/build

# Include any dependencies generated for this target.
include lib/test/common/CMakeFiles/test_eea1.dir/depend.make

# Include the progress variables for this target.
include lib/test/common/CMakeFiles/test_eea1.dir/progress.make

# Include the compile flags for this target's objects.
include lib/test/common/CMakeFiles/test_eea1.dir/flags.make

lib/test/common/CMakeFiles/test_eea1.dir/test_eea1.cc.o: lib/test/common/CMakeFiles/test_eea1.dir/flags.make
lib/test/common/CMakeFiles/test_eea1.dir/test_eea1.cc.o: ../lib/test/common/test_eea1.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ggarcia/srsLTE/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object lib/test/common/CMakeFiles/test_eea1.dir/test_eea1.cc.o"
	cd /home/ggarcia/srsLTE/build/lib/test/common && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/test_eea1.dir/test_eea1.cc.o -c /home/ggarcia/srsLTE/lib/test/common/test_eea1.cc

lib/test/common/CMakeFiles/test_eea1.dir/test_eea1.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_eea1.dir/test_eea1.cc.i"
	cd /home/ggarcia/srsLTE/build/lib/test/common && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ggarcia/srsLTE/lib/test/common/test_eea1.cc > CMakeFiles/test_eea1.dir/test_eea1.cc.i

lib/test/common/CMakeFiles/test_eea1.dir/test_eea1.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_eea1.dir/test_eea1.cc.s"
	cd /home/ggarcia/srsLTE/build/lib/test/common && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ggarcia/srsLTE/lib/test/common/test_eea1.cc -o CMakeFiles/test_eea1.dir/test_eea1.cc.s

lib/test/common/CMakeFiles/test_eea1.dir/test_eea1.cc.o.requires:

.PHONY : lib/test/common/CMakeFiles/test_eea1.dir/test_eea1.cc.o.requires

lib/test/common/CMakeFiles/test_eea1.dir/test_eea1.cc.o.provides: lib/test/common/CMakeFiles/test_eea1.dir/test_eea1.cc.o.requires
	$(MAKE) -f lib/test/common/CMakeFiles/test_eea1.dir/build.make lib/test/common/CMakeFiles/test_eea1.dir/test_eea1.cc.o.provides.build
.PHONY : lib/test/common/CMakeFiles/test_eea1.dir/test_eea1.cc.o.provides

lib/test/common/CMakeFiles/test_eea1.dir/test_eea1.cc.o.provides.build: lib/test/common/CMakeFiles/test_eea1.dir/test_eea1.cc.o


# Object files for target test_eea1
test_eea1_OBJECTS = \
"CMakeFiles/test_eea1.dir/test_eea1.cc.o"

# External object files for target test_eea1
test_eea1_EXTERNAL_OBJECTS =

lib/test/common/test_eea1: lib/test/common/CMakeFiles/test_eea1.dir/test_eea1.cc.o
lib/test/common/test_eea1: lib/test/common/CMakeFiles/test_eea1.dir/build.make
lib/test/common/test_eea1: lib/src/common/libsrslte_common.a
lib/test/common/test_eea1: lib/src/phy/libsrslte_phy.a
lib/test/common/test_eea1: /usr/lib/x86_64-linux-gnu/libfftw3f.so
lib/test/common/test_eea1: /usr/lib/x86_64-linux-gnu/libmbedcrypto.so
lib/test/common/test_eea1: lib/test/common/CMakeFiles/test_eea1.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ggarcia/srsLTE/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable test_eea1"
	cd /home/ggarcia/srsLTE/build/lib/test/common && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_eea1.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
lib/test/common/CMakeFiles/test_eea1.dir/build: lib/test/common/test_eea1

.PHONY : lib/test/common/CMakeFiles/test_eea1.dir/build

lib/test/common/CMakeFiles/test_eea1.dir/requires: lib/test/common/CMakeFiles/test_eea1.dir/test_eea1.cc.o.requires

.PHONY : lib/test/common/CMakeFiles/test_eea1.dir/requires

lib/test/common/CMakeFiles/test_eea1.dir/clean:
	cd /home/ggarcia/srsLTE/build/lib/test/common && $(CMAKE_COMMAND) -P CMakeFiles/test_eea1.dir/cmake_clean.cmake
.PHONY : lib/test/common/CMakeFiles/test_eea1.dir/clean

lib/test/common/CMakeFiles/test_eea1.dir/depend:
	cd /home/ggarcia/srsLTE/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ggarcia/srsLTE /home/ggarcia/srsLTE/lib/test/common /home/ggarcia/srsLTE/build /home/ggarcia/srsLTE/build/lib/test/common /home/ggarcia/srsLTE/build/lib/test/common/CMakeFiles/test_eea1.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lib/test/common/CMakeFiles/test_eea1.dir/depend

