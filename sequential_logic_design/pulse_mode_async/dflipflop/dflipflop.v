//-------------------------------------------------------------------
//-- dflipflop.v
//-- Module
//-------------------------------------------------------------------
//-- Smash Embedded
//-- GPL license
//-------------------------------------------------------------------
//-- D Flip Flop
//-------------------------------------------------------------------

//https://learnabout-electronics.org/Digital/dig53.php

`include "../../../basic_logic_design/logic_gates/and2/and2.v"


module dflipflop(clk, D, Q, nQ);

// inputs and output
input clk;
input D;
//output reg Q;
//output reg nQ;
output Q;
output nQ;

// define internal nets
wire S, R, nS, nR;
nand2 nand2_0 (.x0(D), .x1(clk), .z0(nS));
nand2 nand2_1 (.x0(nS), .x1(nQ), .z0(Q));
nand2 nand2_2 (.x0(D), .x1(D), .z0(R));
nand2 nand2_3 (.x0(clk), .x1(R), .z0(nR));
nand2 nand2_4 (.x0(Q), .x1(nR), .z0(nQ));

//always @(posedge clk)
//begin

    //and2 and2_0 (.x0(D), .x1(D), .z0(R))

    //Q <= D;
    //nQ <= ~D;
//end

endmodule


module nand2(x0, x1, z0);

// inputs and output
input x0, x1;
output z0;

// define signals
wire x0, x1;
wire z0, aux;

// continuous assign
assign aux = x0 & x1;
assign z0 = ~aux;

endmodule