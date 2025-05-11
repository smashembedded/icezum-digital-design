//-------------------------------------------------------------------
//-- button_counter_top.v
//-- Module
//-------------------------------------------------------------------
//-- Smash Embedded
//-- GPL license
//-------------------------------------------------------------------
//-- Button Debouncer Top
//-------------------------------------------------------------------

//`define SIMULATION
`include "include/modules.v"

module button_counter_top (
    input clk,
    input rst,
    input b_in,
    output wire [7:0] count
);

// define signals
wire clk_1kHz;

freq_divider #(.DIV(28'd12000)) u_freq_divider (
    .clk_in(clk),
    .clk_out(clk_1kHz)
);

button_counter #(
    .WIDTH(8),         // output [7:0] count
    .STEP(8'd1)
) u_button_counter (
    .clk(clk_1kHz),
    .rst(rst),
    .b_in(b_in),
    .count(count)
);

endmodule