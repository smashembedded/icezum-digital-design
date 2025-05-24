//-------------------------------------------------------------------
//-- uart_tx.v
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
//-- UART TX
//-------------------------------------------------------------------

`default_nettype none

module uart_tx #(
    parameter MSG_LEN      = 1,   // Number of characters in message
    parameter DELAY_CYCLES = 0
)(
    input  wire                 clk,    // System clock (e.g., 12 MHz)
    input  wire                 rstn,   // Active-low reset
    input  wire [8*MSG_LEN-1:0] msg,    // Message input
    output wire                 tx      // UART TX output
);

// Internal signals
wire start;
wire [7:0] data;
wire ready;

uart_msg_tx #(
    .MSG_LEN(MSG_LEN),
    .DELAY_CYCLES(DELAY_CYCLES)
) u_uart_msg_tx(
    .clk(clk),
    .rstn(rstn),
    .ready(ready),
    .msg(msg),
    .start(start),
    .data(data)
);

uart_ctrl_tx #(
    .BAUDRATE(`B115200)
) u_uart_ctrl_tx(
    .clk(clk),
    .rstn(rstn),
    .start(start),
    .data(data),
    .tx(tx),
    .ready(ready)
);

endmodule