#when using PLL
#create_clock -name clk_50 -period 20 -waveform {0 10} [get_ports {clk_50}]
#derive_pll_clocks

#without PLL
create_clock -name clk -period 2 -waveform {0 1} [get_ports {clk}]