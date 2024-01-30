module dds_select
#(
	parameter	DATA_BIT = 12,
	parameter	ADDR_BIT = 12
)
(
  input 			sclk,
	input				rst_n,

  input       [1:0]           wav_select,

	input		    [ADDR_BIT-1:0]	addr,
	input				en,
	output	reg [DATA_BIT-1:0]	data
);
localparam SIN = 2'b00;
localparam TIR = 2'b01;
localparam SAW = 2'b10;
localparam SQU = 2'b11;

reg[ADDR_BIT-1:0]	addr_sin;
reg		            en_sin;
wire[DATA_BIT-1:0]	data_sin;

reg[ADDR_BIT-1:0]	addr_tir;
reg		            en_tir;
wire[DATA_BIT-1:0]	data_tir;

reg[ADDR_BIT-1:0]	addr_saw;
reg		            en_saw;
wire[DATA_BIT-1:0]	data_saw;

reg[ADDR_BIT-1:0]	addr_squ;
reg		            en_squ;
wire[DATA_BIT-1:0]	data_squ;

always @(*) begin
    case (wav_select)
        SIN: begin
            addr_sin = addr;
            en_sin   = en;
            data     = data_sin;
        end
        TIR: begin
            addr_tir = addr;
            en_tir   = en;
            data     = data_tir;
        end
        SAW: begin
            addr_saw = addr;
            en_saw   = en;
            data     = data_saw;
        end
        SQU: begin
            addr_squ = addr;
            en_squ   = en;
            data     = data_squ;
        end
        default: ;
    endcase

end

blk_mem_gen_0 sin_rom (
  .clka(sclk),    // input wire clka
  .ena(en_sin),      // input wire ena
  .addra(addr_sin),  // input wire [11 : 0] addra
  .douta(data_sin)  // output wire [13 : 0] douta
);

blk_mem_gen_1 squ_mem (
  .clka(sclk),    // input wire clka
  .ena(en_squ),      // input wire ena
  .addra(addr_squ),  // input wire [11 : 0] addra
  .douta(data_squ)  // output wire [13 : 0] douta
);

blk_mem_gen_2 tir_mem (
  .clka(sclk),    // input wire clka
  .ena(en_tir),      // input wire ena
  .addra(addr_tir),  // input wire [11 : 0] addra
  .douta(data_tir)  // output wire [13 : 0] douta
);

blk_mem_gen_3 saw_mem (
  .clka(sclk),    // input wire clka
  .ena(en_saw),      // input wire ena
  .addra(addr_saw),  // input wire [11 : 0] addra
  .douta(data_saw)  // output wire [13 : 0] douta
);
// mem_4096x12_sin #(
// 	.DATA_BIT(DATA_BIT),
// 	.ADDR_BIT(ADDR_BIT)
// )
// mem_4096x12_sin_initial(
// 	.sclk     (sclk)  ,
// 	.rst_n    (rst_n)  ,
// 	.addr     (addr_sin)  ,
// 	.en       (  en_sin)  ,
// 	.data     (data_sin)
// );

// mem_4096x12_tir #(
// 	.DATA_BIT(DATA_BIT),
// 	.ADDR_BIT(ADDR_BIT)
// )
// mem_4096x12_tir_initial(
// 	.sclk     (sclk)  ,
// 	.rst_n    (rst_n)  ,
// 	.addr     (addr_tir)  ,
// 	.en       (  en_tir)  ,
// 	.data     (data_tir)
// );

// mem_4096x12_saw #(
// 	.DATA_BIT(DATA_BIT),
// 	.ADDR_BIT(ADDR_BIT)
// )
// mem_4096x12_saw_initial(
// 	.sclk     (sclk)  ,
// 	.rst_n    (rst_n)  ,
// 	.addr     (addr_saw)  ,
// 	.en       (  en_saw)  ,
// 	.data     (data_saw)
// );

//mem_4096x12_squ #(
//	.DATA_BIT(DATA_BIT),
//	.ADDR_BIT(ADDR_BIT)
//)
//mem_4096x12_squ_initial(
//	.sclk     (sclk)  ,
//	.rst_n    (rst_n)  ,
//	.addr     (addr_squ)  ,
//	.en       (  en_squ)  ,
//	.data     (data_squ)
//);

endmodule