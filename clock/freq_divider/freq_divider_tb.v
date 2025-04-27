//-------------------------------------------------------------------
//-- freq_divider_tb.v
//-- Testbench
//-------------------------------------------------------------------
//-- Smash Embedded
//-- GPL license
//-------------------------------------------------------------------

`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module freq_divider_tb;

    reg clk_in;
    wire clk_out1;
    wire clk_out2;
    wire clk_out3;

    localparam PERIOD = ((1000/12)/2); // ns
    localparam DURATION = 2*30*PERIOD;  //2*12000000*PERIOD;  

    freq_divider #(.DIV(28'd15)) UUT_1 (.clk_in(clk_in), .clk_out(clk_out1));
    freq_divider #(.DIV(28'd30)) UUT_2  (.clk_in(clk_in), .clk_out(clk_out2));
    freq_divider #(.DIV(28'd60)) UUT_3 (.clk_in(clk_in), .clk_out(clk_out3));


    // Create 12Mhz clock
    initial begin
        clk_in = 1;
        forever #PERIOD clk_in = ~clk_in;
    end 

    initial begin
	
		//-- File were to store the simulation results
		$dumpfile(`DUMPSTR(`VCD_OUTPUT));
		$dumpvars(0, freq_divider_tb);
  
        #DURATION;

        #DURATION;

        #DURATION;

		$display("End of simulation");
		$finish;
    end
endmodule