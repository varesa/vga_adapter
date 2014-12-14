module ram_vga_interface(vga_clk, vga_row, vga_col, ram_address, ram_data, vga_data);
	input vga_clk;
	input [15:0] vga_row, vga_col;
	
	output reg [7:0] ram_address;
	input [319:0] ram_data;
	
	output reg vga_data;
	
	wire next_col_first_half;
	assign next_col_first_half = vga_col+1 < 320;
	
	wire next_col_second_half;
	assign next_col_second_half = 319 < vga_col+1 && vga_col+1 < 639;
	
	wire next_col_next_row;
	assign next_col_next_row = vga_col+1 >= 639;
	
	always @(posedge vga_clk) begin 
		// Load a pixel from RAM
		//if(vga_col < 320) begin 
			vga_data = ram_data[vga_col / 2];
		//end else begin
		//	vga_data = ram_data[(vga_col - 320) / 2];
		//end
		
		// Load the address for the next pixel
		/*if(next_col_first_half) begin  		// Cols 0 - 319
			ram_address = 2 * vga_row / 2;
		end
		if(next_col_second_half) begin // Cols 320 - 638
			ram_address = (2 * vga_row / 2) + 1;
		end else begin
			ram_address = 0;
		end */ /*
		if(next_col_next_row) begin		// Cols 639 (eov) -> 
			if(vga_row < 479) begin
				ram_address = 2 * ((vga_row / 2 ) + 1);
			end else begin 
				ram_address = 0;
			end
		end*/
		
		if(next_col_next_row) begin
			ram_address = vga_row/2 + 1;
		end else begin
			ram_address = vga_row/2;
		end
		
		
	end
	
endmodule