//-------------------------------------------------------------------
//-- motor_dc.v
//-- Module
//-------------------------------------------------------------------
//-- Smash Emebedded
//-- GPL license
//-------------------------------------------------------------------
//-- Motor DC Controller
//-------------------------------------------------------------------

module motor_dc (
    input clk,
    input rst,
    input [7:0] speed,
    output pwm,
	output pwm_n
);

reg [7:0] duty_cycle;    // Duty Cycle  [0, 255]
wire [15:0] temp = (speed << 8) + (speed << 2) + speed; // 256 + 4 + 1 = 261
wire [7:0] scaled_speed = temp >> 8; // divide by 256

always @(posedge clk or posedge rst)
begin
    if (rst) begin
		duty_cycle <= 0;
	end else begin
        duty_cycle <= scaled_speed;
	end
end

pwm_gen u_pwm_gen (
    .clk(clk),
    .rst(rst),
    .duty_cycle(duty_cycle),
    .pwm(pwm),
    .pwm_n(pwm_n)
);

endmodule