//-------------------------------------------------------------------
//-- uart_msg_rx.v
//-------------------------------------------------------------------
//-- Smash Embedded
//-- GPL license
//-------------------------------------------------------------------
//--  Collect received bytes
//-------------------------------------------------------------------

`default_nettype none

module uart_msg_rx (
    input wire          clk,    // System clock
    input wire          rstn,   // Active-low reset
    input wire          rcv,    // New byte available
    input wire  [7:0]   data,   // Byte from uart_ctrl_rx
    output reg  [7:0]   last    // Latest received byte
);

always @(posedge clk) begin
    if (!rstn)
        last <= 8'd0;
    else if (rcv)
        last <= data;
end

endmodule