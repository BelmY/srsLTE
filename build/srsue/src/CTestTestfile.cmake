# CMake generated Testfile for 
# Source directory: /home/ggarcia/srsLTE/srsue/src
# Build directory: /home/ggarcia/srsLTE/build/srsue/src
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(srsue_version "srsue" "--version")
add_test(srsue_help "srsue" "--help")
add_test(ue_rf_failure "srsue" "/home/ggarcia/srsLTE/srsue/ue.conf.example" "--rf.device_name=zmq")
subdirs("phy")
subdirs("stack")
