module segments(
	output reg [3:0] dig,
	output reg [7:0] seg,
	input [7:0] ascii,
	input clk);
	
	initial begin
		dig = 4'b0000;
		seg = 8'b11111111;
	end
	
	always @(*) begin
		case (ascii)
			8'd48:    seg <= 8'b11000000;	// 0
			8'd49:    seg <= 8'b11111001;	// 1
			8'd50:    seg <= 8'b10100100;	// 2
			8'd51:    seg <= 8'b10110000;	// 3
			8'd52:    seg <= 8'b10011001;	// 4
			8'd53:    seg <= 8'b10010010;	// 5
			8'd54:    seg <= 8'b10000010;	// 6
			8'd55:    seg <= 8'b11111000;	// 7
			8'd56:    seg <= 8'b10000000;	// 8
			8'd57:    seg <= 8'b10010000;	// 9
			default: seg <= 8'b11111111;
		endcase
	end
	
endmodule