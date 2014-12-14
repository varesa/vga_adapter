module video_converter(video_in, hsync_in, vsync_in, video_out, hsync_out, vsync_out, LED, vga_hsync, vga_vsync, vga_R, vga_G, vga_B, test1);
	input video_in, hsync_in, vsync_in;
	output video_out, hsync_out, vsync_out;
	
	assign video_out = video_in;
	assign hsync_out = hsync_in;
	assign vsync_out = vsync_in;
	
	output reg [7:0] LED;
	
	output vga_hsync, vga_vsync;
	output reg [3:0] vga_R, vga_G, vga_B;

	output test1;

	/* CLOCK AND PLL */

	wire 			osc_clk;

	defparam OSCH_inst.NOM_FREQ = "133.00";
	OSCH OSCH_inst
		( 
		.STDBY(1'b0), 		// 0=Enabled, 1=Disabled also Disabled with Bandgap=OFF
		.OSC(osc_clk),
		.SEDSTDBY()     	// this signal is not required if not using SED
		);

	wire vga_clk;

	vga_pll vga_pll1(.CLKI(osc_clk), .CLKOP(vga_clk));
	
	wire cap_clk;
	wire cap_clk_rst;
	
	capture_pll capture_pll1(.CLKI(osc_clk), .CLKOS2(cap_clk), .RESETC(cap_clk_reset));

	/* CLOCK AND PLL END */

	/* FRAMEBUFFER RAM */
	
	wire [7:0] ram_write_address;
	wire [7:0] ram_read_address;
	wire [319:0] ram_write_data;
	wire [319:0] ram_read_data;
	
	wire [159:0] ram_read_left, ram_read_right;
	wire [159:0] ram_write_left, ram_write_right;
	
	bus_width_adapter_320_160 write_adapter(.left(ram_write_left), .right(ram_write_right), .wide(ram_write_data));
	bus_width_adapter_160_320 read_adapter(.left(ram_read_left), .right(ram_read_right), .wide(ram_read_data));
	
	wire ram_write_enable;
	
	framebuffer fb1(.WrAddress(ram_write_address), .RdAddress(ram_read_address), .Data(ram_write_left), .WE(1'd1), .RdClock(vga_clk), .RdClockEn(1'd1), .Reset(1'd0), .WrClock(osc_clk), .WrClockEn(ram_write_enable), .Q(ram_read_left));
	framebuffer fb2(.WrAddress(ram_write_address), .RdAddress(ram_read_address), .Data(ram_write_right), .WE(1'd1), .RdClock(vga_clk), .RdClockEn(1'd1), .Reset(1'd0), .WrClock(osc_clk), .WrClockEn(ram_write_enable), .Q(ram_read_right));
	
	/* FRAMEBUFFER RAM END */

	/* FB WRITER */
	
	//test_ram_writer writer1(.clk(osc_clk), .ram_address(ram_write_address), .ram_data(ram_write_data));
	//assign ram_write_enable = 1;

	/* */

	/* VGA Module */

	wire [15:0] vga_row, vga_col;
	wire vga_in_video_area;
	wire vga_hs, vga_vs;
	
	vga_timing timing1(.clk(vga_clk), .row(vga_row), .col(vga_col), .in_video(vga_in_video_area), .hsync(vga_hs), .vsync(vga_vs));
	
	assign vga_vsync = ~vga_vs;
	assign vga_hsync = ~vga_hs;
	
	wire vga_video;
	wire video;
	wire border;
	
	assign border = (vga_row < 3) || (vga_col < 3) || (vga_row > 480-3) || (vga_col > 640-3);
	
	assign video = vga_in_video_area && (border || vga_video);
	
	always @(posedge osc_clk) begin
		vga_R[0] <= video;
		vga_R[1] <= video;
		vga_R[2] <= video;
		vga_R[3] <= video;
		
		vga_G[0] <= video;
		vga_G[1] <= video;
		vga_G[2] <= video;
		vga_G[3] <= video;
		
		vga_B[0] <= video;
		vga_B[1] <= video;
		vga_B[2] <= video;
		vga_B[3] <= video;
	end
	
	/* VGA MODULE END */
	
	/* RAM-VGA INTERFACE */
	
	ram_vga_interface ramvgaif(.vga_clk(vga_clk), .vga_row(vga_row), .vga_col(vga_col), .ram_address(ram_read_address), .ram_data(ram_read_data), .vga_data(vga_video));
	
	/* RAM-VGA INTERFACE */
	
	/* VIDEO CAPTURE */
	
	wire [7:0] capture_row_index;
	wire [319:0] capture_row_data;
	wire capture_row_ready;
	capture_interface c_if1(.in_vsync(vsync_in), .in_hsync(hsync_in), .in_video(video_in), .pixel_clk(cap_clk), .pixel_clk_disable(cap_clk_rst), .row_index(capture_row_index), .row_data(capture_row_data), .row_ready(capture_row_ready), .dbg());
	assign test1 = cap_clk;
	//capture_interface c_if1(.in_vsync(vga_vsync), .in_hsync(vga_hsync), .in_video(vga_video), .pixel_clk(cap_clk), .pixel_clk_disable(cap_clk_rst), .row_index(capture_row_index), .row_data(capture_row_data), .row_ready(capture_row_ready));
    
	/* VIDEO CAPTURE END*/
	
	/* CAPTURE-RAM INTERFACE */
	
	capture_ram_interface c_ram_if(.clk(osc_clk), .row_index(capture_row_index), .row_data(capture_row_data), .row_ready(capture_row_ready), .ram_address(ram_write_address), .ram_data(ram_write_data), .write_enable(ram_write_enable));
	
	
	/* CAPTURE-RAM INTERFACE END*/
	
	wire dbg_clk;
	clk_div div1(.in(osc_clk), .out(dbg_clk));
	
	/*GSR GSR_INST (.GSR ());
	PUR PUR_INST (.PUR ());*/
endmodule