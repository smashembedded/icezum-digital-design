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

module uart_rx_tb;
    reg clk;
    reg rstn;
    reg rx;
    wire [7:0] last_rx_byte;
    wire rcv;

    // Instantiate UART RX
    uart_rx uut (
        .clk(clk),
        .rstn(rstn),
        .rx(rx),
        .rcv(rcv),
        .last(last_rx_byte)
    );

    // Create 12Mhz clock
    localparam PERIOD = ((1000/12)/2); // ns
    localparam DURATION = 255*PERIOD*2; 

    initial begin
        clk = 0;
        rstn = 1;
        forever #PERIOD clk = ~clk;
    end

    // UART transmission task: sends a byte as start, data[7:0] LSB-first, stop
    task uart_send_byte(input [7:0] byte);
        integer i;
        begin
            rx = 0;  // Start bit
            #(8680); // ~1 / 115200 seconds in ns

            for (i = 0; i < 8; i = i + 1) begin
                rx = byte[i];
                #(8680);
            end

            rx = 1;  // Stop bit
            #(8680);
        end
    endtask

    // Monitor received data
    always @(posedge clk) begin
        if (rcv) begin
            $display("Received: %c (0x%02X) at time %t", last_rx_byte, last_rx_byte, $time);
        end
    end
    
    initial begin

        //-- File where to store the simulation results
        $dumpfile(`DUMPSTR(`VCD_OUTPUT));
        $dumpvars(0, uart_rx_tb);

        rx = 1;  // UART idle line
        rstn = 0;
        #200;
        rstn = 1;

        #1000;  // Wait for reset to propagate

        // Send "H", "i", "\n"
        uart_send_byte("R");
        uart_send_byte("o");
        uart_send_byte("g");
        uart_send_byte("e");
        uart_send_byte("r");
        uart_send_byte(" ");
        uart_send_byte("t");
        uart_send_byte("h");
        uart_send_byte("a");
        uart_send_byte("t");
        uart_send_byte("!");
        uart_send_byte("\n");

        // Allow time for last reception
        #100000;

        $display("End of simulation");
        $finish;
    end
endmodule
