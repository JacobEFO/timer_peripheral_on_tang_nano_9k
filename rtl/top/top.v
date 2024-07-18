/* Copyright (C) reserved for Jacob E. F. Overgaard, 2024
 *
 * @file: top.v
 * @author: Jacob E. F. Overgaard
 * @date: 2024-07-11
 *
 * @brief:
 *  TOP MODULE
 * 
 */


//`include "rtl/timer/timer.v"

module top
(
  input clk_i,
  input rst_ni,
  output out_o
);

  timer inst_timer(clk_i, rst_ni, out_o);

endmodule
