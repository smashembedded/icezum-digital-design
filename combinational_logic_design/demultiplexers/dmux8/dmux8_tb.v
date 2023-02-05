//-------------------------------------------------------------------
//-- dmux8_tb.v
//-- Testbench
//-------------------------------------------------------------------
//-- Daniel Rodrigo
//-- GPL license
//-------------------------------------------------------------------

`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module dmux8_tb;

    reg s0, s1, s2, d0;
    wire z0, z1, z2, z3, z4, z5, z6, z7;

    localparam PERIOD = ((1000/12)/2); // ns
    localparam DURATION = 2*PERIOD;  

    dmux8 UUT (.s0(s0), .s1(s1), .s2(s2), .d0(d0), .z0(z0), .z1(z1), .z2(z2), .z3(z3), .z4(z4), .z5(z5), .z6(z6), .z7(z7));

    //display variables
    initial
    $monitor ("s2 = %b, s1 = %b, s0 = %b | d0 =%b | z7 = %b, z6 = %b, z5 =%b, z4 =%b, z3 = %b, z2 = %b, z1 =%b, z0 =%b", s0, s1, s2, d0, z0, z1, z2, z3, z4, z5, z6, z7);
    
    initial begin
	
		//-- File were to store the simulation results
		$dumpfile(`DUMPSTR(`VCD_OUTPUT));
		$dumpvars(0, dmux8_tb);

        s2 = 1'b0; s1 = 1'b0; s0 = 1'b0;
        d0 = 1'b0;
        #DURATION
        s2 = 1'b0; s1 = 1'b0; s0 = 1'b0;
        d0 = 1'b1;
        #DURATION

        s2 = 1'b0; s1 = 1'b0; s0 = 1'b1;
        d0 = 1'b0;
        #DURATION
        s2 = 1'b0; s1 = 1'b0; s0 = 1'b1;
        d0 = 1'b1;
        #DURATION

        s2 = 1'b0; s1 = 1'b1; s0 = 1'b0;
        d0 = 1'b0;
        #DURATION
        s2 = 1'b0; s1 = 1'b1; s0 = 1'b0;
        d0 = 1'b1;
        #DURATION

        s2 = 1'b0; s1 = 1'b1; s0 = 1'b1;
        d0 = 1'b0;
        #DURATION
        s2 = 1'b0; s1 = 1'b1; s0 = 1'b1;
        d0 = 1'b1;
        #DURATION

        s2 = 1'b1; s1 = 1'b0; s0 = 1'b0;
        d0 = 1'b0;
        #DURATION
        s2 = 1'b1; s1 = 1'b0; s0 = 1'b0;
        d0 = 1'b1;
        #DURATION

        s2 = 1'b1; s1 = 1'b0; s0 = 1'b1;
        d0 = 1'b0;
        #DURATION
        s2 = 1'b1; s1 = 1'b0; s0 = 1'b1;
        d0 = 1'b1;
        #DURATION

        s2 = 1'b1; s1 = 1'b1; s0 = 1'b0;
        d0 = 1'b0;
        #DURATION
        s2 = 1'b1; s1 = 1'b1; s0 = 1'b0;
        d0 = 1'b1;
        #DURATION

        s2 = 1'b1; s1 = 1'b1; s0 = 1'b1;
        d0 = 1'b0;
        #DURATION
        s2 = 1'b1; s1 = 1'b1; s0 = 1'b1;
        d0 = 1'b1;
        #DURATION

		$display("End of simulation");
		$finish;
    end
endmodule

        
