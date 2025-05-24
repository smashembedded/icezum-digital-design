//-----------------------------------------------------------------------------
//-- uart.v
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
//-- UART TX/RX
//-----------------------------------------------------------------------------

`default_nettype none

module uart #(
    parameter MSG_LEN       = 1,
    parameter DELAY_CYCLES  = 0
)(
    input  wire                  clk,            // System clock (12 MHz)
    input  wire                  rstn,           // Active-low reset

    // UART interface
    input  wire                  rx,             // UART RX line (input)
    output wire                  tx,             // UART TX line (output)

    // TX message input
    input  wire [8*MSG_LEN-1:0]  msg_flat,       // Flattened message to send

    // RX output
    output wire [7:0]            last_rx_byte,   // Last received byte
    output wire                  rcv             // High for 1 clk when a byte is received
);

// Transmitter
uart_tx #(
    .MSG_LEN(MSG_LEN),
    .DELAY_CYCLES(DELAY_CYCLES)
) u_uart_tx (
    .clk(clk),
    .rstn(rstn),
    .msg(msg_flat),
    .tx(tx)
);

// Receiver
uart_rx u_uart_rx (
    .clk(clk),
    .rstn(rstn),
    .rx(rx),
    .last(last_rx_byte),
    .rcv(rcv)
);

endmodule