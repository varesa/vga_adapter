module vga_timing(clk, row, col, in_video, hsync, vsync);
	input clk;
 
	output [15:0] row, col;
	output in_video;
	output hsync, vsync;
	
	reg [9:0] CounterX;
	reg [8:0] CounterY;
	
	/* Timing:
	Horizontal:
	 - 640 video
	 - 16 front porch
	 - 96 hsync
	 - 48 back porch
	 
	 Vertical:
	  - 480 video
	  - 10 front porch (+15)
	  - 2 vsync
	  - 33 back porch
	*/
	
	initial begin
		CounterX = 0;
		CounterY = 0;
	end
	
	always @(posedge clk)
	begin
		if(CounterX == 799) begin
			CounterX <= 0;
			if(CounterY == 524) // +15
				CounterY <= 0;
			else
				CounterY <= CounterY + 1;
		end else begin
			CounterX <= CounterX + 1;
		end
		
		
	end
	
	assign col = CounterX;
	assign row = CounterY;

	assign hsync = (656 <= CounterX && CounterX <= 752);
	assign vsync = (490 <= CounterY && CounterY <= 492); // +15 x 2
	
	assign in_video = CounterX < 640 && CounterY < 480;
endmodule