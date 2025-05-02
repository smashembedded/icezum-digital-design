//-------------------------------------------------------------------
//-- button_debouncer.v
//-- Module
//-------------------------------------------------------------------
//-- Smash Embedded
//-- GPL license
//-------------------------------------------------------------------
//-- Button Debouncer Top
//-------------------------------------------------------------------

`include "include/modules.v"

module button_debouncer_top (
    input clk,
    input rst,
    input b_in,
    output b_out_level,
    output b_out_pulse,
    output [7:0] leds
);

// define signals
wire clk_1kHz;

//freq_divider #(.DIV(28'd30000)) u_freq_divider (
freq_divider #(.DIV(28'd12000)) u_freq_divider (
    .clk_in(clk),
    .clk_out(clk_1kHz)
);

button_debouncer u_button_debouncer (
    .clk(clk_1kHz),
    .rst(rst),
    .b_in(b_in),
    .b_out_level(b_out_level),
    .b_out_pulse(b_out_pulse)
);

// Control all LEDs with debounced button signal
assign leds = b_out_level ? 8'b11111111 : 8'b00000000;

endmodule