module button_debouncer (
    input  wire clk,
    input  wire rst,
    input  wire b_in,
    output wire b_out_level,   // Clean debounced signal
    output wire b_out_pulse    // 1-cycle pulse
);

    // Wires
    wire [5:0] shift;
    wire [5:0] dummy_nQ;
    wire b_out_internal;
    wire dummy_nQ_out;

    // Synchronize b_in
    wire b_in_stage1, b_in_sync;
    wire dummy_nQ_sync;

    dflipflop_rising sync0 (
        .clk(clk), .rst(rst),
        .D(b_in), .Q(b_in_stage1), .nQ(dummy_nQ_sync)
    );

    dflipflop_rising sync1 (
        .clk(clk), .rst(rst),
        .D(b_in_stage1), .Q(b_in_sync), .nQ(dummy_nQ_sync)
    );

    // Shift register for debounce
    dflipflop_rising dff0 (
        .clk(clk), .rst(rst),
        .D(b_in_sync), .Q(shift[0]), .nQ(dummy_nQ[0])
    );

    genvar i;
    generate
        for (i = 1; i < 6; i = i + 1) begin : shift_chain
            dflipflop_rising dff (
                .clk(clk), .rst(rst),
                .D(shift[i-1]), .Q(shift[i]), .nQ(dummy_nQ[i])
            );
        end
    endgenerate

    // Check stability
    wire all_high = &shift;      // == 6'b111111
    wire all_low  = ~|shift;     // == 6'b000000

    wire next_b_out;
    assign next_b_out = all_high ? 1'b1 :
                        all_low  ? 1'b0 :
                                   b_out_internal;

    // Output flip-flop: debounced state
    dflipflop_rising dff_out (
        .clk(clk), .rst(rst),
        .D(next_b_out), .Q(b_out_internal), .nQ(dummy_nQ_out)
    );

    assign b_out_level = b_out_internal;

    // Edge detector for pulse on rising edge
    wire b_out_prev, dummy_nQ_prev;

    dflipflop_rising dff_prev (
        .clk(clk), .rst(rst),
        .D(b_out_internal), .Q(b_out_prev), .nQ(dummy_nQ_prev)
    );

    assign b_out_pulse = b_out_internal & ~b_out_prev;

endmodule
