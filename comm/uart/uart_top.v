//-----------------------------------------------------------------------------
//-- uart_top.v
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
//-- UART transmitter/receiver Top (echo example)
//-----------------------------------------------------------------------------

`default_nettype none
`include "include/modules.vh"

module uart_top (
    input  wire clk,       // System clock (12 MHz)
    input  wire rstn,      // Active-low reset
    input  wire rx,        // UART RX input
    output wire tx         // UART TX output
);

// Internal wires
wire        rcv;
wire [7:0]  last_rx_byte;

// Register to hold echo message (1 byte flattened = 8 bits)
reg [7:0] echo_byte;
wire [7:0] msg_flat = echo_byte;

// Update msg_flat when a new byte is received
always @(posedge clk) begin
    if (!rstn)
        echo_byte <= 8'd0;
    else if (rcv)
        echo_byte <= last_rx_byte;
end

// Instantiate your uart module with MSG_LEN = 1
uart #(
    .MSG_LEN(1),
    .DELAY_CYCLES(0)
) u_uart(
    .clk(clk),
    .rstn(rstn),
    .rx(rx),
    .tx(tx),
    .msg_flat(msg_flat),
    .last_rx_byte(last_rx_byte),
    .rcv(rcv)
);

endmodule