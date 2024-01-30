module amplitude_set
#(parameter DATA_BIT = 14)
(
    input               sys_clk,
    input               rst_n,

	// input		     [2:0]	amp_select	,
	input            [DATA_BIT-1:0]      dds_data,
    input                                dds_data_en,
    input            [DATA_BIT-1:0]      amp_ctrl,	
    output     wire  [DATA_BIT-1:0]      dds_amp_data,
    output     reg                       dds_amp_data_en
);

reg [2*DATA_BIT-1:0] AMdata;

assign dds_amp_data = AMdata[2*DATA_BIT-1:DATA_BIT];

always @(posedge sys_clk or negedge rst_n) begin
    if(~rst_n)
        AMdata <= 'd0;
    else
        AMdata <= {{14{dds_data[DATA_BIT-1]}},dds_data} * (amp_ctrl<<1);
end

always @(posedge sys_clk or negedge rst_n) begin
    if(~rst_n)
        dds_amp_data_en <= 1'b0;
    else
        dds_amp_data_en <= dds_data_en;
end


// always @(*) begin
//     case(amp_select)
//         3'd0: dds_amp_data = dds_data;
//         3'd1: dds_amp_data = (dds_data>>1);
//         3'd2: dds_amp_data = (dds_data>>2);
//         3'd3: dds_amp_data = (dds_data>>3);
//         3'd4: dds_amp_data = (dds_data>>4);
//         default:dds_amp_data = dds_data;
//     endcase
// end

// always @(*) begin
//     case(amp_select)
//         3'd0: amplitude <= 5'd1;
//         3'd1: amplitude <= 5'd2;
//         3'd2: amplitude <= 5'd4;
//         3'd3: amplitude <= 5'd8;
//         3'd4: amplitude <= 5'd16;
//         default:amplitude <= 5'd1;
//     endcase
// end


endmodule