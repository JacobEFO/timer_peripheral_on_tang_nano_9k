/* Copyright (C) reserved for Jacob E. F. Overgaard, 2024
 *
 *
 * @file: fpga.v
 * @author: Jacob E. F. Overgaard
 * @date: 2024-07-11
 *
 * @brief:
 *  FPGA (gowin GW1N) to test/debug the timer.
 *  The FPGA will contain a uart receiver
 *
 *
 * 
 */


`include "rtl/top/top.v"
`include "uart/uart_rx.v"

module fpga
(
  input clk_i,
  input rst_ni,
  output out_o
);

  // Main design components
  top inst_top(clk_i, rst_ni, out_o);

  // Debug / FPGA testing components
  uart_rx inst_uart_rx(clk_i, rst_ni);

  

endmodule //fpga
