//-------------------------------------------------------------------
//-- button_debouncer_tb.v
//-- Testbench
//-------------------------------------------------------------------
//-- Smash Embedded
//-- GPL license
//-------------------------------------------------------------------

`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module button_debouncer_tb;

    reg b_in;
    reg clk;
    reg rst;
    wire b_out_level;
    wire b_out_pulse;
    wire [7:0] leds;

    localparam PERIOD = ((1000/12)/2); // ns 


    button_debouncer_top UUT (.clk(clk), .rst(rst), .b_in(b_in), .b_out_level(b_out_level), .b_out_pulse(b_out_pulse), .leds(leds));

    // Create 12Mhz clock
    initial begin
        clk = 1;
        //forever #PERIOD clk = ~clk;
        forever #10 clk = ~clk; // clk only for simulation
    end 

        // Simulate a speed increment button press at 400Hz
    task b_in_press;
        begin
            b_in  = 0; #4000000;
            b_in  = 1; #100000;
            b_in  = 0; #50000;
            b_in  = 1; #150000;
            b_in  = 0; #50000;
            b_in  = 1; #250000;
            b_in  = 0; #50000;
            b_in  = 1; #100000;
            b_in  = 0; #50000;
            b_in  = 1; #150000;
            b_in  = 0; #50000;
            b_in  = 1; #250000;
            b_in  = 0; #50000;
            b_in  = 1; #5000000; //
            b_in  = 0; #50000;

            b_in  = 1; #250000;
            b_in  = 0; #50000;
            b_in  = 1; #150000;
            b_in  = 0; #50000;
            b_in  = 1; #100000;
            b_in  = 0; #50000;
            b_in  = 1; #100000;
            b_in  = 0; #50000;
            b_in  = 1; #150000;
            b_in  = 0; #50000;
            b_in  = 1; #250000;
            b_in  = 0; #50000;

        end
    endtask

    initial begin
	
		//-- File were to store the simulation results
		$dumpfile(`DUMPSTR(`VCD_OUTPUT));
		$dumpvars(0, button_debouncer_tb);

        // Reset system
        rst = 1;
        #1000000
        rst = 0;

        repeat (5) begin
            b_in_press();
            #10000;
        end
        #4000000
		
        $display("End of simulation");
		$finish;
    end
endmodule