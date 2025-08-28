# do contador_lfsr_run_msim_rtl_vhdl.do
# if {[file exists rtl_work]} {
# 	vdel -lib rtl_work -all
# }
 vlib rtl_work
 vmap work rtl_work
# Model Technology ModelSim - Intel FPGA Edition vmap 2020.1 Lib Mapping Utility 2020.02 Feb 28 2020
# vmap work rtl_work 
# Copying /opt/intelFPGA/20.1/modelsim_ae/linuxaloem/../modelsim.ini to modelsim.ini
# Modifying modelsim.ini
# 
 vcom -93 -work work {/home/bernardo.sm30/ELD2/AE4/contadorlfsr/contador_lfsr.vhd}
# Model Technology ModelSim - Intel FPGA Edition vcom 2020.1 Compiler 2020.02 Feb 28 2020
# Start time: 22:00:39 on Jun 11,2025
# vcom -reportprogress 300 -93 -work work /home/bernardo.sm30/ELD2/AE4/contadorlfsr/contador_lfsr.vhd 
# -- Loading package STANDARD
# -- Loading package TEXTIO
# -- Loading package std_logic_1164
# -- Compiling entity contador_lfsr
# -- Compiling architecture ifsc_v1 of contador_lfsr
# ** Warning: /home/bernardo.sm30/ELD2/AE4/contadorlfsr/contador_lfsr.vhd(17): (vcom-1074) Non-locally static OTHERS choice is allowed only if it is the only choice of the only association.
# End time: 22:00:40 on Jun 11,2025, Elapsed time: 0:00:01
# Errors: 0, Warnings: 1
# 
# 
# stdin: <EOF>
vsim work.contador_lfsr(ifsc_v1)
# vsim work.contador_lfsr(ifsc_v1) 
# Start time: 22:00:53 on Jun 11,2025
# //  ModelSim - Intel FPGA Edition 2020.1 Feb 28 2020 Linux 6.1.0-37-amd64
# //
# //  Copyright 1991-2020 Mentor Graphics Corporation
# //  All Rights Reserved.
# //
# //  ModelSim - Intel FPGA Edition and its associated documentation contain trade
# //  secrets and commercial or financial information that are the property of
# //  Mentor Graphics Corporation and are privileged, confidential,
# //  and exempt from disclosure under the Freedom of Information Act,
# //  5 U.S.C. Section 552. Furthermore, this information
# //  is prohibited from disclosure under the Trade Secrets Act,
# //  18 U.S.C. Section 1905.
# //
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.contador_lfsr(ifsc_v1)
vsim work.contador_lfsr(ifsc_v1)
# End time: 22:00:58 on Jun 11,2025, Elapsed time: 0:00:05
# Errors: 0, Warnings: 0
# vsim work.contador_lfsr(ifsc_v1) 
# Start time: 22:00:58 on Jun 11,2025
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.contador_lfsr(ifsc_v1)
add wave -position insertpoint  \
sim:/contador_lfsr/clk
add wave -position insertpoint  \
sim:/contador_lfsr/enable
add wave -position insertpoint  \
sim:/contador_lfsr/lfsr_out
add wave -position insertpoint  \
sim:/contador_lfsr/reset
force -freeze sim:/contador_lfsr/clk 1 0, 0 {50 ps} -r 100
force reset 1
force enable 0
run
force enable 1
force reset 0
run 1200 ns


