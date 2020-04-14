#Makefile for a Vending Machine
#Vikrant Mehendale 
#Saurabh Waman Chavan 

#Mentions all the targets in the makefile
all: clean lib compile run   

#Mentions the commands for library setup
lib: 
	vlib work
	vmap work work 

#Mentions the commands for compiling the .sv files in the project used	
compile:
	vlog vm.sv vm_top.sv tb_vm.sv

#Mentions the commands required for running the design
#the DO file mentioned has the following commands
#	add wave -position insertpoint sim:/tb_vm/*
#	run -all
run:
	vsim -voptargs="+acc" work.tb_vm -do vm.do 
	@echo -e "\nMakeInfo: Verification test run successful!"

#The target when compiled generates waste files which must be deleted otherwise unnecessary files are generated	
clean:
	rm -rf transcript vsim.wlf modelsim.ini work
