//-------------------------------------------------------------------
//-- mux41.v
//-- Module
//-------------------------------------------------------------------
//-- Daniel Rodrigo
//-- GPL license
//-------------------------------------------------------------------
// structural for a 4:1 multiplexer
//-------------------------------------------------------------------

`include "../../../basic_logic_design/logic_gates/and3/and3.v"
`include "../../../basic_logic_design/logic_gates/or4/or4.v"

module mux41(s0, s1, d0, d1, d2, d3, z0);

// define inputs and outputs
input s0, s1, d0, d1, d2, d3;
output z0;

// define internal nets
wire net1, net2, net3, net4;

// instantiate the logic gates
and3 and3_0 (d0, ~s0, ~s1, net1);
and3 and3_1 (d1, s0, ~s1, net2);
and3 and3_2 (d2, ~s0, s1, net3);
and3 and3_3 (d3, s0, s1, net4);

or4 or4_0 (net1, net2, net3, net4, z0);

endmodule
