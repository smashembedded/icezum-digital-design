//-------------------------------------------------------------------
//-- mux2_tb.v
//-- Testbench
//-------------------------------------------------------------------
//-- Daniel Rodrigo
//-- GPL license
//-------------------------------------------------------------------

`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module mux2_tb;

    reg s0, d0, d1;
    wire z0;

    localparam PERIOD = ((1000/12)/2); // ns
    localparam DURATION = 2*PERIOD;  

    mux2 UUT (.s0(s0), .d0(d0), .d1(d1), .z0(z0));

    //display variables
    initial
    $monitor ("s0 = %b | d1 = %b, d0 = %b | z0 = %b", s0, d1, d0, z0);
    
    initial begin
	
		//-- File were to store the simulation results
		$dumpfile(`DUMPSTR(`VCD_OUTPUT));
		$dumpvars(0, mux2_tb);

        s0 = 1'b0;
        d1 = 1'b0; d0 = 1'b0;
        #DURATION
        s0 = 1'b0;
        d1 = 1'b0; d0 = 1'b1;
        #DURATION

        s0 = 1'b0;
        d1 = 1'b1; d0 = 1'b0;
        #DURATION
        s0 = 1'b0;
        d1 = 1'b1; d0 = 1'b1;
        #DURATION

        s0 = 1'b1;
        d1 = 1'b0; d0 = 1'b0;
        #DURATION
        s0 = 1'b1;
        d1 = 1'b0; d0 = 1'b1;
        #DURATION

        s0 = 1'b1;
        d1 = 1'b1; d0 = 1'b0;
        #DURATION
        s0 = 1'b1;
        d1 = 1'b1; d0 = 1'b1;
        #DURATION

		$display("End of simulation");
		$finish;
    end
endmodule

        
