//-------------------------------------------------------------------
//-- pwm_tb.v
//-- Testbench
//-------------------------------------------------------------------
//-- Daniel Rodrigo
//-- GPL license
//-------------------------------------------------------------------

`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module pwm_gen_tb;

    reg clk;
    reg [7:0] duty_cycle;
    wire pwm;
    wire pwm_n;
 
    // Instantiate the PWM Generator with variable duty cycle in Verilog
    pwm_gen UUT (
        .clk(clk), 
        .duty_cycle(duty_cycle), 
        .pwm(pwm),
        .pwm_n(pwm_n)
    );

    localparam PERIOD = ((1000/12)/2); // ns
    localparam DURATION = 255*PERIOD*2;  
 
    reg [7:0] duty_percentage;

    // Create 12Mhz clock
    initial begin
        clk = 0;
        forever #PERIOD clk = ~clk;
    end
 
    initial begin

        //-- File where to store the simulation results
        $dumpfile(`DUMPSTR(`VCD_OUTPUT));
        $dumpvars(0, pwm_gen_tb);

        // Sequence of duty cycles as per the requested pattern
        duty_cycle = 8'd0;
        duty_percentage = (duty_cycle * 100) / 255;
        #DURATION;

        duty_cycle = 8'd26;  // 10% duty cycle (approx)
        duty_percentage = (duty_cycle * 100) / 255;
        #DURATION;

        duty_cycle = 8'd64;  // 25% duty cycle
        duty_percentage = (duty_cycle * 100) / 255;
        #DURATION;

        duty_cycle = 8'd128; // 50% duty cycle
        duty_percentage = (duty_cycle * 100) / 255;
        #DURATION;

        duty_cycle = 8'd192; // 75% duty cycle
        duty_percentage = (duty_cycle * 100) / 255;
        #DURATION;

        duty_cycle = 8'd229; // 90% duty cycle
        duty_percentage = (duty_cycle * 100) / 255;
        #DURATION;

        duty_cycle = 8'd255; // 100% duty cycle
        duty_percentage = (duty_cycle * 100) / 255;
        #DURATION;

        duty_cycle = 8'd229; // 90% duty cycle (back down)
        duty_percentage = (duty_cycle * 100) / 255;
        #DURATION;

        duty_cycle = 8'd192; // 75% duty cycle (back down)
        duty_percentage = (duty_cycle * 100) / 255;
        #DURATION;

        duty_cycle = 8'd128; // 50% duty cycle (back down)
        duty_percentage = (duty_cycle * 100) / 255;
        #DURATION;

        duty_cycle = 8'd64;  // 25% duty cycle (back down)
        duty_percentage = (duty_cycle * 100) / 255;
        #DURATION;

        duty_cycle = 8'd26;  // 10% duty cycle (back down)
        duty_percentage = (duty_cycle * 100) / 255;
        #DURATION;

        duty_cycle = 8'd0;   // 0% duty cycle (back down)
        duty_percentage = (duty_cycle * 100) / 255;
        #DURATION;

        $display("End of simulation");
        $finish;
    end
endmodule
