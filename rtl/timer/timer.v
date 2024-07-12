/* Copyright (C) reserved for Jacob E. F. Overgaard, 2024
 *
 *
 * @file: timer.v
 * @author: Jacob E. F. Overgaard
 * @date: 2024-07-11
 *
 * @brief:
 *    Timer module that functions as an MCU peripheral
 * 
 */

module timer
(
    input clk_i,
    input rst_ni,
    output out_o
);

reg out;

always @(posedge clk_i or negedge rst_ni) begin
    if (rst_ni) begin
        out =  1;
    end
    else begin // reset condition
        out = 0;
    end
end
assign out_o = out;

endmodule // timer
