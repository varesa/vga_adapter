module capture_ram_interface(clk, row_index, row_data, row_ready, ram_address, ram_data, write_enable);

	input clk;
	
	input [7:0] row_index;
	input [319:0] row_data;
	input row_ready;
	
	output reg [7:0] ram_address;
	output reg [319:0] ram_data;
	output reg write_enable;
	
	reg state; // 0 = write first half, 1 = write second half, 2 = wait for new data
	
	initial begin
		state = 0;
	end
	
	wire dbg;
	assign dbg = (row_data > 0);
	
	wire dbg2;
	assign dbg2 = (ram_data > 0);
	
	always @(posedge clk) begin
		if(row_ready == 1) begin
			if(state == 0) begin
				state <= 1;
				
				ram_address <= row_index;
				ram_data <= row_data;
				write_enable <= 1;
			end
			/*if(state == 0) begin
				state <= 1;
				
				ram_address <= row_index * 2;
				ram_data <= row_data[319:160];
				write_enable <= 1;
			end
			if(state == 1) begin
				state <= 2;
				
				ram_address <= (row_index * 2) + 1;
				ram_data <= row_data[159:0];
				write_enable <= 1;
			end*/
		end else begin
			state <= 0;
			
			ram_address <= 0;
			ram_data <= 0;
			
			write_enable <= 0;
		end
	end

endmodule