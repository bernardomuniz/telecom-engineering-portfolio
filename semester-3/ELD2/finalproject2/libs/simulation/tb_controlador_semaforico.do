
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {../../timer_sec.vhd}
vcom -93 -work work {../../FSM_semaforo.vhd}
vcom -93 -work work {../../div_clk.vhd}
vcom -93 -work work {../../controlador_semaforo.vhd}

vsim work.controlador_semaforo(ifsc)

do wave_controlador_semaforico.do
#add wave *
#add wave -position insertpoint  \
#sim:/controlador_semaforo/U3/pr_state
force -freeze sim:/controlador_semaforo/CLK50MHz 1 0, 0 {1 ms} -r {2 ms}
force -freeze sim:/controlador_semaforo/RESET_PB 1 0
force -freeze sim:/controlador_semaforo/RESET_PB 1 0, 0 3
force -freeze sim:/controlador_semaforo/ATIVAR_SW 0 0
force -freeze sim:/controlador_semaforo/CONTAR_SW 1 0
run 33 sec
force -freeze sim:/controlador_semaforo/ATIVAR_SW 1 0
run 400 sec


