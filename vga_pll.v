/* Verilog netlist generated by SCUBA Diamond (64-bit) 3.3.0.109 */
/* Module Version: 5.6 */
/* D:\Lattice\diamond\3.3_x64\ispfpga\bin\nt64\scuba.exe -w -n vga_pll -lang verilog -synth synplify -arch xo2c00 -type pll -fin 133 -mdiv 6 -ndiv 1 -trimp 0 -phasep 0 -trimp_r -adiv 10 -phase_cntl STATIC -fb_mode 1 -fracn 8895  */
/* Thu Dec 11 01:02:38 2014 */


`timescale 1 ns / 1 ps
module vga_pll (CLKI, CLKOP)/* synthesis syn_noprune=1 *//* synthesis NGD_DRC_MASK=1 */;// exemplar attribute vga_pll dont_touch true 
    input wire CLKI;
    output wire CLKOP;

    wire LOCK;
    wire CLKOP_t;
    wire scuba_vlo;

    VLO scuba_vlo_inst (.Z(scuba_vlo));

    defparam PLLInst_0.DDRST_ENA = "DISABLED" ;
    defparam PLLInst_0.DCRST_ENA = "DISABLED" ;
    defparam PLLInst_0.MRST_ENA = "DISABLED" ;
    defparam PLLInst_0.PLLRST_ENA = "DISABLED" ;
    defparam PLLInst_0.INTFB_WAKE = "DISABLED" ;
    defparam PLLInst_0.STDBY_ENABLE = "DISABLED" ;
    defparam PLLInst_0.DPHASE_SOURCE = "DISABLED" ;
    defparam PLLInst_0.PLL_USE_WB = "DISABLED" ;
    defparam PLLInst_0.CLKOS3_FPHASE = 0 ;
    defparam PLLInst_0.CLKOS3_CPHASE = 0 ;
    defparam PLLInst_0.CLKOS2_FPHASE = 0 ;
    defparam PLLInst_0.CLKOS2_CPHASE = 0 ;
    defparam PLLInst_0.CLKOS_FPHASE = 0 ;
    defparam PLLInst_0.CLKOS_CPHASE = 0 ;
    defparam PLLInst_0.CLKOP_FPHASE = 0 ;
    defparam PLLInst_0.CLKOP_CPHASE = 9 ;
    defparam PLLInst_0.PLL_LOCK_MODE = 0 ;
    defparam PLLInst_0.CLKOS_TRIM_DELAY = 0 ;
    defparam PLLInst_0.CLKOS_TRIM_POL = "FALLING" ;
    defparam PLLInst_0.CLKOP_TRIM_DELAY = 0 ;
    defparam PLLInst_0.CLKOP_TRIM_POL = "RISING" ;
    defparam PLLInst_0.FRACN_DIV = 8895 ;
    defparam PLLInst_0.FRACN_ENABLE = "ENABLED" ;
    defparam PLLInst_0.OUTDIVIDER_MUXD2 = "DIVD" ;
    defparam PLLInst_0.PREDIVIDER_MUXD1 = 0 ;
    defparam PLLInst_0.VCO_BYPASS_D0 = "DISABLED" ;
    defparam PLLInst_0.CLKOS3_ENABLE = "DISABLED" ;
    defparam PLLInst_0.OUTDIVIDER_MUXC2 = "DIVC" ;
    defparam PLLInst_0.PREDIVIDER_MUXC1 = 0 ;
    defparam PLLInst_0.VCO_BYPASS_C0 = "DISABLED" ;
    defparam PLLInst_0.CLKOS2_ENABLE = "DISABLED" ;
    defparam PLLInst_0.OUTDIVIDER_MUXB2 = "DIVB" ;
    defparam PLLInst_0.PREDIVIDER_MUXB1 = 0 ;
    defparam PLLInst_0.VCO_BYPASS_B0 = "DISABLED" ;
    defparam PLLInst_0.CLKOS_ENABLE = "DISABLED" ;
    defparam PLLInst_0.OUTDIVIDER_MUXA2 = "DIVA" ;
    defparam PLLInst_0.PREDIVIDER_MUXA1 = 0 ;
    defparam PLLInst_0.VCO_BYPASS_A0 = "DISABLED" ;
    defparam PLLInst_0.CLKOP_ENABLE = "ENABLED" ;
    defparam PLLInst_0.CLKOS3_DIV = 1 ;
    defparam PLLInst_0.CLKOS2_DIV = 1 ;
    defparam PLLInst_0.CLKOS_DIV = 1 ;
    defparam PLLInst_0.CLKOP_DIV = 10 ;
    defparam PLLInst_0.CLKFB_DIV = 1 ;
    defparam PLLInst_0.CLKI_DIV = 6 ;
    defparam PLLInst_0.FEEDBK_PATH = "CLKOP" ;
    EHXPLLJ PLLInst_0 (.CLKI(CLKI), .CLKFB(CLKOP_t), .PHASESEL1(scuba_vlo), 
        .PHASESEL0(scuba_vlo), .PHASEDIR(scuba_vlo), .PHASESTEP(scuba_vlo), 
        .LOADREG(scuba_vlo), .STDBY(scuba_vlo), .PLLWAKESYNC(scuba_vlo), 
        .RST(scuba_vlo), .RESETM(scuba_vlo), .RESETC(scuba_vlo), .RESETD(scuba_vlo), 
        .ENCLKOP(scuba_vlo), .ENCLKOS(scuba_vlo), .ENCLKOS2(scuba_vlo), 
        .ENCLKOS3(scuba_vlo), .PLLCLK(scuba_vlo), .PLLRST(scuba_vlo), .PLLSTB(scuba_vlo), 
        .PLLWE(scuba_vlo), .PLLADDR4(scuba_vlo), .PLLADDR3(scuba_vlo), .PLLADDR2(scuba_vlo), 
        .PLLADDR1(scuba_vlo), .PLLADDR0(scuba_vlo), .PLLDATI7(scuba_vlo), 
        .PLLDATI6(scuba_vlo), .PLLDATI5(scuba_vlo), .PLLDATI4(scuba_vlo), 
        .PLLDATI3(scuba_vlo), .PLLDATI2(scuba_vlo), .PLLDATI1(scuba_vlo), 
        .PLLDATI0(scuba_vlo), .CLKOP(CLKOP_t), .CLKOS(), .CLKOS2(), .CLKOS3(), 
        .LOCK(LOCK), .INTLOCK(), .REFCLK(), .CLKINTFB(), .DPHSRC(), .PLLACK(), 
        .PLLDATO7(), .PLLDATO6(), .PLLDATO5(), .PLLDATO4(), .PLLDATO3(), 
        .PLLDATO2(), .PLLDATO1(), .PLLDATO0())
             /* synthesis FREQUENCY_PIN_CLKOP="25.175280" */
             /* synthesis FREQUENCY_PIN_CLKI="133.000000" */
             /* synthesis ICP_CURRENT="7" */
             /* synthesis LPF_RESISTOR="68" */;

    assign CLKOP = CLKOP_t;


    // exemplar begin
    // exemplar attribute PLLInst_0 FREQUENCY_PIN_CLKOP 25.175280
    // exemplar attribute PLLInst_0 FREQUENCY_PIN_CLKI 133.000000
    // exemplar attribute PLLInst_0 ICP_CURRENT 7
    // exemplar attribute PLLInst_0 LPF_RESISTOR 68
    // exemplar end

endmodule
