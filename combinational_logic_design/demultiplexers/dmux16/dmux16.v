//-------------------------------------------------------------------
//-- dmux16.v
//-- Module
//-------------------------------------------------------------------
//-- Daniel Rodrigo
//-- GPL license
//-------------------------------------------------------------------
// structural for a 1:16 demultiplexer
//-------------------------------------------------------------------

`include "../../../combinational_logic_design/demultiplexers/dmux8/dmux8.v"

module dmux16(s0, s1, s2, s3, d0, z0, z1, z2, z3, z4, z5, z6, z7, z8, z9, z10, z11, z12, z13, z14, z15);

// define inputs and outputs
input s0, s1, s2, s3;
input d0;
output z0, z1, z2, z3, z4, z5, z6, z7, z8, z9, z10, z11, z12, z13, z14, z15;

// define internal nets
wire net0, net1;

// instantiate the logic gates
dmux2 dmux2_0 (.s0(s3), .d0(d0), .z0(net0), .z1(net1));
dmux8 dmux8_0 (.s0(s0), .s1(s1), .s2(s2), .d0(net0), .z0(z0), .z1(z1), .z2(z2), .z3(z3), .z4(z4), .z5(z5), .z6(z6), .z7(z7));
dmux8 dmux8_1 (.s0(s0), .s1(s1), .s2(s2), .d0(net1), .z0(z8), .z1(z9), .z2(z10), .z3(z11), .z4(z12), .z5(z13), .z6(z14), .z7(z15));

endmodule
