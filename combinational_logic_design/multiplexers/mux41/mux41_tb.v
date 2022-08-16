//-------------------------------------------------------------------
//-- mux41_tb.v
//-- Testbench
//-------------------------------------------------------------------
//-- Daniel Rodrigo
//-- GPL license
//-------------------------------------------------------------------

`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module mux41_tb;

    reg s0, s1, d0, d1, d2, d3;
    wire z0;

    //-- Simulation time: 20ns (20 * 1ns)
    localparam DURATION = 20;  

    mux41 UUT (.s0(s0), .s1(s1), .d0(d0), .d1(d1), .d2(d2), .d3(d3), .z0(z0));

    //display variables
    initial
    $monitor ("s0 = %b, s1 = %b, d0 = %b, d1 = %b, d2 = %b, d3 = %b, z0 = %b", s0, s1, d0, d1, d2, d3, z0);
    
    initial begin
	
		//-- File were to store the simulation results
		$dumpfile(`DUMPSTR(`VCD_OUTPUT));
		$dumpvars(0, mux41_tb);

        s0 = 1'b0; s1 = 1'b0;
        d0 = 1'b1; d1 = 1'b0; d2 = 1'b0; d3 = 1'b0;
        #DURATION
        s0 = 1'b0; s1 = 1'b0;
        d0 = 1'b0; d1 = 1'b0; d2 = 1'b0; d3 = 1'b0;
        #DURATION

        s0 = 1'b1; s1 = 1'b0;
        d0 = 1'b0; d1 = 1'b1; d2 = 1'b0; d3 = 1'b0;
        #DURATION
        s0 = 1'b1; s1 = 1'b0;
        d0 = 1'b0; d1 = 1'b0; d2 = 1'b0; d3 = 1'b0;
        #DURATION

        s0 = 1'b0; s1 = 1'b1;
        d0 = 1'b0; d1 = 1'b0; d2 = 1'b1; d3 = 1'b0;
        #DURATION
        s0 = 1'b0; s1 = 1'b1;
        d0 = 1'b0; d1 = 1'b0; d2 = 1'b0; d3 = 1'b0;
        #DURATION

        s0 = 1'b1; s1 = 1'b1;
        d0 = 1'b0; d1 = 1'b0; d2 = 1'b0; d3 = 1'b1;
        #DURATION
        s0 = 1'b1; s1 = 1'b1;
        d0 = 1'b0; d1 = 1'b0; d2 = 1'b0; d3 = 1'b0;
        #DURATION

        s0 = 1'b1; s1 = 1'b0;
        d0 = 1'b1; d1 = 1'b1; d2 = 1'b0; d3 = 1'b1;
        #DURATION
        s0 = 1'b1; s1 = 1'b0;
        d0 = 1'b0; d1 = 1'b0; d2 = 1'b1; d3 = 1'b0;
        #DURATION

		$finish;
    end
endmodule

        
