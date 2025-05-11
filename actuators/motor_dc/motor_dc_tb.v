//-------------------------------------------------------------------
//-- motor_dc_tb.v
//-- Testbench
//-------------------------------------------------------------------
//-- Smash Embedded
//-- GPL license
//-------------------------------------------------------------------

`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module motor_dc_tb;

    reg clk;
    reg rst;
    reg speed_inc;
    reg forward;
    wire ena;
    wire in1;
    wire in2;

    wire [7:0] speed; // Assuming internal speed signal is observable

    motor_dc_top UUT (
        .clk(clk), 
        .rst(rst),
        .speed_inc(speed_inc),
        .forward(forward),
        .ena(ena),
        .in1(in1),
        .in2(in2)
    );

    // Expose internal speed signal (assumes public wire/assign in top)
    assign speed = UUT.speed; // This must exist in motor_dc_top

    // For duty measurement
    wire clk_10kHz = UUT.clk_10kHz;
    wire clk_1kHz = UUT.clk_1kHz;
    integer high_count = 0;
    integer total_count = 0;
    reg [7:0] duty_percentage = 0;

    localparam PERIOD_12MHz = ((1000/12)/2); // ~41.66ns
    localparam PERIOD_10kHz = 50000;         // 10kHz => 50us period
    localparam DURATION = (255 * PERIOD_10kHz * 1); // For a full PWM frame

    // Clock generator
    initial begin
        clk = 0;
        speed_inc = 0;
        forward = 1;
        forever #PERIOD_12MHz clk = ~clk;
    end

    // Simulate a speed increment button press at 400Hz
    task simulate_speed_inc_press;
        begin
            speed_inc  = 0; #4000000;
            speed_inc  = 1; #100000;
            speed_inc  = 0; #50000;
            speed_inc  = 1; #150000;
            speed_inc  = 0; #50000;
            speed_inc  = 1; #250000;
            speed_inc  = 0; #50000;
            speed_inc  = 1; #100000;
            speed_inc  = 0; #50000;
            speed_inc  = 1; #150000;
            speed_inc  = 0; #50000;
            speed_inc  = 1; #250000;
            speed_inc  = 0; #50000;
            speed_inc  = 1; #5000000; //
            speed_inc  = 0; #50000;

            speed_inc  = 1; #250000;
            speed_inc  = 0; #50000;
            speed_inc  = 1; #150000;
            speed_inc  = 0; #50000;
            speed_inc  = 1; #100000;
            speed_inc  = 0; #50000;
            speed_inc  = 1; #100000;
            speed_inc  = 0; #50000;
            speed_inc  = 1; #150000;
            speed_inc  = 0; #50000;
            speed_inc  = 1; #250000;
            speed_inc  = 0; #50000;

        end
    endtask

    // Measure PWM duty cycle
    task measure_duty;
        begin
            high_count = 0;
            total_count = 0;

            repeat (256) begin
                @(posedge clk_10kHz);
                total_count = total_count + 1;
                if (ena) high_count = high_count + 1;
            end

            duty_percentage = (high_count * 100) / total_count;
            $display("Speed = %3d, Forward = %b -> Duty = %3d%%", speed, forward, duty_percentage);
        end
    endtask

    // Test flow
    initial begin
        $dumpfile(`DUMPSTR(`VCD_OUTPUT));
        $dumpvars(0, motor_dc_tb);

        // Reset system
        rst = 1;
       #15000000;

        rst = 0;

        // Simulate 10 speed increment presses
        repeat (6) begin
            simulate_speed_inc_press();
            measure_duty();
            #DURATION;
        end

        // Change direction
        forward = 0;
        rst = 1;
        #15000000;
        measure_duty();
        rst = 0;

        // Simulate 5 more speed increments
        repeat (6) begin
            simulate_speed_inc_press();
            measure_duty();
            #DURATION;
        end
        rst = 1;
        #DURATION;
        rst = 0;
        measure_duty();
        $display("End of simulation");
        $finish;
    end

endmodule
