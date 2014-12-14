module clk_div(in, out);

	input in;
	output out;
	
	reg [7:0] counter;
	
	initial begin
		counter = 0;
	end
	
	always @(posedge in) begin
		counter <= counter + 1;
	end
	
	assign out = counter[5];

endmodule