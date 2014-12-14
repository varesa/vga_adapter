module test_ram_writer(clk, ram_address, ram_data, ram_clk);

input wire clk;
output reg [7:0] ram_address;
output reg [319:0] ram_data;
output wire ram_clk;

assign ram_clk = clk;

always @(posedge clk) begin
	ram_data <= 320'b10101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010;
	//ram_data <= (ram_address * 32);
	if(ram_address == 239) begin
		ram_address <= 0;
	end else begin
		ram_address <= ram_address  + 1;
	end
end

endmodule