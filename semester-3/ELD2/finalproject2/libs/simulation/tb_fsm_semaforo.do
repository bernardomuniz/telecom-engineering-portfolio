vlib rtl_work
vmap work rtl_work

vcom -93 -work work {../../timer_sec.vhd}

vsim work.fsm_semaforo(semaforos)

add wave *
force -freeze sim:/fsm_semaforo/clk 1 0, 0 {500000000000 ps} -r {1 sec}
force -freeze sim:/fsm_semaforo/rst 1 0
force -freeze sim:/fsm_semaforo/rst 1 0, 0 3
force -freeze sim:/fsm_semaforo/ativar 0 0
force -freeze sim:/fsm_semaforo/timer_std 10#0 0
run 1 sec
force -freeze sim:/fsm_semaforo/timer_std 10#4 0
run 1 sec
force -freeze sim:/fsm_semaforo/timer_std 10#0 0
run 1 sec
force -freeze sim:/fsm_semaforo/timer_std 10#4 0
run 1 sec
force -freeze sim:/fsm_semaforo/timer_std 10#0 0
run 1 sec
force -freeze sim:/fsm_semaforo/timer_std 10#4 0
run 1 sec
force -freeze sim:/fsm_semaforo/timer_std 10#0 0
run 1 sec
force -freeze sim:/fsm_semaforo/timer_std 10#4 0
run 1 sec
force -freeze sim:/fsm_semaforo/timer_std 10#0 0
run 1 sec
force -freeze sim:/fsm_semaforo/timer_std 10#4 0
run 1 sec
force -freeze sim:/fsm_semaforo/timer_std 10#0 0
run 1 sec
force -freeze sim:/fsm_semaforo/timer_std 10#4 0
run 1 sec
force -freeze sim:/fsm_semaforo/timer_std 10#0 0
run 1 sec
force -freeze sim:/fsm_semaforo/timer_std 10#4 0
run 1 sec
force -freeze sim:/fsm_semaforo/timer_std 10#0 0
run 1 sec
force -freeze sim:/fsm_semaforo/timer_std 10#4 0
run 1 sec
force -freeze sim:/fsm_semaforo/timer_std 10#0 0
force -freeze sim:/fsm_semaforo/timer_std 10#4 0
force -freeze sim:/fsm_semaforo/timer_std 10#0 0
run 1 sec
force -freeze sim:/fsm_semaforo/timer_std 10#4 0
run 1 sec
force -freeze sim:/fsm_semaforo/timer_std 10#0 0
run 1 sec
force -freeze sim:/fsm_semaforo/timer_std 10#4 0
run 1 sec
force -freeze sim:/fsm_semaforo/timer_std 10#0 0
run 1 sec
force -freeze sim:/fsm_semaforo/timer_std 10#4 0
run 1 sec
force -freeze sim:/fsm_semaforo/timer_std 10#0 0
run 1 sec
force -freeze sim:/fsm_semaforo/timer_std 10#4 0
run 1 sec
force -freeze sim:/fsm_semaforo/timer_std 10#0 0
run 1 sec
force -freeze sim:/fsm_semaforo/ativar 1 0
run 1 sec
run 1 sec
run 1 sec
run 1 sec
force -freeze sim:/fsm_semaforo/timer_std 10#59 0
run 5 sec
force -freeze sim:/fsm_semaforo/timer_std 10#0 0
run 5 sec
force -freeze sim:/fsm_semaforo/timer_std 10#4 0
run 5 sec
force -freeze sim:/fsm_semaforo/timer_std 10#0 0
force -freeze sim:/fsm_semaforo/timer_std 10#29 0
run 5 sec
force -freeze sim:/fsm_semaforo/timer_std 10#0 0
force -freeze sim:/fsm_semaforo/timer_std 10#4 0
force -freeze sim:/fsm_semaforo/timer_std 10#0 0
run 5 sec
force -freeze sim:/fsm_semaforo/timer_std 10#4 0
run 5 sec
force -freeze sim:/fsm_semaforo/ativar 0 0
run 5 sec
force -freeze sim:/fsm_semaforo/timer_std 10#0 0
run 5 sec
force -freeze sim:/fsm_semaforo/ativar 1 0
run 5 sec
force -freeze sim:/fsm_semaforo/timer_std 10#59 0
run 5 sec
force -freeze sim:/fsm_semaforo/timer_std 10#0 0
run 5 sec
force -freeze sim:/fsm_semaforo/timer_std 10#4 0
run 5 sec
force -freeze sim:/fsm_semaforo/timer_std 10#0 0
force -freeze sim:/fsm_semaforo/ativar 0 0
force -freeze sim:/fsm_semaforo/ativar 1 0
run 5 sec
force -freeze sim:/fsm_semaforo/ativar 0 0
run 5 sec
force -freeze sim:/fsm_semaforo/ativar 1 0
run 5 sec
force -freeze sim:/fsm_semaforo/timer_std 10#59 0
run 5 sec
force -freeze sim:/fsm_semaforo/timer_std 10#59 0

force -freeze sim:/fsm_semaforo/timer_std 10#0 0
run 5 sec
force -freeze sim:/fsm_semaforo/timer_std 10#4 0
run 5 sec
force -freeze sim:/fsm_semaforo/timer_std 10#0 0
run 5 sec
force -freeze sim:/fsm_semaforo/timer_std 10#29 0
run 5 sec
force -freeze sim:/fsm_semaforo/timer_std 10#0 0
run 5 sec
force -freeze sim:/fsm_semaforo/timer_std 10#4 0
run 5 sec
force -freeze sim:/fsm_semaforo/timer_std 10#0 0
run 5 sec
force -freeze sim:/fsm_semaforo/timer_std 10#59 0
run 5 sec
force -freeze sim:/fsm_semaforo/timer_std 10#0 0
run 5 sec
force -freeze sim:/fsm_semaforo/timer_std 10#4 0
run 5 sec
force -freeze sim:/fsm_semaforo/timer_std 10#0 0
run 5 sec
force -freeze sim:/fsm_semaforo/timer_std 10#29 0
run 5 sec
force -freeze sim:/fsm_semaforo/timer_std 10#0 0
run 5 sec
force -freeze sim:/fsm_semaforo/timer_std 10#4 0
run 5 sec


