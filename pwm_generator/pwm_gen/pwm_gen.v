//-------------------------------------------------------------------
//-- pwm_gen.v
//-- Module
//-------------------------------------------------------------------
//-- Smash Embedded
//-- GPL license
//-------------------------------------------------------------------
//-- PWM Generator
//-------------------------------------------------------------------

module pwm_gen (clk, rst, duty_cycle, pwm, pwm_n);

// inputs and output
input clk;					// Proper clk
input rst;					// Reset signal (active high)
input [7:0] duty_cycle;  	// Duty cycle for motor (0-255 scale)
output pwm; 				// clk PWM output singal
output pwm_n; 				// clk ~PWM output singal

// define signals
reg[7:0] cnt_pwm = 0; 		// 8-bit PWM counter
reg[7:0] current_duty = 0; 	// Current duty cycle

// PWM signal generation
always @(posedge clk or posedge rst)
begin
    if (rst) begin
		cnt_pwm <= 0;
		current_duty <= 0;
	end else begin

		if (current_duty != duty_cycle) begin
			cnt_pwm <= 0;
			current_duty <= duty_cycle;
		end else if (cnt_pwm >= 255) begin
			cnt_pwm <= 0;
		end else begin
			cnt_pwm <= cnt_pwm + 1;
		end
	end
end

assign pwm = (cnt_pwm < duty_cycle) ? 1'b1 : 1'b0;
assign pwm_n = ~pwm;

endmodule
