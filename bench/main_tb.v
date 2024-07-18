/*
 *
 */
`define assert(signal, value, logfile) \
    if (signal !== value) begin \
        $fdisplay(logfile, "ASSERTION FAILED in %m: signal != value"); \
    end

module main_tb;

    integer logfile;

    initial begin
        //$system("echo 'initial at ['$(date)']'>>temp.log");
        logfile = $fopen(`LOG_FILE_NAME,"a");
        // $dumpfile("main_tb.vcd");
        $dumpfile(`DUMP_FILE_NAME);
        $dumpvars;
    end

    reg reset = 0;
    initial begin
        #17 reset = 1;
        #20 reset = 0;
        #30 reset = 1;
        #50 `assert(reset, 0, logfile);
        #50 $fdisplay(logfile, "hello world");
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
