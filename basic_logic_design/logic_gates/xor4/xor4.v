//-------------------------------------------------------------------
//-- xor4.v
//-- Module
//-------------------------------------------------------------------
//-- Daniel Rodrigo
//-- GPL license
//-------------------------------------------------------------------
//-- XOR Logic Gate 4:1
//-------------------------------------------------------------------

`include "../xor2/xor2.v"

module xor4 (x0, x1, x2, x3, z2);

// inputs and output
input x0, x1, x2, x3;
output z2;

// define signals
wire x0, x1, x2, x3;
wire z0, z1, z2;

// XOR2 Module 1
xor2 xor2_0(.x0(x0), .x1(x1), .z0(z0));

// XOR2 Module 2
xor2 xor2_1(.x0(x2), .x1(x3), .z0(z1));

// XOR2 Module 3
xor2 xor2_2(.x0(z0), .x1(z1), .z0(z2));

endmodule