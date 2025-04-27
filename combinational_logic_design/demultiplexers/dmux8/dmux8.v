//-------------------------------------------------------------------
//-- dmux8.v
//-- Module
//-------------------------------------------------------------------
//-- Smash Embedded
//-- GPL license
//-------------------------------------------------------------------
// structural for a 1:8 demultiplexer
//-------------------------------------------------------------------

`include "../../../combinational_logic_design/demultiplexers/dmux4/dmux4.v"

module dmux8(s0, s1, s2, d0, z0, z1, z2, z3, z4, z5, z6, z7);

// define inputs and outputs
input s0, s1, s2;
input d0;
output z0, z1, z2, z3, z4, z5, z6, z7;

// define internal nets
wire net0, net1;

// instantiate the logic gates
dmux2 dmux2_0 (.s0(s2), .d0(d0), .z0(net0), .z1(net1));
dmux4 dmux4_0 (.s0(s0), .s1(s1), .d0(net0), .z0(z0), .z1(z1), .z2(z2), .z3(z3));
dmux4 dmux4_1 (.s0(s0), .s1(s1), .d0(net1), .z0(z4), .z1(z5), .z2(z6), .z3(z7));

endmodule
