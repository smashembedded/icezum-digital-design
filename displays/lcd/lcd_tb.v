//-------------------------------------------------------------------
//-- lcd_tb.v
//-- Testbench
//-------------------------------------------------------------------
//-- Smash Embedded
//-- GPL license
//-------------------------------------------------------------------

`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps


module lcd_tb;

    reg clk;
    reg [127:0] msg_0;
    reg [127:0] msg_1;
    wire rs, rw, en;
    wire [7:0] data;

    lcd uut (
        .clk(clk),
        .msg_0(msg_0),
        .msg_1(msg_1),
        .rs(rs),
        .rw(rw),
        .en(en),
        .data(data)
    );

    localparam PERIOD = ((1000/12)/2); // ns
    localparam DURATION = 15000000*PERIOD;  


    // Create 12Mhz clock
    initial begin
        clk = 0;
        forever #PERIOD clk = ~clk;
    end 

    initial begin
	
		//-- File were to store the simulation results
		$dumpfile(`DUMPSTR(`VCD_OUTPUT));
		$dumpvars(0, lcd_tb);
  
        // Monitor values
        $monitor("Time = %0t | rs = %b | rw = %b | en = %b | data = %h", $time, rs, rw, en, data);

        // Load test message
        msg_0 = "1st Row Message";
        msg_1 = "2nd Row Message";


        // Run simulation for a specified time
        #DURATION;

		$display("End of simulation");
		$finish;
    end
endmodule