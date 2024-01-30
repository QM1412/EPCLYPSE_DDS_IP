module uart_ctrol 
#(
    parameter   UART_BPS    =   'd9600,         //串口波特率
    parameter   CLK_FREQ    =   'd50_000_000    //时钟频率
)
(
    input   sys_clk_50M,
    input   rst_n,
    input   wire rx,
    output  wire tx,
    output  reg		[1:0]	wav_select ,
	output  reg		[25:0]	freq_ctrl  ,
	output  reg		[ 8:0]	phase_ctrl ,
    output  reg     [13:0]  amp_ctrl    ,
    output                  load_data_test	
);

wire    [7:0]   po_data;
wire            po_flag;
assign            load_data_test = load_data_done;
uart_rx 
#(
    .UART_BPS (UART_BPS),    //串口波特率
    .CLK_FREQ (CLK_FREQ)     //时钟频率
)
uart_rx_initial
(
    .sys_clk    (sys_clk_50M)   ,   //系统时钟50MHz
    .sys_rst_n  (rst_n)     ,   //全局复位
    .rx         (rx)        ,   //串口接收数据

    .po_data    (po_data) ,   //串转并后的8bit数据
    .po_flag    (po_flag)     //串转并后的数据有效标志信号
);

uart_tx
#(
    .UART_BPS  (UART_BPS),         //串口波特率
    .CLK_FREQ  (CLK_FREQ)    //时钟频率
)
uart_tx_initial
(
     . sys_clk   (sys_clk_50M)  ,   //系统时钟50MHz
     . sys_rst_n  (rst_n) ,   //全局复位
     .pi_data    (po_data) ,   //模块输入的8bit数据
     .pi_flag    (po_flag) ,   //并行数据有效标志信号
 
     .tx(tx)              //串转并后的1bit数据
);

localparam IDLE  = 2'b00;
localparam COUNT = 2'b01;
localparam LOAD_REG = 2'b10;

reg [1:0]status;

reg [3:0] count;

reg [7:0] po_data_tmp [8:0];
reg       load_data_done;
reg       counter_flag;
always @(posedge sys_clk_50M or negedge rst_n)begin
    if(~rst_n)
        status <= IDLE;
    else   
        case(status)
            IDLE : status <= (po_data == 8'h41)?COUNT:IDLE;
            COUNT:begin
                status <= (counter_flag == 1'b1)?LOAD_REG:COUNT; 
            end 
            LOAD_REG: begin
                status <= (load_data_done == 1'b1)?IDLE:LOAD_REG;
            end
        endcase
end

always @(posedge sys_clk_50M or negedge rst_n)begin
    if(~rst_n)begin
        count <= 'd0;
        load_data_done <= 1'b0;
        wav_select <= 2'b0;
        freq_ctrl <= 'd1_000;
        phase_ctrl <= 'd90;
        amp_ctrl <= 'd8192;
    end
    else  begin
        counter_flag <= 1'b0;
        load_data_done <= 1'b0;
        case (status)
            COUNT: begin
                if(po_flag == 1'b1)begin
                    po_data_tmp[count] <= po_data;
                    count <= count +1'b1;
                    if(count == 'd8)
                        counter_flag <= 1'b1;
                end
            end
            LOAD_REG: begin
                count <= 'd0;
                wav_select <= po_data_tmp[0][1:0];
//                freq_ctrl  <= {po_data_tmp[1],po_data_tmp[2],po_data_tmp[3],po_data_tmp[4]};
                freq_ctrl  <= {po_data_tmp[4],po_data_tmp[3],po_data_tmp[2],po_data_tmp[1]};
                phase_ctrl <= {po_data_tmp[6],po_data_tmp[5]};
                amp_ctrl   <= {po_data_tmp[8],po_data_tmp[7]};
                load_data_done <= 1'b1;
            end
        endcase
    end
end

endmodule