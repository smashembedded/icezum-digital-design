//-------------------------------------------------------------------
//-- dflipflop_rising.v
//-- Module
//-------------------------------------------------------------------
//-- Smash Embedded
//-- GPL license
//-------------------------------------------------------------------
//-- Rising Edge D Flip Flop
//-------------------------------------------------------------------

module dflipflop_rising (
    input clk,
    input rst,      // Active-high synchronous reset
    input D,
    output reg Q,
    output reg nQ
);

always @(posedge clk) begin
    if (rst) begin
        Q <= 1'b0;
        nQ <= 1'b1;
    end else begin
        Q <= D;
        nQ <= ~D;
    end
end

endmodule
