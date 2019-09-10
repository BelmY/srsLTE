cmake_minimum_required(VERSION 2.6)

execute_process(
COMMAND git rev-parse --abbrev-ref HEAD
WORKING_DIRECTORY "/tmp/tmp.Sx9ws9eKT0"
OUTPUT_VARIABLE GIT_BRANCH
OUTPUT_STRIP_TRAILING_WHITESPACE
)

execute_process(
COMMAND git log -1 --format=%h
WORKING_DIRECTORY "/tmp/tmp.Sx9ws9eKT0"
OUTPUT_VARIABLE GIT_COMMIT_HASH
OUTPUT_STRIP_TRAILING_WHITESPACE
)

message(STATUS "Generating build_info.h")
configure_file(
  /tmp/tmp.Sx9ws9eKT0/lib/include/srslte/build_info.h.in
  /tmp/tmp.Sx9ws9eKT0/cmake-build-debug/lib/include/srslte/build_info.h
)
