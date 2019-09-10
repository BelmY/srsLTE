# CMake generated Testfile for 
# Source directory: /tmp/tmp.Sx9ws9eKT0/srsue/test
# Build directory: /tmp/tmp.Sx9ws9eKT0/cmake-build-debug/srsue/test
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(metrics_test "metrics_test" "-o" "/tmp/tmp.Sx9ws9eKT0/cmake-build-debug/srsue/test/ue_metrics.csv")
add_test(mac_test "mac_test")
subdirs("upper")
