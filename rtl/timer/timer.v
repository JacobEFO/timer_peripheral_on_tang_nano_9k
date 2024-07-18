/* Copyright (C) reserved for Jacob E. F. Overgaard, 2024
 *
 *
 * @file: timer.v
 * @author: Jacob E. F. Overgaard
 * @date: 2024-07-11
 *
 * @brief:
 *    Timer module that functions as an MCU peripheral.
 * 
 */

module timer
(
    input clk_i,
    input rst_ni,
    input en_i,

    /*
     * Prescaler designates the amount we need to divide the clock. The
     * actual clock division will be prescaler_i + 1; hence a 0 prescaler_i
     * will give the input clock.
     */
    input [7:0] prescaler_i,
    output out_o
);

reg out;
reg [7:0] clk_counter;
reg prescaler_en;
reg clk_div;

always @(posedge clk_i or negedge rst_ni) begin
    if (rst_ni) begin
        if (prescaler_i > 0) begin
            prescaler_en <= 1;
        end
        else begin
            prescaler_en <= 0;
        end
    end
    else begin
        prescaler_en <= 0;
    end
end


// Clock division
always @(posedge clk_i or negedge rst_ni) begin
    if (rst_ni) begin
        clk_counter <= clk_counter + 1;

        if (clk_counter < prescaler_i + 1) begin
            clk_div <= 1;
        end
        else begin
            clk_div <= 0;
        end
    end
    else begin // reset condition
        clk_counter <= 0;
        clk_div <= 0;
    end
end

wire clk_int = prescaler_en ? clk_div : clk_i; // Selection of divided clock or raw clock (clk_i)


always @(posedge clk_int or negedge rst_ni) begin
    if (rst_ni) begin
        out <= 1;
    end
    else begin // reset condition
        out <= 0;
    end
end
assign out_o = out;

endmodule // timer
