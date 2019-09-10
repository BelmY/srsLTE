# CMake generated Testfile for 
# Source directory: /tmp/tmp.Sx9ws9eKT0/lib/src/phy/dft/test
# Build directory: /tmp/tmp.Sx9ws9eKT0/cmake-build-debug/lib/src/phy/dft/test
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(ofdm_normal "ofdm_test")
add_test(ofdm_extended "ofdm_test" "-e")
add_test(ofdm_normal_single "ofdm_test" "-n" "6")
add_test(ofdm_extended_single "ofdm_test" "-e" "-n" "6")
