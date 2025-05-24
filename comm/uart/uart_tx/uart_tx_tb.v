//-------------------------------------------------------------------
//-- uart_tx_tb.v
//-- Testbench
//-------------------------------------------------------------------
//-- Smas Embedded
//-- GPL license
//-------------------------------------------------------------------

`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module uart_tx_tb;
    reg clk;
    reg rstn;
    wire tx;

    parameter MSG_LEN = 11;
    parameter DELAY_CYCLES = 0;

    // message: "Value: 101\n"
    wire [8*MSG_LEN-1:0] msg = {
        8'h0A,  // '\n'
        8'h31,  // '1'
        8'h30,  // '0'
        8'h31,  // '1'
        8'h20,  // ' '
        8'h3A,  // ':'
        8'h65,  // 'e'
        8'h75,  // 'u'
        8'h6C,  // 'l'
        8'h61,  // 'a'
        8'h56   // 'V'
    };

    // Instantiate UART TX
    uart_tx #(
        .MSG_LEN(MSG_LEN),
        .DELAY_CYCLES(DELAY_CYCLES)
    ) uut (
        .clk(clk),
        .rstn(rstn),
        .msg(msg),
        .tx(tx)
    );

    // Create 12Mhz clock
    localparam PERIOD = ((1000/12)/2); // ns
    localparam DURATION = 255*PERIOD*2; 

    initial begin
        clk = 0;
        rstn = 1;
        forever #PERIOD clk = ~clk;
    end

    
    initial begin

        //-- File where to store the simulation results
        $dumpfile(`DUMPSTR(`VCD_OUTPUT));
        $dumpvars(0, uart_tx_tb);

        rstn = 0;
        #PERIOD;
        #PERIOD;
        rstn = 1;
        #PERIOD;
        #PERIOD;

        // Several transmission
        #20_000_000;

        $display("End of simulation");
        $finish;
    end
endmodule
