//-------------------------------------------------------------------
//-- freq_divider.v
//-- Module
//-------------------------------------------------------------------
//-- Smash Embedded
//-- GPL license
//-------------------------------------------------------------------
//-- Frequency Divider
//-------------------------------------------------------------------

module freq_divider #(parameter DIV=28'd30) (clk_in, clk_out);

// inputs and output
input clk_in;
output reg clk_out;

// define signals
initial clk_out = 1'b1;
reg[27:0] counter = 28'd0;

always @(posedge clk_in)
begin
    counter <= counter + 28'd1;
    if (counter >= (DIV - 1))
        counter <= 28'd0;
        clk_out <= (counter < DIV/2)?1'b1:1'b0;
    end

endmodule
