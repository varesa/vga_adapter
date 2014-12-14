module capture_interface(in_vsync, in_hsync, in_video, pixel_clk, pixel_clk_disable, row_index, row_data, row_ready, dbg);
	input in_vsync, in_hsync, in_video;

	input pixel_clk;
	output pixel_clk_disable;

	output reg [7:0] row_index;
	output reg [319:0] row_data;
	output row_ready;

	output reg dbg;

	reg [7:0] pre_sync_pulses;

	reg [8:0] col_index;

	reg flag;
	reg flag2;

	initial begin
		row_index = 0;
		row_data = 0;
		
		pre_sync_pulses = 12;
		col_index = 0;
		
		flag = 1;
		flag2 = 0;
	end

	assign pixel_clk_disable = in_hsync && (pre_sync_pulses == 0);
	assign row_ready = in_hsync;

	
	
	always @(negedge in_hsync) begin
		if(in_vsync == 0) begin
			row_index <= 0;		
			pre_sync_pulses <= 12;
		end
		
		if(pre_sync_pulses > 0) begin
			pre_sync_pulses <= pre_sync_pulses - 1;
		end else begin
			row_index <= row_index + 1;
			flag <= ~flag;
		end
	end

	reg [5:0] counter;

	initial begin
		counter = 0;
	end

	always @(posedge pixel_clk) begin
		if(flag2 != flag) begin
			flag2 = flag;
			
			col_index = 0;
			row_data = 320'd0;
		end
		
		//if(counter == 0) begin
			if(col_index < 321) begin
				row_data[col_index] = in_video;
				col_index = col_index + 1;
				//dbg = ~dbg;
			end
			
		//	counter = 5;
		//end else begin
		//	counter = counter - 1;
		//end
	end

endmodule