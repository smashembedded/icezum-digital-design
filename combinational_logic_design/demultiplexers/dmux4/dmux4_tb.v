//-------------------------------------------------------------------
//-- dmux4_tb.v
//-- Testbench
//-------------------------------------------------------------------
//-- Smash Embedded
//-- GPL license
//-------------------------------------------------------------------

`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module dmux4_tb;

    reg s0, s1, d0;
    wire z0, z1, z2, z3;

    localparam PERIOD = ((1000/12)/2); // ns
    localparam DURATION = 2*PERIOD;  

    dmux4 UUT (.s0(s0), .s1(s1), .d0(d0), .z0(z0), .z1(z1), .z2(z2), .z3(z3));

    //display variables
    initial
    $monitor ("s1 = %b, s0 = %b | d0 =%b | z3 = %b, z2 = %b, z1 =%b, z0 = %b", s0, s1, d0, z3, z2, z1, z0);
    
    initial begin
	
		//-- File were to store the simulation results
		$dumpfile(`DUMPSTR(`VCD_OUTPUT));
		$dumpvars(0, dmux4_tb);

        s1 = 1'b0; s0 = 1'b0;
        d0 = 1'b0; 
        #DURATION
        s1 = 1'b0; s0 = 1'b0;
        d0 = 1'b1; 
        #DURATION

        s1 = 1'b0; s0 = 1'b1;
        d0 = 1'b0; 
        #DURATION
        s1 = 1'b0; s0 = 1'b1;
        d0 = 1'b1; 
        #DURATION

        s1 = 1'b1; s0 = 1'b0;
        d0 = 1'b0; 
        #DURATION
        s1 = 1'b1; s0 = 1'b0;
        d0 = 1'b1; 
        #DURATION

        s1 = 1'b1; s0 = 1'b1;
        d0 = 1'b0; 
        #DURATION
        s1 = 1'b1; s0 = 1'b1;
        d0 = 1'b1; 
        #DURATION

		$display("End of simulation");
		$finish;
    end
endmodule

        
