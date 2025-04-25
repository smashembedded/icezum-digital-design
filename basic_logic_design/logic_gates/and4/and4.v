//-------------------------------------------------------------------
//-- and4.v
//-- Module
//-------------------------------------------------------------------
//-- Smash Embedded
//-- GPL license
//-------------------------------------------------------------------
//-- AND Logic Gate 4:1
//-------------------------------------------------------------------

`include "../and2/and2.v"

module and4(x0, x1, x2, x3, z2);

// inputs and output
input x0, x1, x2, x3;
output z2;

// define signals
wire x0, x1, x2, x3;
wire z0, z1, z2;

// AND2 Module 1
and2 and2_0(.x0(x0), .x1(x1), .z0(z0));

// AND2 Module 2
and2 and2_1(.x0(x2), .x1(x3), .z0(z1));

// AND2 Module 3
and2 and2_2(.x0(z0), .x1(z1), .z0(z2));

endmodule