module bus_width_adapter_160_320(left, right, wide);
	input  [159:0] left, right;
	output [319:0] wide;
	
	assign wide[319:160] = left[159:0];
	assign wide[159:0]   = right[159:0];
endmodule


module bus_width_adapter_320_160(left, right, wide);
	input [319:0] wide;
	output [159:0] left, right;
		
	assign left[159:0]  = wide[319:160];
	assign right[159:0] = wide[159:0];
endmodule