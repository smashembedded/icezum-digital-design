//-------------------------------------------------------------------
//-- uart_tx_top.v
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
//-- UART transmitter Top
//-------------------------------------------------------------------

`default_nettype none
`include "include/modules.vh"

module uart_tx_top (
    input wire clk,
    input wire rstn,
    output wire tx
);

wire rst = ~rstn;

parameter MSG_LEN = 11;
// ~1s delay @12MHz
parameter DELAY_CYCLES = 24'd12_000_000;  // 0 = send as fast as possible

// Flattened byte array: [MSB:LSB] = [8*MSG_LEN-1:0]
wire [8*MSG_LEN-1:0] msg;

// Message content (note: bytes in reverse order due to concat MSB-first)
assign msg = {
    8'h0A,  // "\n"
    8'h31,  // "1"
    8'h30,  // "0"
    8'h31,  // "1"
    8'h20,  // " "
    8'h3A,  // ":"
    8'h65,  // "e"
    8'h75,  // "u"
    8'h6C,  // "l"
    8'h61,  // "a"
    8'h56   // "V"
};

uart_tx #(
    .MSG_LEN(MSG_LEN),
    .DELAY_CYCLES(DELAY_CYCLES)
) u_uart_tx (
    .clk(clk),
    .rstn(rst),
    .msg(msg),
    .tx(tx)
);

endmodule
