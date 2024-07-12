/*
 *
 */

module main_tb;

  initial begin
    // $dumpfile("main_tb.vcd");
    $dumpfile(`DUMP_FILE_NAME);
    $dumpvars;
  end

  reg reset = 0;
  initial begin
    #17 reset = 1;
    #20 reset = 0;
    #30 reset = 1;
    #50 $finish;
  end

  reg clk = 0;
  always #5 clk = !clk;

  wire tmp;
  timer inst_timer(clk, reset, tmp);

  initial
    $monitor("At time %t.", $time);
    // $monitor("At time %t, value = %h (%0d)", $time, value, value);

endmodule
