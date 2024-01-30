set_property PACKAGE_PIN Y19 [get_ports {ZmodDAC_0_DAC_DATA_0[0]}]
set_property PACKAGE_PIN Y18 [get_ports {ZmodDAC_0_DAC_DATA_0[1]}]
set_property PACKAGE_PIN AB22 [get_ports {ZmodDAC_0_DAC_DATA_0[2]}]
set_property PACKAGE_PIN AB20 [get_ports {ZmodDAC_0_DAC_DATA_0[3]}]
set_property PACKAGE_PIN AA18 [get_ports {ZmodDAC_0_DAC_DATA_0[4]}]
set_property PACKAGE_PIN AA19 [get_ports {ZmodDAC_0_DAC_DATA_0[5]}]
set_property PACKAGE_PIN Y21 [get_ports {ZmodDAC_0_DAC_DATA_0[6]}]
set_property PACKAGE_PIN Y20 [get_ports {ZmodDAC_0_DAC_DATA_0[7]}]
set_property PACKAGE_PIN V15 [get_ports {ZmodDAC_0_DAC_DATA_0[8]}]
set_property PACKAGE_PIN V14 [get_ports {ZmodDAC_0_DAC_DATA_0[9]}]
set_property PACKAGE_PIN AB15 [get_ports {ZmodDAC_0_DAC_DATA_0[10]}]
set_property PACKAGE_PIN AB14 [get_ports {ZmodDAC_0_DAC_DATA_0[11]}]
set_property PACKAGE_PIN W13 [get_ports {ZmodDAC_0_DAC_DATA_0[12]}]
set_property PACKAGE_PIN V13 [get_ports {ZmodDAC_0_DAC_DATA_0[13]}]

set_property IOSTANDARD LVCMOS18 [get_ports -filter { name =~ ZmodDAC_0_DAC_DATA*}]

set_property PACKAGE_PIN W16 [get_ports ZmodDAC_0_DAC_CLKIN_0]
set_property IOSTANDARD LVCMOS18 [get_ports ZmodDAC_0_DAC_CLKIN_0]
set_property PACKAGE_PIN W17 [get_ports ZmodDAC_0_DAC_CLKIO_0]
set_property IOSTANDARD LVCMOS18 [get_ports ZmodDAC_0_DAC_CLKIO_0]

#DAC SPI
set_property PACKAGE_PIN Y14 [get_ports ZmodDAC_0_DAC_SDIO_0]
set_property IOSTANDARD LVCMOS18 [get_ports ZmodDAC_0_DAC_SDIO_0]
set_property DRIVE 4 [get_ports ZmodDAC_0_DAC_SDIO_0]
set_property PACKAGE_PIN AA14 [get_ports ZmodDAC_0_DAC_CS_0]
set_property IOSTANDARD LVCMOS18 [get_ports ZmodDAC_0_DAC_CS_0]
set_property DRIVE 4 [get_ports ZmodDAC_0_DAC_CS_0]
set_property PACKAGE_PIN AA13 [get_ports ZmodDAC_0_DAC_SCLK_0]
set_property IOSTANDARD LVCMOS18 [get_ports ZmodDAC_0_DAC_SCLK_0]
set_property DRIVE 4 [get_ports ZmodDAC_0_DAC_SCLK_0]

set_property PACKAGE_PIN W15 [get_ports ZmodDAC_0_DAC_SET_FS1_0]
set_property IOSTANDARD LVCMOS18 [get_ports ZmodDAC_0_DAC_SET_FS1_0]
set_property PACKAGE_PIN Y15 [get_ports ZmodDAC_0_DAC_SET_FS2_0]
set_property IOSTANDARD LVCMOS18 [get_ports ZmodDAC_0_DAC_SET_FS2_0]
set_property PACKAGE_PIN Y13 [get_ports ZmodDAC_0_DAC_RESET_0]
set_property IOSTANDARD LVCMOS18 [get_ports ZmodDAC_0_DAC_RESET_0]
set_property PACKAGE_PIN AA22 [get_ports ZmodDAC_0_DAC_EN_0]
set_property IOSTANDARD LVCMOS18 [get_ports ZmodDAC_0_DAC_EN_0]


create_generated_clock -name ZmodDAC_0_DAC_CLKIN_0 -source [get_pins design_1_i/ZmodDAC_0/ZmodDAC1411_Controll_0/U0/InstDAC_ClkinODDR/C] -divide_by 1 [get_ports ZmodDAC_0_DAC_CLKIN_0]
create_generated_clock -name ZmodDAC_0_DAC_CLKIO_0 -source [get_pins design_1_i/ZmodDAC_0/ZmodDAC1411_Controll_0/U0/InstDAC_ClkIO_ODDR/C] -divide_by 1 [get_ports ZmodDAC_0_DAC_CLKIO_0]
set_output_delay -clock [get_clocks ZmodDAC_0_DAC_CLKIN_0] -clock_fall -min -add_delay -1.200 [get_ports {ZmodDAC_0_DAC_DATA_0[*]}]
set_output_delay -clock [get_clocks ZmodDAC_0_DAC_CLKIN_0] -clock_fall -max -add_delay 0.250 [get_ports {ZmodDAC_0_DAC_DATA_0[*]}]
set_output_delay -clock [get_clocks ZmodDAC_0_DAC_CLKIN_0] -min -add_delay -1.100 [get_ports {ZmodDAC_0_DAC_DATA_0[*]}]
set_output_delay -clock [get_clocks ZmodDAC_0_DAC_CLKIN_0] -max -add_delay 0.130 [get_ports {ZmodDAC_0_DAC_DATA_0[*]}]


# reset
set_property -dict { PACKAGE_PIN C17   IOSTANDARD LVCMOS33 } [get_ports { reset_rtl_0_0 }]; #IO_L11P_T1_SRCC Sch=btn[0]

# sys_clk
set_property -dict { PACKAGE_PIN D18   IOSTANDARD LVCMOS33 } [get_ports { sys_clk }]; 
create_clock -add -name sys_clk_pin -period 8.00 -waveform {0 4} [get_ports { sys_clk }];