# CMake generated Testfile for 
# Source directory: /tmp/tmp.Sx9ws9eKT0/srsue/src
# Build directory: /tmp/tmp.Sx9ws9eKT0/cmake-build-debug/srsue/src
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(srsue_version "srsue" "--version")
add_test(srsue_help "srsue" "--help")
add_test(ue_rf_failure "srsue" "/tmp/tmp.Sx9ws9eKT0/srsue/ue.conf.example" "--rf.device_name=zmq")
subdirs("phy")
subdirs("stack")
