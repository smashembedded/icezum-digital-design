//-------------------------------------------------------------------
//-- lcd.v
//-- Module
//-------------------------------------------------------------------
//-- Smash Embedded
//-- GPL license
//-------------------------------------------------------------------
//-- Liquid Crystal Display (LCD)
//-------------------------------------------------------------------

`include "..\..\clock\freq_divider\freq_divider.v"

module lcd (clk, msg_0, msg_1, rs, en, rw, data);

input clk;
input wire [127:0] msg_0;
input wire [127:0] msg_1;
output reg rs;
output reg rw;
output reg en;
output reg [7:0] data;

reg [15:0] counter;
reg [5:0] next;
wire clk_1kHz;
reg row;
integer i;

initial begin
    data = 0;
    rs = 0;
    rw = 0;
    en = 0;
    counter = 0;
    next = 0;
    row = 0;
    i = 0;
end

// Clock divider instantiation;
freq_divider #(28'd12000) u_freq_divider (
    .clk_in(clk),
    .clk_out(clk_1kHz)
);


always @(posedge clk_1kHz) begin
    
    counter <= counter + 1;  // Increment the counter when Enable is low

    if (counter == 9) begin
        en <= 0;
    end else if (counter == 10) begin
        counter <= 0;
        case(next)
            0:  begin rs <= 0; data <= 8'h38; next <= 1; end // 8-bit mode
            1:  begin rs <= 0; data <= 8'h0C; next <= 2; end // Display ON, no cursor
            2:  begin rs <= 0; data <= 8'h01; next <= 3; end // Clear Display
            3:  begin rs <= 0; data <= 8'h06; next <= 4; end // Entry Mode Set (No Scroll)
            4:  begin rs <= 0; data <= 8'h80; next <= 5; row=0; end // Move Cursor to First Row

            5: 
                if (i < 16) begin
                    if (msg_0[127 - (i * 8) -: 8] != 8'h00) begin
                        rs <= 1;
                        data <= msg_0[127 - (i * 8) -: 8]; // Extract valid bytes
                    end else begin
                        rs <= 0;
                    end
                    i <= i + 1;
                end
            6:  begin rs <= 0; data <= 8'hC0; next <= 7; row = 1; end // Move Cursor to Second Row

            7:  
                if (i < 16) begin
                    if (msg_1[127 - (i * 8) -: 8] != 8'h00) begin
                        rs <= 1;
                        data <= msg_1[127 - (i * 8) -: 8]; // Extract valid bytes
                    end else begin
                        rs <= 0;
                    end
                    i <= i + 1;
                end
        endcase
    end else begin
        en <= 1;
        if (i == 16) begin
            if (row) begin
                i <= 0;
                next <= 4;
            end else begin
                i <= 0;
                next <= 6;
            end
        end
    end
end

endmodule

// Higher-level module for displaying "Distance: 10"
module top_level (clk, rs, en, rw, data);

input clk;
output rs;
output en;
output rw;
output [7:0] data;

reg [127:0] msg_0 = "1st Row Message";
reg [127:0] msg_1 = "2nd Row Message";
lcd u_lcd (
    .clk(clk),
    .msg_0(msg_0),
    .msg_1(msg_1),
    .rs(rs),
    .en(en),
    .rw(rw),
    .data(data)
);

endmodule