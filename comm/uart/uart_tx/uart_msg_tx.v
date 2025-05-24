//-------------------------------------------------------------------
//-- uart_msg_tx.v
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
//-- Message Generator
//-------------------------------------------------------------------

`default_nettype none
`include "../baudgen/baudgen.vh"

module uart_msg_tx #(
    parameter MSG_LEN      = 1, // Number of characters in message
    parameter DELAY_CYCLES = 0
)(
    input  wire                 clk,    // System clock
    input  wire                 rstn,   // Active-low reset
    input  wire                 ready,  // Ready signal from uart_ctrl_tx
    input  wire [8*MSG_LEN-1:0] msg,    // Message input
    output reg                  start,  // Start transmission
    output reg            [7:0] data    // Character to transmit
);

// Internal signals
reg [7:0] index;
reg [2:0] state;

localparam IDLE  = 0;
localparam LOAD  = 1;
localparam FIRE  = 2;
localparam WAIT  = 3;
localparam DELAY = 4;

// Optional delay logic
reg [$clog2(DELAY_CYCLES+1)-1:0] delay_counter;
wire delay_enabled = (DELAY_CYCLES > 0);
wire delay_done    = (delay_counter == DELAY_CYCLES);

always @(posedge clk) begin
    if (!rstn || state != DELAY)
        delay_counter <= 0;
    else if (!delay_done)
        delay_counter <= delay_counter + 1;
end

always @(posedge clk) begin
    if (!rstn) begin
        state <= IDLE;
        index <= 0;
        start <= 0;
        data  <= 8'd0;
    end else begin
        case (state)
            IDLE: if (ready) state <= LOAD;

            LOAD: begin
                data <= msg[8*index +: 8];
                state <= FIRE;
            end

            FIRE: begin
                start <= 1;
                state <= WAIT;
            end

            WAIT: begin
                start <= 0;
                if (ready) begin
                    if (index == MSG_LEN - 1) begin
                        index <= 0;
                        state <= (delay_enabled ? DELAY : IDLE);
                    end else begin
                        index <= index + 1;
                        state <= IDLE;
                    end
                end
            end

            DELAY: if (delay_done) state <= IDLE;
        endcase
    end
end

endmodule    