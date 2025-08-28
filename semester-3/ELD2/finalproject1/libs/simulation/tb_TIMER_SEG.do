
vlib rtl_work
vmap work rtl_work
 
vcom -93 -work work {../../timer_seg.vhd}

vsim work.timer_seg(ifsc_de2_115)

add wave *
force -freeze sim:/timer_seg/RESET_PB 0 0
force -freeze sim:/timer_seg/RESET_PB 1 0
force -freeze sim:/timer_seg/CONTAR_SW 0 0
force -freeze sim:/timer_seg/CLOCK50MHz 1 0, 0 {10 ps} -r 20
force -freeze sim:/timer_seg/ZERAR_PB 0 0
run
force -freeze sim:/timer_seg/CONTAR_SW 1 0
force -freeze sim:/timer_seg/RESET_PB 0 0
run
run 200 ns


