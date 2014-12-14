module vga_counters(clk, clkfreq, hpixels, hsyncfreq, vpixels, vsyncfreq, xcount, ycount, hsync, vsync);
	input clk;
	input [31:0] clkfreq;
	
	input [15:0] hpixels, vpixels;
	input [31:0] hsyncfreq;
	input [7:0] vsyncfreq;
	
	output reg [15:0] xcount, ycount;
	output reg hsync, vsync;
	
	initial begin
		xcount = 0;
		ycount = 0;
	end
	
endmodule