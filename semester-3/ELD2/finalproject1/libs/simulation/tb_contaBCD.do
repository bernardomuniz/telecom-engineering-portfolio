vlib rtl_work
vmap work rtl_work
vcom -93 -work work {../../timer_seg.vhd}
vsim work.contabcd(bcd_count)
add wave -position insertpoint  \
sim:/contabcd/zerar \
sim:/contabcd/U \
sim:/contabcd/tipo \
sim:/contabcd/rst \
sim:/contabcd/ena \
sim:/contabcd/D \
sim:/contabcd/contar \
sim:/contabcd/clk \
sim:/contabcd/bcd_u \
sim:/contabcd/bcd_d
force -freeze sim:/contabcd/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/contabcd/rst 1 0
force -freeze sim:/contabcd/ena 1 0
force -freeze sim:/contabcd/zerar 1 0
force -freeze sim:/contabcd/contar 1 0
run 100
force -freeze sim:/contabcd/rst 0 0
force -freeze sim:/contabcd/zerar 0 0
run 6300
force -freeze sim:/contabcd/zerar 1 0
run 300
force -freeze sim:/contabcd/zerar 0 0
run 600
force -freeze sim:/contabcd/contar 0 0
run 400
force -freeze sim:/contabcd/contar 1 0
force -freeze sim:/contabcd/ena 0 0
run 300
force -freeze sim:/contabcd/zerar 1 0
force -freeze sim:/contabcd/contar 1 0
run 300
force -freeze sim:/contabcd/ena 1 0
force -freeze sim:/contabcd/contar 0 0
run 300

