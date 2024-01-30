`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/18 17:22:09
// Design Name: 
// Module Name: unsigned_to_signed
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


module unsigned_to_signed(
    input [13:0]    dds_data_unsiged,
    input           dds_unsiged_en,
    
    output  [13:0]    dds_data_signed,
    output           dds_signed_en
    );
    
    assign dds_data_signed = 14'b01_1111_1111_1111 - dds_data_unsiged;
    assign dds_signed_en = dds_unsiged_en;
    
endmodule
