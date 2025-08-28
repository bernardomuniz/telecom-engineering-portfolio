vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/germano.dc/ELD2/Trab_eld/timer_segV3_restored/bcd2ssd.vhd}
 
vsim work.bcd2ssd(rtl)
add wave -position end  sim:/bcd2ssd/tipo
add wave -position end  sim:/bcd2ssd/oculta_zero
add wave -position end  sim:/bcd2ssd/bcd_in
add wave -position end  sim:/bcd2ssd/ssd_out
add wave -position end  sim:/bcd2ssd/seg
add wave -position end  sim:/bcd2ssd/seg_final
force -freeze sim:/bcd2ssd/oculta_zero 1 0
force -freeze sim:/bcd2ssd/bcd_in 1011 0
run
force -freeze sim:/bcd2ssd/oculta_zero 0 0
force -freeze sim:/bcd2ssd/bcd_in 0101 0
run
run
force -freeze sim:/bcd2ssd/bcd_in 1110 0
run
force -freeze sim:/bcd2ssd/bcd_in 0110 0
run
force -freeze sim:/bcd2ssd/bcd_in 1100 0
run
force -freeze sim:/bcd2ssd/bcd_in 0001 0
run


