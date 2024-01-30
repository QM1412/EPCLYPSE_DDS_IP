`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/17 15:21:48
// Design Name: 
// Module Name: dds_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module dds_top
#(
	parameter SYS_CLK = 100_000_000	,
	parameter N = 32				,
	parameter M =12					,
	parameter DATA_BIT = 14			,
	parameter ADDR_BIT = 12
)
(
	input					sclk                    ,
	input					rst_n                   ,
	input					dds_en                  ,

	input			[1:0]	wav_select              ,
	input			[25:0]	freq_ctrl               ,
	input 			[ 8:0]	phase_ctrl              ,
    input           [DATA_BIT-1:0]      amp_ctrl    ,	
	output	wire	[DATA_BIT-1:0]	dds_data_unsigned ,
	output	wire				    dds_data_en     ,
	output  wire    [DATA_BIT-1:0]  dds_data_signed,
	output  wire                    dds_signed_en,
    output  wire    [DATA_BIT-1:0]  dds_amp_data    ,
    output  wire                    dds_amp_data_en
);

dds	#(
	.SYS_CLK 	(100_000_000) ,
	.N 			(32			) ,
	.M 			(12			) ,
	.DATA_BIT 	(DATA_BIT	) ,
	.ADDR_BIT 	(ADDR_BIT	)
)
dds_initial
(
	.sclk			(sclk),
	.rst_n			(rst_n),
	.dds_en			(dds_en),
	.wav_select			(wav_select),
	.freq_ctrl		(freq_ctrl),
	.phase_ctrl		(phase_ctrl),
	.dds_data		(dds_data_unsigned),
	.dds_data_en	(dds_data_en)
);

unsigned_to_signed unsigned_to_signed_initial(
    .dds_data_unsiged(dds_data_unsigned),
    .dds_unsiged_en(dds_data_en),
    
    .dds_data_signed(dds_data_signed),
    .dds_signed_en(dds_signed_en)
    );

amplitude_set #(.DATA_BIT (DATA_BIT))
amplitude_set_initial(
    .sys_clk        (sclk),
    .rst_n          (rst_n),
	.dds_data       (dds_data_signed),
	.dds_data_en    (dds_signed_en),
//	.amp_select     (amp_select)	,
    .amp_ctrl        (amp_ctrl)   ,
	.dds_amp_data   (dds_amp_data),
	.dds_amp_data_en(dds_amp_data_en)
);

endmodule
