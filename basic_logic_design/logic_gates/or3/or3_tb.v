//-------------------------------------------------------------------
//-- or3_tb.v
//-- Testbench
//-------------------------------------------------------------------
//-- Daniel Rodrigo
//-- GPL license
//-------------------------------------------------------------------

`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module or3_tb;

    reg x0, x1, x2;
    wire z0;

    //-- Simulation time: 20ns (20 * 1ns)
    localparam DURATION = 20;  

    or3 UUT (.x0(x0), .x1(x1), .x2(x2), .z0(z0));
    
    initial begin
	
		//-- File were to store the simulation results
		$dumpfile(`DUMPSTR(`VCD_OUTPUT));
		$dumpvars(0, or3_tb);
  
		x0 = 0;
        x1 = 0;
        x2 = 0;
        #DURATION;

		x0 = 0;
        x1 = 0;
        x2 = 1;
        #DURATION;

		x0 = 0;
        x1 = 1;
        x2 = 0;
        #DURATION;

		x0 = 0;
        x1 = 1;
        x2 = 1;
        #DURATION;
		
		x0 = 1;
        x1 = 0;
        x2 = 0;
        #DURATION;

		x0 = 1;
        x1 = 0;
        x2 = 1;
        #DURATION;

		x0 = 1;
        x1 = 1;
        x2 = 0;
        #DURATION;

		x0 = 1;
        x1 = 1;
        x2 = 1;
        #DURATION;
		
		$display("End of simulation");
		$finish;
    end
endmodule