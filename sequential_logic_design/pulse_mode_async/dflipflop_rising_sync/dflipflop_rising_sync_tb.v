//-------------------------------------------------------------------
//-- dflipflop_rising_tb.v
//-- Testbench
//-------------------------------------------------------------------
//-- Daniel Rodrigo
//-- GPL license
//-------------------------------------------------------------------

`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module dflipflop_rising_sync_tb;

    reg clk;
    reg reset;
    reg D;
    wire Q;

    localparam PERIOD = ((1000/12)/2); // ns
    localparam DURATION = 2*PERIOD;  

    dflipflop_rising_sync UUT (.clk(clk), .reset(reset), .D(D), .Q(Q));

    // Create 12Mhz clock
    initial begin
        clk = 0;
        forever #PERIOD clk = ~clk;
    end 

    initial begin
	
		//-- File were to store the simulation results
		$dumpfile(`DUMPSTR(`VCD_OUTPUT));
		$dumpvars(0, dflipflop_rising_sync_tb);
  
        reset = 1;
        D = 0;
        #DURATION;

        reset = 0;
        D = 1;
        #DURATION;

        D = 0;
        #DURATION;

        D = 1;
        #DURATION;

        reset = 1;
        D = 1;
        #DURATION;
		
		$display("End of simulation");
		$finish;
    end
endmodule