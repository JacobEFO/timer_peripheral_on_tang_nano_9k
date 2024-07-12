# Project related variables
project := hello_world

# Design related variables
top_file := ./fpga/fpga.v
top_module := fpga
constraints_file := ./constraints/constraints.cst
device := GW1NR-LV9QN88PC6/I5
device_family := GW1N-9C
board := tangnano

# Directory structure
build_dir := ./build
fpga_dir := $(build_dir)/fpga
sim_dir := $(build_dir)/sim
rtl_dir := ./rtl
bench_dir := ./bench

# FPGA flow related variables
output_synth := synth-$(project).json
output_pnr := pnr-$(project).json
output_bitstream := bitstream-$(project).fs

sim:
	iverilog -o $(sim_dir)/main_tb -c file_list.txt -D 'DUMP_FILE_NAME="$(sim_dir)/main_tb.vcd"'
	vvp $(sim_dir)/main_tb

show:
	gtkwave $(sim_dir)/main_tb.vcd


# Makes everything related to the FPGA but not the programming
fpga: synth pnr bitstream

synth: 
	yosys $(top_file) -p'synth_gowin -top $(top_module) -json $(fpga_dir)/$(output_synth)'
	# yosys $(top_file) -p'synth_gowin -top $(top_module) -json $(fpga_dir)/$(output_synth)'

pnr:
	nextpnr-himbaechel  --json $(fpga_dir)/$(output_synth) \
						--write $(fpga_dir)/$(output_pnr) \
						--device '$(device)' \
						--vopt cst=$(constraints_file) \
						--vopt family=$(device_family)

bitstream:
	gowin_pack -d $(device_family) -o $(fpga_dir)/$(output_bitstream) $(fpga_dir)/$(output_pnr)

program:
	openFPGALoader -b $(board) $(fpga_dir)/$(output_bitstream)

clean:
	rm -f $(fpga_dir)/*
	rm -f $(sim_dir)/*
	rm -f $(build_dir)/*
