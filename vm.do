add wave -position insertpoint sim:/tb_vm/*
run -all
coverage report -verbose
