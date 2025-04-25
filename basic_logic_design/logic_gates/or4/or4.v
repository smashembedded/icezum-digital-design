//-------------------------------------------------------------------
//-- or4.v
//-- Module
//-------------------------------------------------------------------
//-- Smash Embedded
//-- GPL license
//-------------------------------------------------------------------
//-- OR Logic Gate 4:1
//-------------------------------------------------------------------

`include "../or2/or2.v"

module or4 (x0, x1, x2, x3, z2);

// inputs and output
input x0, x1, x2, x3;
output z2;

// define signals
wire x0, x1, x2, x3;
wire z0, z1, z2;

// OR2 Module 1
or2 or2_0(.x0(x0), .x1(x1), .z0(z0));

// OR2 Module 2
or2 or2_1(.x0(x2), .x1(x3), .z0(z1));

// OR2 Module 3
or2 or2_2(.x0(z0), .x1(z1), .z0(z2));

endmodule