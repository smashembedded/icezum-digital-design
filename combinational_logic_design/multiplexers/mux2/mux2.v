//-------------------------------------------------------------------
//-- mux2.v
//-- Module
//-------------------------------------------------------------------
//-- Daniel Rodrigo
//-- GPL license
//-------------------------------------------------------------------
// Structural for a 2:1 multiplexer
//-------------------------------------------------------------------

`include "../../../basic_logic_design/logic_gates/and2/and2.v"
`include "../../../basic_logic_design/logic_gates/or2/or2.v"

module mux2(s0, d0, d1, z0);

// define inputs and outputs
input s0, d0, d1;
output z0;

// define internal nets
wire net0, net1;

// instantiate the logic gates
and2 and2_0 (.x0(d0), .x1(~s0), .z0(net0));
and2 and2_1 (.x0(d1), .x1(s0), .z0(net1));
or2 or_2 (.x0(net0), .x1(net1), .z0(z0));

endmodule

