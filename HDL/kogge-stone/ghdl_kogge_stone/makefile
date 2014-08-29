
# vhdl files
FILES = source/green_box.vhd \
	source/yellow_box.vhd \
	source/red_box.vhd \
	source/kogge_stone.vhd

# testbench
SIMTOP = tb_kogge_stone
SIMFILES = testbench/$(SIMTOP).vhd

GHDL_CMD        = ghdl
GHDL_FLAGS      = --ieee=synopsys --warn-no-vital-generic

SIMDIR = simulation

compile :                                                                                                 
	make clean	
	#mkdir -p $(SIMDIR)
	$(GHDL_CMD) -a $(GHDL_FLAGS) $(FILES) $(SIMFILES)
	$(GHDL_CMD) -e $(GHDL_FLAGS) $(SIMTOP)
	$(GHDL_CMD) -r $(SIMTOP) --vcd=$(SIMTOP).vcd --stop-time=30ns
	                                                       
clean :                                                                                                  
	ghdl --remove
	echo 'Cleaned'  

view :
	gtkwave $(SIMTOP).vcd
                               
