//-------------------------------------------------------------------
//-- logic_gates2.v
//-- Module
//-------------------------------------------------------------------
//-- Smash Embedded
//-- GPL license
//-------------------------------------------------------------------
//-- AND, OR, XOR, NAND, NOR, XNOR Logic Gated 2:1
//-------------------------------------------------------------------

`include "../and2/and2.v"
`include "../or2/or2.v"
`include "../xor2/xor2.v"

module logic_gates2(x0, x1, leds);

input x0, x1;
output[5:0] leds;

wire x0, x1;
wire[2:0] data;

// AND2 Module
and2 and2_0(.x0(x0), .x1(x1), .z0(data[0]));

// OR2 Module
or2 or2_0(.x0(x0), .x1(x1), .z0(data[1]));

// XOR2 Module
xor2 xor2_0(.x0(x0), .x1(x1), .z0(data[2]));

// continuous assign
assign leds[0] = data[0];   //AND2
assign leds[1] = data[1];   //OR2
assign leds[2] = data[2];   //XOR2
assign leds[3] = !data[0];  //NAND2
assign leds[4] = !data[1];  //NOR2
assign leds[5] = !data[2];  //XNOR2

endmodule