module dds
#(
	parameter SYS_CLK = 100_000_000	,
	parameter N = 32				,
	parameter M =12					,
	parameter DATA_BIT = 12			,
	parameter ADDR_BIT = 12
)
(
	input					sclk,
	input					rst_n,
	input					dds_en,

	input			[1:0]	wav_select,

	input			[25:0]	freq_ctrl,
	input 			[ 8:0]	phase_ctrl,

	output	wire	[DATA_BIT-1:0]	dds_data,
	output	reg				dds_data_en
);

reg			[2*N-1:0]		wr;
wire		[2*N-1:0]		Fword;
wire		[M-1:0]			Pword;
wire		[M-1:0]			rom_addr;

assign	Fword 	= 	(freq_ctrl<<(N))/SYS_CLK;
assign	Pword	=	(phase_ctrl == 'd0)?12'd0:((phase_ctrl<<M)/360);
assign	rom_addr =  wr[31:20] +Pword;


always @(posedge	sclk or negedge	rst_n) begin
	if(!rst_n)
		wr	<=	'd0;
	else if(dds_en == 1'd0)
		wr	<=	'd0;
	else
		wr	<= wr +Fword;
end

always @(posedge	sclk or negedge	rst_n) begin
	if(!rst_n)
		dds_data_en <= 1'd0;
	else
		dds_data_en <=dds_en;
end

// Tomcat
dds_select #(
	.DATA_BIT(DATA_BIT),
	.ADDR_BIT(ADDR_BIT)
)dds_select_initial(
    .sclk		(sclk),
	.rst_n		(rst_n),
    .wav_select	(wav_select),
	.addr		(rom_addr),
	.en			(dds_en),
	.data		(dds_data)
);


endmodule
