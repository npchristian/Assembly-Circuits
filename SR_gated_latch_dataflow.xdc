set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets <myHier/myNet>]
set_property SEVERITY {Warning} [get_drc_checks LUTLP-1]
set_property PACKAGE_PIN U9 [get_ports s]
set_property IOSTANDARD LVCMOS33 [get_ports s]
set_property PACKAGE_PIN U8 [get_ports r]
set_property IOSTANDARD LVCMOS33 [get_ports r]
set_property PACKAGE_PIN R7 [get_ports enable]
set_property IOSTANDARD LVCMOS33 [get_ports enable]

set_property PACKAGE_PIN T8 [get_ports q_bar]
set_property IOSTANDARD LVCMOS33 [get_ports q_bar]
set_property PACKAGE_PIN V9 [get_ports q]
set_property IOSTANDARD LVCMOS33 [get_ports q]

