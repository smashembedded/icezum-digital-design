//-------------------------------------------------------------------
//-- pwm_gen_top.v
//-- Module
//-------------------------------------------------------------------
//-- Smash Embedded
//-- GPL license
//-------------------------------------------------------------------
//-- PWM Generator Top
//-------------------------------------------------------------------

`include "include/modules.v"

module pwm_gen_top (clk, rst, pwm, pwm_n);

input clk;
input rst;
output pwm;
output pwm_n;

reg [7:0] duty_cycle = 192;

freq_divider #(28'd1200) u_freq_divider (
    .clk_in(clk),
    .clk_out(clk_10kHz)
);

pwm_gen u_pwm_gen (
    .clk(clk_10kHz),
    .rst(rst),
    .duty_cycle(duty_cycle),
    .pwm(pwm),
    .pwm_n(pwn_n)
);

endmodule