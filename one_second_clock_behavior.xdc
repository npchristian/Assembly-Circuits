set_property PACKAGE_PIN U9 [get_ports enable]
set_property IOSTANDARD LVCMOS33 [get_ports enable]

set_property PACKAGE_PIN F15 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports rst]

set_property PACKAGE_PIN T8 [get_ports q]
set_property IOSTANDARD LVCMOS33 [get_ports q]
set_property PACKAGE_PIN P2 [get_ports locked]
set_property IOSTANDARD LVCMOS33 [get_ports locked]

set_property PACKAGE_PIN E3 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

create_clock -period 10.000 -name Clk -waveform {0.000 5.000} [get_ports {clk}]
