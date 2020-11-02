`timescale 1ns / 1ps

module EX_WB(
    input clk,
    input Reset,
    
    input [1:0] opcodeIn,
    output reg [1:0] opcodeOut,
    
    input [7:0] WriteDataIn,
    output reg [7:0] WriteDataOut,
    
    input WriteSignalIn,
    output reg WriteSignalOut,
    
    input [2:0] WriteRegisterIn,
    output reg [2:0] WriteRegisterOut
);

always@(posedge clk)
begin
    WriteDataOut = WriteDataIn;
    WriteSignalOut = WriteSignalIn;
    WriteRegisterOut = WriteRegisterIn;
    opcodeOut = opcodeIn;
end

always@(negedge Reset)
begin
    WriteDataOut = 0;
    WriteSignalOut = 0;
    WriteRegisterOut = 0;
    opcodeOut = 0;
end

endmodule