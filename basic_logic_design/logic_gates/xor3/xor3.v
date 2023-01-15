//-------------------------------------------------------------------
//-- xor3.v
//-- Module
//-------------------------------------------------------------------
//-- Daniel Rodrigo
//-- GPL license
//-------------------------------------------------------------------
//-- XOR Logic Gate 3:1
//-------------------------------------------------------------------

module and3(x0, x1, x2, z0);

// inputs and output
input x0, x1, x2;
output z0;

// define signals
wire x0, x1, x2;
wire z0;

// continuous assign
assign z0 = x0 ^ x1 ^ x2;

endmodule