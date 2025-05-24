//-------------------------------------------------------------------
//-- uart_ctrl_rx.v
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
//-- Low-level receiver
//-------------------------------------------------------------------

`default_nettype none
`include "../baudgen/baudgen.vh"

module uart_ctrl_rx #(
    parameter BAUDRATE = `B115200
)(
    input wire          clk,    // System clock
    input wire          rstn,   // Active-low reset
    input wire          rx,     // Serial input
    output reg          rcv,    // Data valid pulse
    output reg  [7:0]   data    // Recevied byte
);

// Baudrate generator
baudgen_rx #(.BAUDRATE(BAUDRATE)) u_baudgen_rx (
    .rstn(rstn),
    .clk(clk),
    .clk_ena(baud_en),
    .clk_out(clk_baud)
);

wire clk_baud;
reg baud_en, clear, load;

// Internal registered RX
reg r_rx;
always @(posedge clk)
    r_rx <= rx;

// Bit counter
reg [3:0] bitc;
always @(posedge clk)
    if (clear)
        bitc <= 0;
    else if (clk_baud)
        bitc <= bitc + 1;

// Shift register
reg [9:0] raw_data;
always @(posedge clk)
    if (clk_baud)
        raw_data <= {r_rx, raw_data[9:1]};

// Output register
always @(posedge clk)
    if (!rstn)
        data <= 8'd0;
    else if (load)
        data <= raw_data[8:1];

// FSM states
localparam IDLE = 2'd0;
localparam RECV = 2'd1;
localparam LOAD = 2'd2;
localparam DAV  = 2'd3;
reg [1:0] state, next_state;

always @(posedge clk)
    if (!rstn)
        state <= IDLE;
    else
        state <= next_state;

always @(*) begin
    next_state = state;
    baud_en = 0;
    clear = 0;
    load = 0;
    rcv = 0;

    case (state)
        IDLE: begin
            clear = 1;
            if (r_rx == 0)
                next_state = RECV;
        end

        RECV: begin
            baud_en = 1;
            if (bitc == 10)
                next_state = LOAD;
        end

        LOAD: begin
            load = 1;
            next_state = DAV;
        end

        DAV: begin
            rcv = 1;
            next_state = IDLE;
        end
    endcase
end

endmodule
