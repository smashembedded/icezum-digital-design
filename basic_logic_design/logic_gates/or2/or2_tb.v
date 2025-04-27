//-------------------------------------------------------------------
//-- or2_tb.v
//-- Testbench
//-------------------------------------------------------------------
//-- Smash Embedded
//-- GPL license
//-------------------------------------------------------------------

`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module or2_tb;

    reg x0, x1;
    wire z0;

    localparam PERIOD = ((1000/12)/2); // ns
    localparam DURATION = 2*PERIOD;   

    or2 UUT (.x0(x0), .x1(x1), .z0(z0));
    
    initial begin
	
		//-- File were to store the simulation results
		$dumpfile(`DUMPSTR(`VCD_OUTPUT));
		$dumpvars(0, or2_tb);
  
        x0 = 0;
        x1 = 0;
        #DURATION;

        x0 = 0;
        x1 = 1;
        #DURATION;

        x0 = 1;
        x1 = 0;
        #DURATION;

        x0 = 1;
        x1 = 1;
        #DURATION;
		
		$display("End of simulation");
		$finish;
    end
endmodule