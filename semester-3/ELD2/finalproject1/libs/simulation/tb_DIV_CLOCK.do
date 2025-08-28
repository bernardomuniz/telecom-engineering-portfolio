vlib rtl_work
vmap work rtl_work
  
vcom -93 -work work {../../div_clk.vhd}
vsim work.div_clk(clk_division)

add wave -position end  sim:/div_clk/fclk
add wave -position end  sim:/div_clk/Nbits
add wave -position end  sim:/div_clk/clk_in
add wave -position end  sim:/div_clk/reset
add wave -position end  sim:/div_clk/ena_out
add wave -position end  sim:/div_clk/clk_out
add wave -position end  sim:/div_clk/r_reg
add wave -position end  sim:/div_clk/r_next
force -freeze sim:/div_clk/clk_in 1 0, 0 {10 ps} -r 20
force -freeze sim:/div_clk/reset 1 0
run 50 ns
force -freeze sim:/div_clk/reset 0 0
run 2000 ns


