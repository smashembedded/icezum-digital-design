//-------------------------------------------------------------------
//-- mux4_tb.v
//-- Testbench
//-------------------------------------------------------------------
//-- Daniel Rodrigo
//-- GPL license
//-------------------------------------------------------------------

`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module mux4_tb;

    reg s0, s1, d0, d1, d2, d3;
    wire z0;

    localparam PERIOD = ((1000/12)/2); // ns
    localparam DURATION = 2*PERIOD;  

    mux4 UUT (.s0(s0), .s1(s1), .d0(d0), .d1(d1), .d2(d2), .d3(d3), .z0(z0));

    //display variables
    initial
    $monitor ("s1 = %b, s0 = %b, d3 =%b, d2 = %b, d1 = %b, d0 =%b, z0 = %b", s0, s1, d0, d1, d2, d3, z0);
    
    initial begin
	
		//-- File were to store the simulation results
		$dumpfile(`DUMPSTR(`VCD_OUTPUT));
		$dumpvars(0, mux4_tb);

        s1 = 1'b0; s0 = 1'b0;
        d3 = 1'b0; d2 = 1'b0; d1 = 1'b0; d0 = 1'b0;
        #DURATION
        s1 = 1'b0; s0 = 1'b0;
        d3 = 1'b0; d2 = 1'b0; d1 = 1'b0; d0 = 1'b1;
        #DURATION
        s1 = 1'b0; s0 = 1'b0;
        d3 = 1'b0; d2 = 1'b0; d1 = 1'b1; d0 = 1'b0;
        #DURATION
        s1 = 1'b0; s0 = 1'b0;
        d3 = 1'b0; d2 = 1'b0; d1 = 1'b1; d0 = 1'b1;
        #DURATION
        s1 = 1'b0; s0 = 1'b0;
        d3 = 1'b0; d2 = 1'b1; d1 = 1'b0; d0 = 1'b0;
        #DURATION
        s1 = 1'b0; s0 = 1'b0;
        d3 = 1'b0; d2 = 1'b1; d1 = 1'b0; d0 = 1'b1;
        #DURATION
        s1 = 1'b0; s0 = 1'b0;
        d3 = 1'b0; d2 = 1'b1; d1 = 1'b1; d0 = 1'b0;
        #DURATION
        s1 = 1'b0; s0 = 1'b0;
        d3 = 1'b0; d2 = 1'b1; d1 = 1'b1; d0 = 1'b1;
        #DURATION
        s1 = 1'b0; s0 = 1'b0;
        d3 = 1'b1; d2 = 1'b0; d1 = 1'b0; d0 = 1'b0;
        #DURATION
        s1 = 1'b0; s0 = 1'b0;
        d3 = 1'b1; d2 = 1'b0; d1 = 1'b0; d0 = 1'b1;
        #DURATION
        s1 = 1'b0; s0 = 1'b0;
        d3 = 1'b1; d2 = 1'b0; d1 = 1'b1; d0 = 1'b0;
        #DURATION
        s1 = 1'b0; s0 = 1'b0;
        d3 = 1'b1; d2 = 1'b0; d1 = 1'b1; d0 = 1'b1;
        #DURATION
        s1 = 1'b0; s0 = 1'b0;
        d3 = 1'b1; d2 = 1'b1; d1 = 1'b0; d0 = 1'b0;
        #DURATION
        s1 = 1'b0; s0 = 1'b0;
        d3 = 1'b1; d2 = 1'b1; d1 = 1'b0; d0 = 1'b1;
        #DURATION
        s1 = 1'b0; s0 = 1'b0;
        d3 = 1'b1; d2 = 1'b1; d1 = 1'b1; d0 = 1'b0;
        #DURATION
        s1 = 1'b0; s0 = 1'b0;
        d3 = 1'b1; d2 = 1'b1; d1 = 1'b1; d0 = 1'b1;
        #DURATION


        s1 = 1'b0; s0 = 1'b1;
        d3 = 1'b0; d2 = 1'b0; d1 = 1'b0; d0 = 1'b0;
        #DURATION
        s1 = 1'b0; s0 = 1'b1;
        d3 = 1'b0; d2 = 1'b0; d1 = 1'b0; d0 = 1'b1;
        #DURATION
        s1 = 1'b0; s0 = 1'b1;
        d3 = 1'b0; d2 = 1'b0; d1 = 1'b1; d0 = 1'b0;
        #DURATION
        s1 = 1'b0; s0 = 1'b1;
        d3 = 1'b0; d2 = 1'b0; d1 = 1'b1; d0 = 1'b1;
        #DURATION
        s1 = 1'b0; s0 = 1'b1;
        d3 = 1'b0; d2 = 1'b1; d1 = 1'b0; d0 = 1'b0;
        #DURATION
        s1 = 1'b0; s0 = 1'b1;
        d3 = 1'b0; d2 = 1'b1; d1 = 1'b0; d0 = 1'b1;
        #DURATION
        s1 = 1'b0; s0 = 1'b1;
        d3 = 1'b0; d2 = 1'b1; d1 = 1'b1; d0 = 1'b0;
        #DURATION
        s1 = 1'b0; s0 = 1'b1;
        d3 = 1'b0; d2 = 1'b1; d1 = 1'b1; d0 = 1'b1;
        #DURATION
        s1 = 1'b0; s0 = 1'b1;
        d3 = 1'b1; d2 = 1'b0; d1 = 1'b0; d0 = 1'b0;
        #DURATION
        s1 = 1'b0; s0 = 1'b1;
        d3 = 1'b1; d2 = 1'b0; d1 = 1'b0; d0 = 1'b1;
        #DURATION
        s1 = 1'b0; s0 = 1'b1;
        d3 = 1'b1; d2 = 1'b0; d1 = 1'b1; d0 = 1'b0;
        #DURATION
        s1 = 1'b0; s0 = 1'b1;
        d3 = 1'b1; d2 = 1'b0; d1 = 1'b1; d0 = 1'b1;
        #DURATION
        s1 = 1'b0; s0 = 1'b1;
        d3 = 1'b1; d2 = 1'b1; d1 = 1'b0; d0 = 1'b0;
        #DURATION
        s1 = 1'b0; s0 = 1'b1;
        d3 = 1'b1; d2 = 1'b1; d1 = 1'b0; d0 = 1'b1;
        #DURATION
        s1 = 1'b0; s0 = 1'b1;
        d3 = 1'b1; d2 = 1'b1; d1 = 1'b1; d0 = 1'b0;
        #DURATION
        s1 = 1'b0; s0 = 1'b1;
        d3 = 1'b1; d2 = 1'b1; d1 = 1'b1; d0 = 1'b1;
        #DURATION


        s1 = 1'b1; s0 = 1'b0;
        d3 = 1'b0; d2 = 1'b0; d1 = 1'b0; d0 = 1'b0;
        #DURATION
        s1 = 1'b1; s0 = 1'b0;
        d3 = 1'b0; d2 = 1'b0; d1 = 1'b0; d0 = 1'b1;
        #DURATION
        s1 = 1'b1; s0 = 1'b0;
        d3 = 1'b0; d2 = 1'b0; d1 = 1'b1; d0 = 1'b0;
        #DURATION
        s1 = 1'b1; s0 = 1'b0;
        d3 = 1'b0; d2 = 1'b0; d1 = 1'b1; d0 = 1'b1;
        #DURATION
        s1 = 1'b1; s0 = 1'b0;
        d3 = 1'b0; d2 = 1'b1; d1 = 1'b0; d0 = 1'b0;
        #DURATION
        s1 = 1'b1; s0 = 1'b0;
        d3 = 1'b0; d2 = 1'b1; d1 = 1'b0; d0 = 1'b1;
        #DURATION
        s1 = 1'b1; s0 = 1'b0;
        d3 = 1'b0; d2 = 1'b1; d1 = 1'b1; d0 = 1'b0;
        #DURATION
        s1 = 1'b1; s0 = 1'b0;
        d3 = 1'b0; d2 = 1'b1; d1 = 1'b1; d0 = 1'b1;
        #DURATION
        s1 = 1'b1; s0 = 1'b0;
        d3 = 1'b1; d2 = 1'b0; d1 = 1'b0; d0 = 1'b0;
        #DURATION
        s1 = 1'b1; s0 = 1'b0;
        d3 = 1'b1; d2 = 1'b0; d1 = 1'b0; d0 = 1'b1;
        #DURATION
        s1 = 1'b1; s0 = 1'b0;
        d3 = 1'b1; d2 = 1'b0; d1 = 1'b1; d0 = 1'b0;
        #DURATION
        s1 = 1'b1; s0 = 1'b0;
        d3 = 1'b1; d2 = 1'b0; d1 = 1'b1; d0 = 1'b1;
        #DURATION
        s1 = 1'b1; s0 = 1'b0;
        d3 = 1'b1; d2 = 1'b1; d1 = 1'b0; d0 = 1'b0;
        #DURATION
        s1 = 1'b1; s0 = 1'b0;
        d3 = 1'b1; d2 = 1'b1; d1 = 1'b0; d0 = 1'b1;
        #DURATION
        s1 = 1'b1; s0 = 1'b0;
        d3 = 1'b1; d2 = 1'b1; d1 = 1'b1; d0 = 1'b0;
        #DURATION
        s1 = 1'b1; s0 = 1'b0;
        d3 = 1'b1; d2 = 1'b1; d1 = 1'b1; d0 = 1'b1;
        #DURATION


        s1 = 1'b1; s0 = 1'b1;
        d3 = 1'b0; d2 = 1'b0; d1 = 1'b0; d0 = 1'b0;
        #DURATION
        s1 = 1'b1; s0 = 1'b1;
        d3 = 1'b0; d2 = 1'b0; d1 = 1'b0; d0 = 1'b1;
        #DURATION
        s1 = 1'b1; s0 = 1'b1;
        d3 = 1'b0; d2 = 1'b0; d1 = 1'b1; d0 = 1'b0;
        #DURATION
        s1 = 1'b1; s0 = 1'b1;
        d3 = 1'b0; d2 = 1'b0; d1 = 1'b1; d0 = 1'b1;
        #DURATION
        s1 = 1'b1; s0 = 1'b1;
        d3 = 1'b0; d2 = 1'b1; d1 = 1'b0; d0 = 1'b0;
        #DURATION
        s1 = 1'b1; s0 = 1'b1;
        d3 = 1'b0; d2 = 1'b1; d1 = 1'b0; d0 = 1'b1;
        #DURATION
        s1 = 1'b1; s0 = 1'b1;
        d3 = 1'b0; d2 = 1'b1; d1 = 1'b1; d0 = 1'b0;
        #DURATION
        s1 = 1'b1; s0 = 1'b1;
        d3 = 1'b0; d2 = 1'b1; d1 = 1'b1; d0 = 1'b1;
        #DURATION
        s1 = 1'b1; s0 = 1'b1;
        d3 = 1'b1; d2 = 1'b0; d1 = 1'b0; d0 = 1'b0;
        #DURATION
        s1 = 1'b1; s0 = 1'b1;
        d3 = 1'b1; d2 = 1'b0; d1 = 1'b0; d0 = 1'b1;
        #DURATION
        s1 = 1'b1; s0 = 1'b1;
        d3 = 1'b1; d2 = 1'b0; d1 = 1'b1; d0 = 1'b0;
        #DURATION
        s1 = 1'b1; s0 = 1'b1;
        d3 = 1'b1; d2 = 1'b0; d1 = 1'b1; d0 = 1'b1;
        #DURATION
        s1 = 1'b1; s0 = 1'b1;
        d3 = 1'b1; d2 = 1'b1; d1 = 1'b0; d0 = 1'b0;
        #DURATION
        s1 = 1'b1; s0 = 1'b1;
        d3 = 1'b1; d2 = 1'b1; d1 = 1'b0; d0 = 1'b1;
        #DURATION
        s1 = 1'b1; s0 = 1'b1;
        d3 = 1'b1; d2 = 1'b1; d1 = 1'b1; d0 = 1'b0;
        #DURATION
        s1 = 1'b1; s0 = 1'b1;
        d3 = 1'b1; d2 = 1'b1; d1 = 1'b1; d0 = 1'b1;
        #DURATION

		$display("End of simulation");
		$finish;
    end
endmodule

        
