//-------------------------------------------------------------------
//-- mux4.v
//-- Module
//-------------------------------------------------------------------
//-- Daniel Rodrigo
//-- GPL license
//-------------------------------------------------------------------
// structural for a 4:1 multiplexer
//-------------------------------------------------------------------

`include "../../../combinational_logic_design/multiplexers/mux2/mux2.v"

module mux4(s0, s1, d0, d1, d2, d3, z0);

// define inputs and outputs
input s0, s1, d0, d1, d2, d3;
output z0;


// define internal nets
wire net0, net1;

// instantiate the logic gates
mux2 mux2_0 (.s0(s0), .d0(d0), .d1(d1), .z0(net0));
mux2 mux2_1 (.s0(s0), .d0(d2), .d1(d3), .z0(net1));
mux2 mux2_2 (.s0(s1), .d0(net0), .d1(net1), .z0(z0));

endmodule
