//-------------------------------------------------------------------
//-- l298n_half.v
//-- Module
//-------------------------------------------------------------------
//-- Smash Emebedded
//-- GPL license
//-------------------------------------------------------------------
//-- H-Bridge L298N Motor Driver
//-------------------------------------------------------------------

module l298n_half (
    input wire clk,         // Proper clk
    input wire rst,         // Reset signal (active high)
    input wire pwm,         // External PWM signal                  
    input wire direction,   // Direction control
    output reg ena,         // to ENA: PWM output singal
    output reg in1,         // IN1 direction control
    output reg in2          // IN2 direction control
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        ena <= 0;
        in1 <= 0;
        in2 <= 0;
    end else begin
        ena <= pwm;
        if (direction) begin
            in1 <= 1;
            in2 <= 0;
        end else begin
            in1 <= 0;
            in2 <= 1;
        end
    end
end

endmodule