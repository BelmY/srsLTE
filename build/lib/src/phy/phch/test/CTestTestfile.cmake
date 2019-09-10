# CMake generated Testfile for 
# Source directory: /home/ggarcia/srsLTE/lib/src/phy/phch/test
# Build directory: /home/ggarcia/srsLTE/build/lib/src/phy/phch/test
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(pbch_test_6 "pbch_test" "-p" "1" "-n" "6" "-c" "100")
add_test(pbch_test_62 "pbch_test" "-p" "2" "-n" "6" "-c" "100")
add_test(pbch_test_64 "pbch_test" "-p" "4" "-n" "6" "-c" "100")
add_test(pbch_test_50 "pbch_test" "-p" "1" "-n" "50" "-c" "50")
add_test(pbch_test_502 "pbch_test" "-p" "2" "-n" "50" "-c" "50")
add_test(pbch_test_504 "pbch_test" "-p" "4" "-n" "50" "-c" "50")
add_test(pcfich_test_6 "pcfich_test" "-p" "1" "-n" "6")
add_test(pcfich_test_62 "pcfich_test" "-p" "2" "-n" "6")
add_test(pcfich_test_64 "pcfich_test" "-p" "4" "-n" "6")
add_test(pcfich_test_10 "pcfich_test" "-p" "1" "-n" "10")
add_test(pcfich_test_102 "pcfich_test" "-p" "2" "-n" "10")
add_test(pcfich_test_104 "pcfich_test" "-p" "4" "-n" "10")
add_test(phich_test_6 "phich_test" "-p" "1" "-n" "6")
add_test(phich_test_62 "phich_test" "-p" "2" "-n" "6")
add_test(phich_test_64 "phich_test" "-p" "4" "-n" "6" "-g" "1/6")
add_test(phich_test_6e "phich_test" "-p" "1" "-n" "6" "-e")
add_test(phich_test_62e "phich_test" "-p" "2" "-n" "6" "-e" "-l")
add_test(phich_test_64e "phich_test" "-p" "4" "-n" "6" "-e" "-l" "-g" "2")
add_test(phich_test_10 "phich_test" "-p" "1" "-n" "10" "-e")
add_test(phich_test_102 "phich_test" "-p" "2" "-n" "10" "-g" "2")
add_test(phich_test_104 "phich_test" "-p" "4" "-n" "10" "-e" "-l" "-g" "1/2")
add_test(pdcch_test_6 "pdcch_test" "-n" "6")
add_test(pdcch_test_15 "pdcch_test" "-n" "15")
add_test(pdcch_test_25 "pdcch_test" "-n" "25")
add_test(pdcch_test_50 "pdcch_test" "-n" "50")
add_test(pdcch_test_75 "pdcch_test" "-n" "75")
add_test(pdcch_test_100 "pdcch_test" "-n" "100")
add_test(pdcch_test_6_mimo "pdcch_test" "-n" "6" "-p" "2")
add_test(pdcch_test_15_mimo "pdcch_test" "-n" "15" "-p" "2")
add_test(pdcch_test_25_mimo "pdcch_test" "-n" "25" "-p" "2")
add_test(pdcch_test_50_mimo "pdcch_test" "-n" "50" "-p" "2")
add_test(pdcch_test_75_mimo "pdcch_test" "-n" "75" "-p" "2")
add_test(pdcch_test_100_mimo "pdcch_test" "-n" "100" "-p" "2")
add_test(pdsch_test_qpsk "pdsch_test" "-m" "10" "-n" "50" "-r" "1")
add_test(pdsch_test_qam16 "pdsch_test" "-m" "20" "-n" "100" "-r" "2")
add_test(pdsch_test_qam64 "pdsch_test" "-n" "100")
add_test(pdsch_test_sin_6 "pdsch_test" "-x" "1" "-a" "2" "-n" "6")
add_test(pdsch_test_sin_12 "pdsch_test" "-x" "1" "-a" "2" "-n" "12")
add_test(pdsch_test_sin_25 "pdsch_test" "-x" "1" "-a" "2" "-n" "25")
add_test(pdsch_test_sin_50 "pdsch_test" "-x" "1" "-a" "2" "-n" "50")
add_test(pdsch_test_sin_75 "pdsch_test" "-x" "1" "-a" "2" "-n" "75")
add_test(pdsch_test_sin_100 "pdsch_test" "-x" "1" "-a" "2" "-n" "100")
add_test(pdsch_test_div_6 "pdsch_test" "-x" "2" "-a" "2" "-n" "6")
add_test(pdsch_test_div_12 "pdsch_test" "-x" "2" "-a" "2" "-n" "12")
add_test(pdsch_test_div_25 "pdsch_test" "-x" "2" "-a" "2" "-n" "25")
add_test(pdsch_test_div_50 "pdsch_test" "-x" "2" "-a" "2" "-n" "50")
add_test(pdsch_test_div_75 "pdsch_test" "-x" "2" "-a" "2" "-n" "75")
add_test(pdsch_test_div_100 "pdsch_test" "-x" "2" "-a" "2" "-n" "100")
add_test(pdsch_test_cdd_6 "pdsch_test" "-x" "3" "-a" "2" "-t" "0" "-m" "27" "-M" "27" "-n" "6" "-q")
add_test(pdsch_test_cdd_12 "pdsch_test" "-x" "3" "-a" "2" "-t" "0" "-m" "27" "-M" "27" "-n" "12" "-q")
add_test(pdsch_test_cdd_25 "pdsch_test" "-x" "3" "-a" "2" "-t" "0" "-m" "27" "-M" "27" "-n" "25" "-q")
add_test(pdsch_test_cdd_50 "pdsch_test" "-x" "3" "-a" "2" "-t" "0" "-m" "27" "-M" "27" "-n" "50" "-q")
add_test(pdsch_test_cdd_75 "pdsch_test" "-x" "3" "-a" "2" "-t" "0" "-m" "27" "-M" "27" "-n" "75" "-q")
add_test(pdsch_test_cdd_100 "pdsch_test" "-x" "3" "-a" "2" "-t" "0" "-m" "27" "-M" "27" "-n" "100" "-q")
add_test(pdsch_test_multiplex1cw_p0_6 "pdsch_test" "-x" "4" "-a" "2" "-p" "0" "-n" "6")
add_test(pdsch_test_multiplex1cw_p0_12 "pdsch_test" "-x" "4" "-a" "2" "-p" "0" "-n" "12")
add_test(pdsch_test_multiplex1cw_p0_25 "pdsch_test" "-x" "4" "-a" "2" "-p" "0" "-n" "25")
add_test(pdsch_test_multiplex1cw_p0_50 "pdsch_test" "-x" "4" "-a" "2" "-p" "0" "-n" "50")
add_test(pdsch_test_multiplex1cw_p0_75 "pdsch_test" "-x" "4" "-a" "2" "-p" "0" "-n" "75")
add_test(pdsch_test_multiplex1cw_p0_100 "pdsch_test" "-x" "4" "-a" "2" "-p" "0" "-n" "100")
add_test(pdsch_test_multiplex1cw_p0_swap_6 "pdsch_test" "-x" "4" "-a" "2" "-p" "0" "-w" "-n" "6")
add_test(pdsch_test_multiplex1cw_p0_swap_12 "pdsch_test" "-x" "4" "-a" "2" "-p" "0" "-w" "-n" "12")
add_test(pdsch_test_multiplex1cw_p0_swap_25 "pdsch_test" "-x" "4" "-a" "2" "-p" "0" "-w" "-n" "25")
add_test(pdsch_test_multiplex1cw_p0_swap_50 "pdsch_test" "-x" "4" "-a" "2" "-p" "0" "-w" "-n" "50")
add_test(pdsch_test_multiplex1cw_p0_swap_75 "pdsch_test" "-x" "4" "-a" "2" "-p" "0" "-w" "-n" "75")
add_test(pdsch_test_multiplex1cw_p0_swap_100 "pdsch_test" "-x" "4" "-a" "2" "-p" "0" "-w" "-n" "100")
add_test(pdsch_test_multiplex1cw_p1_6 "pdsch_test" "-x" "4" "-a" "2" "-p" "1" "-n" "6")
add_test(pdsch_test_multiplex1cw_p1_12 "pdsch_test" "-x" "4" "-a" "2" "-p" "1" "-n" "12")
add_test(pdsch_test_multiplex1cw_p1_25 "pdsch_test" "-x" "4" "-a" "2" "-p" "1" "-n" "25")
add_test(pdsch_test_multiplex1cw_p1_50 "pdsch_test" "-x" "4" "-a" "2" "-p" "1" "-n" "50")
add_test(pdsch_test_multiplex1cw_p1_75 "pdsch_test" "-x" "4" "-a" "2" "-p" "1" "-n" "75")
add_test(pdsch_test_multiplex1cw_p1_100 "pdsch_test" "-x" "4" "-a" "2" "-p" "1" "-n" "100")
add_test(pdsch_test_multiplex1cw_p2_6 "pdsch_test" "-x" "4" "-a" "2" "-p" "2" "-n" "6")
add_test(pdsch_test_multiplex1cw_p2_12 "pdsch_test" "-x" "4" "-a" "2" "-p" "2" "-n" "12")
add_test(pdsch_test_multiplex1cw_p2_25 "pdsch_test" "-x" "4" "-a" "2" "-p" "2" "-n" "25")
add_test(pdsch_test_multiplex1cw_p2_50 "pdsch_test" "-x" "4" "-a" "2" "-p" "2" "-n" "50")
add_test(pdsch_test_multiplex1cw_p2_75 "pdsch_test" "-x" "4" "-a" "2" "-p" "2" "-n" "75")
add_test(pdsch_test_multiplex1cw_p2_100 "pdsch_test" "-x" "4" "-a" "2" "-p" "2" "-n" "100")
add_test(pdsch_test_multiplex1cw_p3_6 "pdsch_test" "-x" "4" "-a" "2" "-p" "3" "-n" "6")
add_test(pdsch_test_multiplex1cw_p3_12 "pdsch_test" "-x" "4" "-a" "2" "-p" "3" "-n" "12")
add_test(pdsch_test_multiplex1cw_p3_25 "pdsch_test" "-x" "4" "-a" "2" "-p" "3" "-n" "25")
add_test(pdsch_test_multiplex1cw_p3_50 "pdsch_test" "-x" "4" "-a" "2" "-p" "3" "-n" "50")
add_test(pdsch_test_multiplex1cw_p3_75 "pdsch_test" "-x" "4" "-a" "2" "-p" "3" "-n" "75")
add_test(pdsch_test_multiplex1cw_p3_100 "pdsch_test" "-x" "4" "-a" "2" "-p" "3" "-n" "100")
add_test(pdsch_test_multiplex2cw_p0_6 "pdsch_test" "-x" "4" "-a" "2" "-t" "0" "-p" "0" "-n" "6")
add_test(pdsch_test_multiplex2cw_p0_12 "pdsch_test" "-x" "4" "-a" "2" "-t" "0" "-p" "0" "-n" "12")
add_test(pdsch_test_multiplex2cw_p0_25 "pdsch_test" "-x" "4" "-a" "2" "-t" "0" "-p" "0" "-n" "25")
add_test(pdsch_test_multiplex2cw_p0_50 "pdsch_test" "-x" "4" "-a" "2" "-t" "0" "-p" "0" "-n" "50")
add_test(pdsch_test_multiplex2cw_p0_75 "pdsch_test" "-x" "4" "-a" "2" "-t" "0" "-p" "0" "-n" "75")
add_test(pdsch_test_multiplex2cw_p0_100 "pdsch_test" "-x" "4" "-a" "2" "-t" "0" "-p" "0" "-n" "100")
add_test(pdsch_test_multiplex2cw_p0_6_swap "pdsch_test" "-x" "4" "-a" "2" "-t" "0" "-p" "0" "-M" "28" "-n" "6" "-w" "-F" "1")
add_test(pdsch_test_multiplex2cw_p0_12_swap "pdsch_test" "-x" "4" "-a" "2" "-t" "0" "-p" "0" "-m" "28" "-n" "12" "-w")
add_test(pdsch_test_multiplex2cw_p0_25_swap "pdsch_test" "-x" "4" "-a" "2" "-t" "0" "-p" "0" "-M" "28" "-n" "25" "-w")
add_test(pdsch_test_multiplex2cw_p0_50_swap "pdsch_test" "-x" "4" "-a" "2" "-t" "0" "-p" "0" "-m" "28" "-n" "50" "-w")
add_test(pdsch_test_multiplex2cw_p0_75_swap "pdsch_test" "-x" "4" "-a" "2" "-t" "0" "-p" "0" "-M" "28" "-n" "75" "-w")
add_test(pdsch_test_multiplex2cw_p0_100_swap "pdsch_test" "-x" "4" "-a" "2" "-t" "0" "-p" "0" "-m" "28" "-n" "100" "-w")
add_test(pdsch_test_multiplex2cw_p1_6 "pdsch_test" "-x" "4" "-a" "2" "-t" "0" "-p" "1" "-n" "6")
add_test(pdsch_test_multiplex2cw_p1_12 "pdsch_test" "-x" "4" "-a" "2" "-t" "0" "-p" "1" "-n" "12")
add_test(pdsch_test_multiplex2cw_p1_25 "pdsch_test" "-x" "4" "-a" "2" "-t" "0" "-p" "1" "-n" "25")
add_test(pdsch_test_multiplex2cw_p1_50 "pdsch_test" "-x" "4" "-a" "2" "-t" "0" "-p" "1" "-n" "50")
add_test(pdsch_test_multiplex2cw_p1_75 "pdsch_test" "-x" "4" "-a" "2" "-t" "0" "-p" "1" "-n" "75")
add_test(pdsch_test_multiplex2cw_p1_100 "pdsch_test" "-x" "4" "-a" "2" "-t" "0" "-p" "1" "-n" "100")
add_test(pmch_test_qpsk "pmch_test" "-m" "6" "-n" "50")
add_test(pmch_test_qam16 "pmch_test" "-m" "15" "-n" "100")
add_test(pmch_test_qam64 "pmch_test" "-m" "25" "-n" "100")
add_test(pbch_file_test "pbch_file_test" "-i" "/home/ggarcia/srsLTE/lib/src/phy/phch/test/signal.1.92M.dat")
add_test(pcfich_file_test "pcfich_file_test" "-c" "150" "-n" "50" "-p" "2" "-i" "/home/ggarcia/srsLTE/lib/src/phy/phch/test/signal.10M.dat")
add_test(phich_file_test "phich_file_test" "-c" "150" "-n" "50" "-p" "2" "-i" "/home/ggarcia/srsLTE/lib/src/phy/phch/test/signal.10M.dat")
add_test(pdcch_file_test "pdcch_file_test" "-c" "1" "-f" "3" "-n" "6" "-p" "1" "-i" "/home/ggarcia/srsLTE/lib/src/phy/phch/test/signal.1.92M.amar.dat")
add_test(pdsch_pdcch_file_test "pdsch_pdcch_file_test" "-c" "1" "-f" "3" "-n" "6" "-p" "1" "-i" "/home/ggarcia/srsLTE/lib/src/phy/phch/test/signal.1.92M.amar.dat")
add_test(pmch_file_test "pmch_file_test" "-i" "/home/ggarcia/srsLTE/lib/src/phy/phch/test/pmch_100prbs_MCS2_SR0.bin")
add_test(pusch_test-n50-L50-m0 "pusch_test" "-n" "50" "-L" "50" "-m" "0")
add_test(pusch_test-n50-L50-pcqiwideband-m0 "pusch_test" "-n" "50" "-L" "50" "-p" "cqi" "wideband" "-m" "0")
add_test(pusch_test-n50-L50-puci_ack0-m0 "pusch_test" "-n" "50" "-L" "50" "-p" "uci_ack" "0" "-m" "0")
add_test(pusch_test-n50-L50-puci_ack0-pcqiwideband-m0 "pusch_test" "-n" "50" "-L" "50" "-p" "uci_ack" "0" "-p" "cqi" "wideband" "-m" "0")
add_test(pusch_test-n50-L50-m10 "pusch_test" "-n" "50" "-L" "50" "-m" "10")
add_test(pusch_test-n50-L50-pcqiwideband-m10 "pusch_test" "-n" "50" "-L" "50" "-p" "cqi" "wideband" "-m" "10")
add_test(pusch_test-n50-L50-puci_ack0-m10 "pusch_test" "-n" "50" "-L" "50" "-p" "uci_ack" "0" "-m" "10")
add_test(pusch_test-n50-L50-puci_ack0-pcqiwideband-m10 "pusch_test" "-n" "50" "-L" "50" "-p" "uci_ack" "0" "-p" "cqi" "wideband" "-m" "10")
add_test(pusch_test-n50-L50-m20 "pusch_test" "-n" "50" "-L" "50" "-m" "20")
add_test(pusch_test-n50-L50-pcqiwideband-m20 "pusch_test" "-n" "50" "-L" "50" "-p" "cqi" "wideband" "-m" "20")
add_test(pusch_test-n50-L50-puci_ack0-m20 "pusch_test" "-n" "50" "-L" "50" "-p" "uci_ack" "0" "-m" "20")
add_test(pusch_test-n50-L50-puci_ack0-pcqiwideband-m20 "pusch_test" "-n" "50" "-L" "50" "-p" "uci_ack" "0" "-p" "cqi" "wideband" "-m" "20")
add_test(pusch_test-n75-L50-m0 "pusch_test" "-n" "75" "-L" "50" "-m" "0")
add_test(pusch_test-n75-L50-pcqiwideband-m0 "pusch_test" "-n" "75" "-L" "50" "-p" "cqi" "wideband" "-m" "0")
add_test(pusch_test-n75-L50-puci_ack0-m0 "pusch_test" "-n" "75" "-L" "50" "-p" "uci_ack" "0" "-m" "0")
add_test(pusch_test-n75-L50-puci_ack0-pcqiwideband-m0 "pusch_test" "-n" "75" "-L" "50" "-p" "uci_ack" "0" "-p" "cqi" "wideband" "-m" "0")
add_test(pusch_test-n75-L50-m10 "pusch_test" "-n" "75" "-L" "50" "-m" "10")
add_test(pusch_test-n75-L50-pcqiwideband-m10 "pusch_test" "-n" "75" "-L" "50" "-p" "cqi" "wideband" "-m" "10")
add_test(pusch_test-n75-L50-puci_ack0-m10 "pusch_test" "-n" "75" "-L" "50" "-p" "uci_ack" "0" "-m" "10")
add_test(pusch_test-n75-L50-puci_ack0-pcqiwideband-m10 "pusch_test" "-n" "75" "-L" "50" "-p" "uci_ack" "0" "-p" "cqi" "wideband" "-m" "10")
add_test(pusch_test-n75-L50-m20 "pusch_test" "-n" "75" "-L" "50" "-m" "20")
add_test(pusch_test-n75-L50-pcqiwideband-m20 "pusch_test" "-n" "75" "-L" "50" "-p" "cqi" "wideband" "-m" "20")
add_test(pusch_test-n75-L50-puci_ack0-m20 "pusch_test" "-n" "75" "-L" "50" "-p" "uci_ack" "0" "-m" "20")
add_test(pusch_test-n75-L50-puci_ack0-pcqiwideband-m20 "pusch_test" "-n" "75" "-L" "50" "-p" "uci_ack" "0" "-p" "cqi" "wideband" "-m" "20")
add_test(pusch_test-n100-L50-m0 "pusch_test" "-n" "100" "-L" "50" "-m" "0")
add_test(pusch_test-n100-L50-pcqiwideband-m0 "pusch_test" "-n" "100" "-L" "50" "-p" "cqi" "wideband" "-m" "0")
add_test(pusch_test-n100-L50-puci_ack0-m0 "pusch_test" "-n" "100" "-L" "50" "-p" "uci_ack" "0" "-m" "0")
add_test(pusch_test-n100-L50-puci_ack0-pcqiwideband-m0 "pusch_test" "-n" "100" "-L" "50" "-p" "uci_ack" "0" "-p" "cqi" "wideband" "-m" "0")
add_test(pusch_test-n100-L50-m10 "pusch_test" "-n" "100" "-L" "50" "-m" "10")
add_test(pusch_test-n100-L50-pcqiwideband-m10 "pusch_test" "-n" "100" "-L" "50" "-p" "cqi" "wideband" "-m" "10")
add_test(pusch_test-n100-L50-puci_ack0-m10 "pusch_test" "-n" "100" "-L" "50" "-p" "uci_ack" "0" "-m" "10")
add_test(pusch_test-n100-L50-puci_ack0-pcqiwideband-m10 "pusch_test" "-n" "100" "-L" "50" "-p" "uci_ack" "0" "-p" "cqi" "wideband" "-m" "10")
add_test(pusch_test-n100-L50-m20 "pusch_test" "-n" "100" "-L" "50" "-m" "20")
add_test(pusch_test-n100-L50-pcqiwideband-m20 "pusch_test" "-n" "100" "-L" "50" "-p" "cqi" "wideband" "-m" "20")
add_test(pusch_test-n100-L50-puci_ack0-m20 "pusch_test" "-n" "100" "-L" "50" "-p" "uci_ack" "0" "-m" "20")
add_test(pusch_test-n100-L50-puci_ack0-pcqiwideband-m20 "pusch_test" "-n" "100" "-L" "50" "-p" "uci_ack" "0" "-p" "cqi" "wideband" "-m" "20")
add_test(pucch_test "pucch_test")
add_test(pucch_test_uci_cqi_decoder "pucch_test" "-q")
add_test(prach "prach_test")
add_test(prach_256 "prach_test" "-n" "15")
add_test(prach_512 "prach_test" "-n" "25")
add_test(prach_1024 "prach_test" "-n" "50")
add_test(prach_1536 "prach_test" "-n" "75")
add_test(prach_2048 "prach_test" "-n" "100")
add_test(prach_f0 "prach_test" "-f" "0")
add_test(prach_f1 "prach_test" "-f" "1")
add_test(prach_f2 "prach_test" "-f" "2")
add_test(prach_f3 "prach_test" "-f" "3")
add_test(prach_rs1 "prach_test" "-r" "1")
add_test(prach_rs2 "prach_test" "-r" "2")
add_test(prach_rs3 "prach_test" "-r" "3")
add_test(prach_zc0 "prach_test" "-z" "0")
add_test(prach_zc2 "prach_test" "-z" "2")
add_test(prach_zc3 "prach_test" "-z" "3")
add_test(prach_test_multi "prach_test_multi")
add_test(prach_test_multi_n32 "prach_test_multi" "-n" "32")
add_test(prach_test_multi_n16 "prach_test_multi" "-n" "16")
add_test(prach_test_multi_n8 "prach_test_multi" "-n" "8")
add_test(prach_test_multi_n4 "prach_test_multi" "-n" "4")
