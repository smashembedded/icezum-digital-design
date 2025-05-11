//-------------------------------------------------------------------
//-- l298n.v
//-- Module
//-------------------------------------------------------------------
//-- Smash Emebedded
//-- GPL license
//-------------------------------------------------------------------
//-- Dual H-Bridge L298N Motor Driver
//-------------------------------------------------------------------

module l298n_dual (
    input wire clk,         // Proper clk
    input wire rst,         // Reset signal (active high)

    // Motor A
    input wire pwm_a,       // External PWM signal                  
    input wire direction_a, // Direction control
    output wire ena,         // to ENA: PWM output singal
    output wire in1,         // IN1 direction control
    output wire in2,         // IN2 direction control

    // Motor B
    input wire pwm_b,       // External PWM signal                  
    input wire direction_b, // Direction control
    output wire enb,         // to ENB: PWM output singal
    output wire in3,         // IN3 direction control
    output wire in4          // IN4 direction control
);

l298n_half motor_a (
    .clk(clk),
    .rst(rst),
    .pwm(pwm_a),
    .direction(direction_a),
    .ena(ena),
    .in1(in1),
    .in2(in2)
);

l298n_half motor_b (
    .clk(clk),
    .rst(rst),
    .pwm(pwm_b),
    .direction(direction_b),
    .ena(enb),
    .in1(in3),
    .in2(in4)
);

endmodule