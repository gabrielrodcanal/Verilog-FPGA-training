module clock_div(
	input in_clk,
	output out_clk);
	
	parameter DIVIDER = 50000000; // frequency of my FPGA oscillator. This is hardcoded for personal use
	
	reg [30:0] counter;
	reg [30:0] thresh_freq; // maximum number of ticks until first positive flank of out_clk

	
	always @(posedge in_clk) begin
		counter <= counter + 30'd1;
		if (counter == DIVIDER)
			counter <= 30'd0;
	end
	
	assign out_clk = (counter == DIVIDER);
	
endmodule