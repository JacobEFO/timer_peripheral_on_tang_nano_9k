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

# cocotb stuff
SIM ?= icarus
WAVES = 1
TOPLEVEL_LANG ?= verilog
VERILOG_SOURCES += $(PWD)/rtl/timer/timer.v
TOPLEVEL = timer
MODULE = main_coco_tb
include $(shell cocotb-config --makefiles)/Makefile.sim
