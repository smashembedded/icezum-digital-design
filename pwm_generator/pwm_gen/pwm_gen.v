//-------------------------------------------------------------------
//-- pwm_gen.v
//-- Module
//-------------------------------------------------------------------
//-- Daniel Rodrigo
//-- GPL license
//-------------------------------------------------------------------
//-- PWM Generator
//-------------------------------------------------------------------

`include "..\..\clock\freq_divider\freq_divider.v"

module pwm_gen (clk, duty_cycle, pwm, pwm_n);

// inputs and output
input clk;					// Proper clk
input [7:0] duty_cycle;  	// Duty cycle for motor (0-255 scale)
output pwm; 				// clk PWM output singal
output pwm_n; 				// clk ~PWM output singal

// define signals
reg[7:0] cnt_pwm = 0; 		// 8-bit PWM counter


// PWM signal generation
always @(posedge clk)
begin
	cnt_pwm <= cnt_pwm + 1;
	if (cnt_pwm >= 255)
		cnt_pwm <= 0;
end

assign pwm = (cnt_pwm < duty_cycle) ? 1'b1 : 1'b0;
assign pwm_n = ~pwm;

endmodule

// Higher-level module for select duty cycle"
module top_level (clk, pwm, pwm_n);

input clk;
output pwm;
output pwm_n;

reg [7:0] duty_cycle = 192;

freq_divider #(28'd1200) u_freq_divider (
    .clk_in(clk),
    .clk_out(clk_10kHz)
);

pwm_gen u_pwm_gen (
    .clk(clk_10kHz),
    .duty_cycle(duty_cycle),
    .pwm(pwm),
    .pwm_n(pwn_n)
);

endmodule