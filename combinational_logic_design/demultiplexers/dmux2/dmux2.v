//-------------------------------------------------------------------
//-- dmux2.v
//-- Module
//-------------------------------------------------------------------
//-- Smash Embedded
//-- GPL license
//-------------------------------------------------------------------
// Structural for a 1:2 demultiplexer
//-------------------------------------------------------------------

`include "../../../basic_logic_design/logic_gates/and2/and2.v"

module dmux2(s0, d0, z0, z1);

// define inputs and outputs
input s0, d0;
output z0, z1;

// instantiate the logic gates
and2 and2_0 (.x0(d0), .x1(~s0), .z0(z0));
and2 and2_1 (.x0(d0), .x1(s0), .z0(z1));

endmodule

