 vlib rtl_work
 vmap work rtl_work
 vcom -93 -work work {../../timer_sec.vhd}

vsim work.timer_sec(ifsc)
add wave *

force -freeze sim:/timer_sec/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/timer_sec/ena 1 0, 0 {100 ps} -r 1000

force -freeze sim:/timer_sec/contar 0 0
force -freeze sim:/timer_sec/rst 1 0
force -freeze sim:/timer_sec/zerar 0 0
run 50

force -freeze sim:/timer_sec/contar 1 0
force -freeze sim:/timer_sec/rst 0 0
run 6300
run 100000

force -freeze sim:/timer_sec/zerar 1 0
run 50
run
run
run
run
run
run
run
run
run
run

force -freeze sim:/timer_sec/zerar 0 0
run 13300

force -freeze sim:/timer_sec/zerar 1 0
run 1000

force -freeze sim:/timer_sec/zerar 0 0
force -freeze sim:/timer_sec/contar 0 0
run 3000


