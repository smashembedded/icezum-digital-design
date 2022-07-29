//-------------------------------------------------------------------
//-- and2_tb.v
//-- Testbench
//-------------------------------------------------------------------
//-- Daniel Rodrigo
//-- GPL license
//-------------------------------------------------------------------

`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module and2_tb;

    reg SW1, SW2;
    wire LED0;

    //-- Simulation time: 20ns (20 * 1ns)
    localparam DURATION = 20;  

    and2 UUT (.SW1(SW1), .SW2(SW2), .LED0(LED0));
    
    initial begin
	
		//-- File were to store the simulation results
		$dumpfile(`DUMPSTR(`VCD_OUTPUT));
		$dumpvars(0, and2_tb);
  
        SW1 = 0;
        SW2 = 0;
        #DURATION;

        SW1 = 0;
        SW2 = 1;
        #DURATION;

        SW1 = 1;
        SW2 = 0;
        #DURATION;

        SW1 = 1;
        SW2 = 1;
        #DURATION;
		
		$display("End of simulation");
		$finish;
    end
endmodule