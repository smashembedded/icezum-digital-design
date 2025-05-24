//-------------------------------------------------------------------
//-- uart_rx_top.v
//-----------------------------------------------------------------------------
//-- Smash Embedded
//-----------------------------------------------------------------------------
//-- (C) BQ. December 2015. Written by Juan Gonzalez (Obijuan)
//-- GPL license
//-----------------------------------------------------------------------------
//-- NOTE: This UART transmitter module has been adapted and significantly modified
//-- for use in this project. It retains its roots in the original implementation
//-- by Juan Gonzalez (Obijuan): https://github.com/FPGAwars/FPGA-peripherals 
//-- which was itself inspired by James Bowman’s swapforth project:
//-- https://github.com/jamesbowman/swapforth
//--
//-- The structure, formatting, and functionality may differ from the original,
//-- but the design origin is acknowledged here in accordance with the GPL license.
//--
//-- This project respects and preserves the spirit of open hardware development.
//-----------------------------------------------------------------------------
//-- UART receiver Top
//-------------------------------------------------------------------

`default_nettype none
`include "include/modules.vh"

module uart_rx_top (
    input wire          clk,    // System clock
    input wire          rstn,   // Active-low reset
    input wire          rx      // UART RX input
);

// Internal wires to receive output from uart_rx
wire        rcv;
wire [7:0]  last;

uart_rx u_uart_rx (
    .clk(clk),
    .rstn(rstn),
    .rx(rx),
    .rcv(rcv),
    .last(last)
);

endmodule