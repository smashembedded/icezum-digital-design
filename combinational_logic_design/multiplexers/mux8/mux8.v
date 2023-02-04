//-------------------------------------------------------------------
//-- mux8.v
//-- Module
//-------------------------------------------------------------------
//-- Daniel Rodrigo
//-- GPL license
//-------------------------------------------------------------------
// structural for a 8:1 multiplexer
//-------------------------------------------------------------------

`include "../../../combinational_logic_design/multiplexers/mux4/mux4.v"
//`include "../../../combinational_logic_design/multiplexers/mux2/mux2.v"   // It is included in mux4.v

module mux8(s0, s1, s2, d0, d1, d2, d3, d4, d5, d6, d7, z0);

// define inputs and outputs
input s0, s1, s2;
input d0, d1, d2, d3, d4, d5, d6, d7;
output z0;

// define internal nets
wire net0, net1;

// instantiate the logic gates
mux4 mux4_0 (.s0(s0), .s1(s1), .d0(d0), .d1(d1), .d2(d2), .d3(d3), .z0(net0));
mux4 mux4_1 (.s0(s0), .s1(s1), .d0(d4), .d1(d5), .d2(d6), .d3(d7), .z0(net1));
mux2 mux2_0 (.s0(s2), .d0(net0), .d1(net1), .z0(z0));

endmodule
