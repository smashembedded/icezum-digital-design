//-------------------------------------------------------------------
//-- button_counter_tb.v
//-- Testbench
//-------------------------------------------------------------------
//-- Smash Embedded
//-- GPL license
//-------------------------------------------------------------------

`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module button_counter_tb;
    reg clk;
    reg rst;
    reg b_in;
    wire[7:0] count;

    localparam PERIOD = ((1000/12)/2); // ns 

    button_counter_top UUT (.clk(clk), .rst(rst), .b_in(b_in), .count(count));

    // Create 12Mhz clock
    initial begin
        clk = 1;
        //forever #PERIOD clk = ~clk;
        forever #10 clk = ~clk; // clk only for simulation
    end 

    task b_in_press;
        begin
            b_in  = 0; #4000000;
            b_in  = 1; #100000;
            b_in  = 0; #50000;
            b_in  = 1; #150000;
            b_in  = 0; #50000;
            b_in  = 1; #250000;
            b_in  = 0; #50000;
            b_in  = 1; #100000;
            b_in  = 0; #50000;
            b_in  = 1; #150000;
            b_in  = 0; #50000;
            b_in  = 1; #250000;
            b_in  = 0; #50000;
            b_in  = 1; #5000000; //
            b_in  = 0; #50000;

            b_in  = 1; #250000;
            b_in  = 0; #50000;
            b_in  = 1; #150000;
            b_in  = 0; #50000;
            b_in  = 1; #100000;
            b_in  = 0; #50000;
            b_in  = 1; #100000;
            b_in  = 0; #50000;
            b_in  = 1; #150000;
            b_in  = 0; #50000;
            b_in  = 1; #250000;
            b_in  = 0; #50000;

        end
    endtask
    // Stimulus
    initial begin
        $dumpfile(`DUMPSTR(`VCD_OUTPUT));
        $dumpvars(0, button_counter_tb);


        // Reset system
        rst = 1;
        #1000000
        rst = 0;

        repeat (10) begin
            b_in_press();
            #10000;
        end


        // Reset system
        rst = 1;
        #1000000
        rst = 0;

        repeat (3) begin
            b_in_press();
            #10000;
        end

        // Reset system
        rst = 1;
        #1000000
        rst = 0;
        #4000000;

        $display("End of simulation");
        $finish;
    end

endmodule