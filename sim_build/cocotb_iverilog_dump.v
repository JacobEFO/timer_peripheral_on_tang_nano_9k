module cocotb_iverilog_dump();
initial begin
    $dumpfile("sim_build/timer.fst");
    $dumpvars(0, timer);
end
endmodule
