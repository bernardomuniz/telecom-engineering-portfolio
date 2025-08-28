vlib rtl_work
vmap work rtl_work
vcom -93 -work work {../../timer_sec.vhd}

vsim work.div_clk(clk_division)

add wave -position insertpoint  \
sim:/div_clk/clk_in \
sim:/div_clk/clk_out \
sim:/div_clk/ena_out \
sim:/div_clk/r_reg \
sim:/div_clk/reset
force -freeze sim:/div_clk/clk_in 1 0, 0 {10 ps} -r 20
force -freeze sim:/div_clk/reset 1 0
run 50 ns
force -freeze sim:/div_clk/reset 0 0
run 2000 ns


