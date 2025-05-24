//-------------------------------------------------------------------
//-- uart_ctrl_tx.v
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
//-- Low-Level UART transmitter
//-------------------------------------------------------------------

`default_nettype none
`include "../baudgen/baudgen.vh"

module uart_ctrl_tx #(
    parameter BAUDRATE = `B115200  // Default baud rate
)(
    input  wire       clk,     // System clock (e.g., 12 MHz)
    input  wire       rstn,    // Active-low reset
    input  wire       start,   // Start transmission
    input  wire [7:0] data,    // Byte to transmit
    output reg        tx,      // UART TX output
    output reg        ready    // Ready = 1 when idle
);

// Baudrate generator
baudgen_tx #(.BAUDRATE(BAUDRATE)) u_baudgen_tx (
    .rstn(rstn),
    .clk(clk),
    .clk_ena(baud_en),
    .clk_out(clk_baud)
);

// Internal signals
wire clk_baud;
reg [3:0] bitc;
reg [9:0] shift_r;
reg [7:0] data_r;
reg load, baud_en;

// Store data when starting
always @(posedge clk)
    if (start && state == IDLE)
        data_r <= data;

// Shift register: STOP + DATA + START (transmitted LSB-first)
always @(posedge clk)
    if (!rstn)
        shift_r <= 10'b11_1111_1111;
    else if (load)
        shift_r <= {data_r, 2'b01};
    else if (clk_baud)
        shift_r <= {1'b1, shift_r[9:1]};

// Count bits sent (total 10 bits: start, data[7:0], stop)
always @(posedge clk)
    if (!rstn)
        bitc <= 0;
    else if (load)
        bitc <= 0;
    else if (clk_baud)
        bitc <= bitc + 1;

// TX output: least significant bit
always @(posedge clk)
    tx <= shift_r[0];

// FSM to control transmission
localparam IDLE  = 0;
localparam START = 1;
localparam TRANS = 2;

reg[1:0] state, next_state;

always @(posedge clk)
    if (!rstn)
        state <= IDLE;
    else
        state <= next_state;

always @(*) begin
    next_state = state;
    load = 0;
    baud_en = 0;
    ready = 0;

    case (state)
        IDLE: begin
            ready = 1;
            if (start) next_state = START;
        end

        START: begin
            load = 1;
            baud_en = 1;
            next_state = TRANS;
        end

        TRANS: begin
            baud_en = 1;
            if (bitc == 11)
                next_state = IDLE;
        end
    endcase
end

endmodule