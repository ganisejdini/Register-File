module regfile
    #(parameter DATAWIDTH = 32)
    (
        output reg [DATAWIDTH-1:0] readData1,
        output reg [DATAWIDTH-1:0] readData2,
        output reg [DATAWIDTH-1:0] readData3,
        output reg [DATAWIDTH-1:0] readData4,
        input wire clk,
        input wire resetn, 
        input wire [3:0] readReg1,
        input wire [3:0] readReg2,
        input wire [3:0] readReg3,
        input wire [3:0] readReg4,
        input wire [3:0] writeReg1,
        input wire [3:0] writeReg2,
        input wire [DATAWIDTH-1:0] writeData1,
        input wire [DATAWIDTH-1:0] writeData2,
        input wire write 
    );

    reg [DATAWIDTH-1:0] registers [15:0];
    integer i;

    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            for (i = 0; i < 16; i = i + 1) 
                registers[i] <= {DATAWIDTH{1'b0}};
        end else begin
            if (write) begin
                registers[writeReg1] <= writeData1;
                registers[writeReg2] <= writeData2;
            end
        end
    end

    always @(*) begin
        readData1 = registers[readReg1];
        readData2 = registers[readReg2];
        readData3 = registers[readReg3];
        readData4 = registers[readReg4];
    end

endmodule
