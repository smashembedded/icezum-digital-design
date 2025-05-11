//-------------------------------------------------------------------
//-- motor_dc_top.v
//-- Module
//-------------------------------------------------------------------
//-- Smash Embedded
//-- GPL license
//-------------------------------------------------------------------
//-- Motor DC Controller Top
//-------------------------------------------------------------------

`include "include/modules.v"

module motor_dc_top (
    input wire clk,
    input wire rst,
    input wire speed_inc,
    input wire forward,
    output wire ena,
    output wire in1,
    output wire in2
);

wire clk_10kHz;
wire clk_1kHz;
wire [7:0] speed;
wire pwm, pwm_n;

freq_divider #(.DIV(28'd1200)) u_freq_divider_10kHz (
    .clk_in(clk),
    .clk_out(clk_10kHz)
);

freq_divider #(.DIV(28'd12000)) u_freq_divider_1kHz (
    .clk_in(clk),
    .clk_out(clk_1kHz)
);

button_counter #(
    .WIDTH(8),         // output [7:0] count
    .STEP(8'd50)
) u_button_counter (
    .clk(clk_1kHz),
    .rst(rst),
    .b_in(speed_inc),
    .count(speed)
);

motor_dc u_motor_dc (
    .clk(clk_10kHz),
    .rst(rst),
    .speed(speed),
    .pwm(pwm),
    .pwm_n(pwm_n)
);

l298n_half u_l298n_half (
    .clk(clk),
    .rst(rst),
    .pwm(pwm),
    .direction(forward),
    .ena(ena),
    .in1(in1),
    .in2(in2)
);

endmodule