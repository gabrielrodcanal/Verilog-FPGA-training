/*
 * Author: Gabriel Rodriguez-Canal
 * Displays digits from 0-9 in the 7 segment display (4 replicas)
 */

module display(
	output [3:0] DIG,
	output [7:0] SEG,
	input CLK);
	
	reg [30:0] counter;
	wire custom_clk;
	reg [7:0] ascii;
	
	initial
		ascii <= 8'd48;
	
	clock_div clk_div (
		.in_clk( CLK ),
		.out_clk( custom_clk )
	);
	
	always @(posedge custom_clk) begin
		if (ascii < 8'd58)
			ascii = ascii + 8'd1;
		else
			ascii = 8'd48;
	end
	
	segments segm (
		.dig( DIG ),
		.seg( SEG ),
		.ascii( ascii ),
		.clk( custom_clk )
	);
endmodule
