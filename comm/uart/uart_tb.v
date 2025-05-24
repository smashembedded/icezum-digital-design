//-------------------------------------------------------------------
//-- uart_tb.v
//-- Testbench
//-------------------------------------------------------------------
//-- Smas Embedded
//-- GPL license
//-------------------------------------------------------------------

`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module uart_tb;

    // Clock & reset
    reg clk = 0;
    reg rstn = 0;

    // UART lines
    reg  rx;   // Simulated UART input to DUT
    wire tx;   // Output from DUT (echo)

    // Instantiate UART
    uart_top uut (
        .clk(clk),
        .rstn(rstn),
        .rx(rx),
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

    // UART send task (simulated serial TX into uart.rx)
    task uart_send_byte(input [7:0] byte);
        integer i;
        begin
            rx = 0;  // Start bit
            #(8680); // ~1 / 115200 s = 8680 ns

            for (i = 0; i < 8; i = i + 1) begin
                rx = byte[i];
                #(8680);
            end

            rx = 1;  // Stop bit
            #(8680);
        end
    endtask
    
    initial begin

        //-- File where to store the simulation results
        $dumpfile(`DUMPSTR(`VCD_OUTPUT));
        $dumpvars(0, uart_tb);


        // Initial states
        rx = 1;         // Idle line
        rstn = 0;       // Apply reset
        #200;
        rstn = 1;

        #1000;          // Wait after reset

        // Send characters via UART: "3", "7", "\n"
        uart_send_byte("3");
        uart_send_byte("7");
        uart_send_byte("\n");

        #400_000;       // Wait for echoes to be processed

        $display("End of simulation");
        $finish;
    end

endmodule
