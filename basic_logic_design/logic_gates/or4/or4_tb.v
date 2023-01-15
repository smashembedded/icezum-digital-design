//-------------------------------------------------------------------
//-- or4_tb.v
//-- Testbench
//-------------------------------------------------------------------
//-- Daniel Rodrigo
//-- GPL license
//-------------------------------------------------------------------

`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module or4_tb;

    reg x0, x1, x2, x3;
    wire z2;

    localparam PERIOD = ((1000/12)/2); // ns
    localparam DURATION = 2*PERIOD;  

    or4 UUT (.x0(x0), .x1(x1), .x2(x2), .x3(x3), .z2(z2));
    
    initial begin
	
		//-- File were to store the simulation results
		$dumpfile(`DUMPSTR(`VCD_OUTPUT));
		$dumpvars(0, or4_tb);
  
        x0 = 0;
		x1 = 0;
        x2 = 0;
        x3 = 0;
        #DURATION;

        x0 = 0;
		x1 = 0;
        x2 = 0;
        x3 = 1;
        #DURATION;

        x0 = 0;
		x1 = 0;
        x2 = 1;
        x3 = 0;
        #DURATION;

        x0 = 0;
		x1 = 0;
        x2 = 1;
        x3 = 1;
        #DURATION;
		
        x0 = 0;
		x1 = 1;
        x2 = 0;
        x3 = 0;
        #DURATION;

        x0 = 0;
		x1 = 1;
        x2 = 0;
        x3 = 1;
        #DURATION;

        x0 = 0;
		x1 = 1;
        x2 = 1;
        x3 = 0;
        #DURATION;

        x0 = 0;
		x1 = 1;
        x2 = 1;
        x3 = 1;
        #DURATION;

        x0 = 1;
		x1 = 0;
        x2 = 0;
        x3 = 0;
        #DURATION;

        x0 = 1;
		x1 = 0;
        x2 = 0;
        x3 = 1;
        #DURATION;

        x0 = 1;
		x1 = 0;
        x2 = 1;
        x3 = 0;
        #DURATION;

        x0 = 1;
		x1 = 0;
        x2 = 1;
        x3 = 1;
        #DURATION;
		
        x0 = 1;
		x1 = 1;
        x2 = 0;
        x3 = 0;
        #DURATION;

        x0 = 1;
		x1 = 1;
        x2 = 0;
        x3 = 1;
        #DURATION;

        x0 = 1;
		x1 = 1;
        x2 = 1;
        x3 = 0;
        #DURATION;

        x0 = 1;
		x1 = 1;
        x2 = 1;
        x3 = 1;
        #DURATION;
		
		$display("End of simulation");
		$finish;
    end
endmodule