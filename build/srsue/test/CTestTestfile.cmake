# CMake generated Testfile for 
# Source directory: /home/ggarcia/srsLTE/srsue/test
# Build directory: /home/ggarcia/srsLTE/build/srsue/test
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(metrics_test "metrics_test" "-o" "/home/ggarcia/srsLTE/build/srsue/test/ue_metrics.csv")
add_test(mac_test "mac_test")
subdirs("upper")
