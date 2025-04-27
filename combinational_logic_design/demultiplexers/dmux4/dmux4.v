//-------------------------------------------------------------------
//-- dmux4.v
//-- Module
//-------------------------------------------------------------------
//-- Smash Embedded
//-- GPL license
//-------------------------------------------------------------------
// structural for a 1:4 demultiplexer
//-------------------------------------------------------------------

`include "../../../combinational_logic_design/demultiplexers/dmux2/dmux2.v"

module dmux4(s0, s1, d0, z0, z1, z2, z3);

// define inputs and outputs
input s0, s1, d0;
output z0, z1, z2, z3;

// define internal nets
wire net0, net1;

// instantiate the logic gates
dmux2 dmux2_0 (.s0(s1), .d0(d0), .z0(net0), .z1(net1));
dmux2 dmux2_1 (.s0(s0), .d0(net0), .z0(z0), .z1(z1));
dmux2 dmux2_2 (.s0(s0), .d0(net1), .z0(z2), .z1(z3));

endmodule
