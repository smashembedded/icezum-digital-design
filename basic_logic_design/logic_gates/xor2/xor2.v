//-------------------------------------------------------------------
//-- xor2.v
//-- Module
//-------------------------------------------------------------------
//-- Daniel Rodrigo
//-- GPL license
//-------------------------------------------------------------------
//-- XOR Logic Gate 2:1
//-------------------------------------------------------------------

module xor2(x0, x1, z0);

// inputs and output
input x0, x1;
output z0;

// define signals
wire x0, x1;
wire z0;

// continuous assign
assign z0 = x0 ^ x1;

endmodule