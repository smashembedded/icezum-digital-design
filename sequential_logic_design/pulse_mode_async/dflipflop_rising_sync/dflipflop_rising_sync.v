//-------------------------------------------------------------------
//-- dflipflop_rising.v
//-- Module
//-------------------------------------------------------------------
//-- Daniel Rodrigo
//-- GPL license
//-------------------------------------------------------------------
//-- Rising Edge D Flip Flop with Synchronous Reset
//-------------------------------------------------------------------

module dflipflop_rising_sync (clk, reset, D, Q);

// inputs and output
input clk;
input reset;
input D;
output reg Q;

always @(posedge clk)
begin
    if (reset == 1'b1)
        Q <= 1'b0;
    else
        Q <= D;
end

endmodule
