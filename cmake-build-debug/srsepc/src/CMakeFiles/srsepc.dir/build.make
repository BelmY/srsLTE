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
CMAKE_SOURCE_DIR = /tmp/tmp.Sx9ws9eKT0

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /tmp/tmp.Sx9ws9eKT0/cmake-build-debug

# Include any dependencies generated for this target.
include srsepc/src/CMakeFiles/srsepc.dir/depend.make

# Include the progress variables for this target.
include srsepc/src/CMakeFiles/srsepc.dir/progress.make

# Include the compile flags for this target's objects.
include srsepc/src/CMakeFiles/srsepc.dir/flags.make

srsepc/src/CMakeFiles/srsepc.dir/main.cc.o: srsepc/src/CMakeFiles/srsepc.dir/flags.make
srsepc/src/CMakeFiles/srsepc.dir/main.cc.o: ../srsepc/src/main.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/tmp/tmp.Sx9ws9eKT0/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object srsepc/src/CMakeFiles/srsepc.dir/main.cc.o"
	cd /tmp/tmp.Sx9ws9eKT0/cmake-build-debug/srsepc/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/srsepc.dir/main.cc.o -c /tmp/tmp.Sx9ws9eKT0/srsepc/src/main.cc

srsepc/src/CMakeFiles/srsepc.dir/main.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/srsepc.dir/main.cc.i"
	cd /tmp/tmp.Sx9ws9eKT0/cmake-build-debug/srsepc/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /tmp/tmp.Sx9ws9eKT0/srsepc/src/main.cc > CMakeFiles/srsepc.dir/main.cc.i

srsepc/src/CMakeFiles/srsepc.dir/main.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/srsepc.dir/main.cc.s"
	cd /tmp/tmp.Sx9ws9eKT0/cmake-build-debug/srsepc/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /tmp/tmp.Sx9ws9eKT0/srsepc/src/main.cc -o CMakeFiles/srsepc.dir/main.cc.s

srsepc/src/CMakeFiles/srsepc.dir/main.cc.o.requires:

.PHONY : srsepc/src/CMakeFiles/srsepc.dir/main.cc.o.requires

srsepc/src/CMakeFiles/srsepc.dir/main.cc.o.provides: srsepc/src/CMakeFiles/srsepc.dir/main.cc.o.requires
	$(MAKE) -f srsepc/src/CMakeFiles/srsepc.dir/build.make srsepc/src/CMakeFiles/srsepc.dir/main.cc.o.provides.build
.PHONY : srsepc/src/CMakeFiles/srsepc.dir/main.cc.o.provides

srsepc/src/CMakeFiles/srsepc.dir/main.cc.o.provides.build: srsepc/src/CMakeFiles/srsepc.dir/main.cc.o


# Object files for target srsepc
srsepc_OBJECTS = \
"CMakeFiles/srsepc.dir/main.cc.o"

# External object files for target srsepc
srsepc_EXTERNAL_OBJECTS =

srsepc/src/srsepc: srsepc/src/CMakeFiles/srsepc.dir/main.cc.o
srsepc/src/srsepc: srsepc/src/CMakeFiles/srsepc.dir/build.make
srsepc/src/srsepc: srsepc/src/mme/libsrsepc_mme.a
srsepc/src/srsepc: srsepc/src/hss/libsrsepc_hss.a
srsepc/src/srsepc: srsepc/src/spgw/libsrsepc_sgw.a
srsepc/src/srsepc: lib/src/upper/libsrslte_upper.a
srsepc/src/srsepc: lib/src/common/libsrslte_common.a
srsepc/src/srsepc: /usr/lib/x86_64-linux-gnu/libboost_program_options.so
srsepc/src/srsepc: /usr/lib/x86_64-linux-gnu/libmbedcrypto.so
srsepc/src/srsepc: /usr/lib/x86_64-linux-gnu/libconfig++.so
srsepc/src/srsepc: /usr/lib/x86_64-linux-gnu/libsctp.so
srsepc/src/srsepc: lib/src/phy/libsrslte_phy.a
srsepc/src/srsepc: /usr/lib/x86_64-linux-gnu/libfftw3f.so
srsepc/src/srsepc: lib/src/asn1/libsrslte_asn1.a
srsepc/src/srsepc: srsepc/src/CMakeFiles/srsepc.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/tmp/tmp.Sx9ws9eKT0/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable srsepc"
	cd /tmp/tmp.Sx9ws9eKT0/cmake-build-debug/srsepc/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/srsepc.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
srsepc/src/CMakeFiles/srsepc.dir/build: srsepc/src/srsepc

.PHONY : srsepc/src/CMakeFiles/srsepc.dir/build

srsepc/src/CMakeFiles/srsepc.dir/requires: srsepc/src/CMakeFiles/srsepc.dir/main.cc.o.requires

.PHONY : srsepc/src/CMakeFiles/srsepc.dir/requires

srsepc/src/CMakeFiles/srsepc.dir/clean:
	cd /tmp/tmp.Sx9ws9eKT0/cmake-build-debug/srsepc/src && $(CMAKE_COMMAND) -P CMakeFiles/srsepc.dir/cmake_clean.cmake
.PHONY : srsepc/src/CMakeFiles/srsepc.dir/clean

srsepc/src/CMakeFiles/srsepc.dir/depend:
	cd /tmp/tmp.Sx9ws9eKT0/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /tmp/tmp.Sx9ws9eKT0 /tmp/tmp.Sx9ws9eKT0/srsepc/src /tmp/tmp.Sx9ws9eKT0/cmake-build-debug /tmp/tmp.Sx9ws9eKT0/cmake-build-debug/srsepc/src /tmp/tmp.Sx9ws9eKT0/cmake-build-debug/srsepc/src/CMakeFiles/srsepc.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : srsepc/src/CMakeFiles/srsepc.dir/depend

