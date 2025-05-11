//-------------------------------------------------------------------
//-- button_counter.v
//-- Module
//-------------------------------------------------------------------
//-- Smash Embedded
//-- GPL license
//-------------------------------------------------------------------
//-- Button Counter
//-------------------------------------------------------------------


module button_counter #(
    parameter WIDTH = 8,         // Bit width of the counter
    parameter STEP  = 8'd1       // Step size per pulse
)(
    input wire clk,
    input wire rst,
    input wire b_in,                    
    output reg [WIDTH-1:0] count
);

wire b_out_dummy;
wire b_out_pulse;


button_debouncer u_button_debouncer (
    .clk(clk),
    .rst(rst),
    .b_in(b_in),
    .b_out_level(b_out_dummy),
    .b_out_pulse(b_out_pulse)
);

localparam MAX_VAL = {WIDTH{1'b1}};

initial count = 0;

always @(posedge clk) begin
    if (rst)
        count <= {WIDTH{1'b0}};
    else if (b_out_pulse) begin
        if (count > MAX_VAL - STEP)
            count <= {WIDTH{1'b0}};
        else
            count <= count + STEP;
    end
end

endmodule
