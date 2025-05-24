//-----------------------------------------------------------------------------
//-- uart_rx.v
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
//-- UART RX
//-----------------------------------------------------------------------------

`default_nettype none

module uart_rx (
    input wire          clk,    // System clock
    input wire          rstn,   // Active-low reset
    input wire          rx,     // UART RX input
    input wire          rcv,    // New byte available
    output wire [7:0]   last    // Latest received byte
);

wire [7:0] data;

uart_ctrl_rx #(
    .BAUDRATE(`B115200)
) u_uart_ctrl_rx (
    .clk(clk),
    .rstn(rstn),
    .rx(rx),
    .rcv(rcv),
    .data(data)
);

uart_msg_rx u_uart_msg_rx (
    .clk(clk),
    .rstn(rstn),
    .rcv(rcv),
    .data(data),
    .last(last)
);

endmodule