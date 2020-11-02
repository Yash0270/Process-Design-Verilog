`timescale 1ns / 1ps

module ID_EX(
    input clk,
    input Reset,
    
    input [1:0] opcodeIn,
    output reg [1:0] opcodeOut,
    
    input [7:0] ReadDataIn,
    output reg [7:0] ReadDataOut,
    
    input [7:0] ImmediateDataIn,
    output reg [7:0] ImmediateDataOut,
    
    input [2:0] ReadRegisterIn,
    output reg [2:0] ReadRegisterOut,
    
    input [2:0] WriteRegisterIn,
    output reg [2:0] WriteRegisterOut,
    
    input WriteSignalIn,
    output reg WriteSignalOut
);

always@(posedge clk)
begin
    ReadDataOut = ReadDataIn;
    ImmediateDataOut = ImmediateDataIn;
    ReadRegisterOut = ReadRegisterIn;
    WriteRegisterOut =  WriteRegisterIn;
    WriteSignalOut = WriteSignalIn;
    opcodeOut = opcodeIn;
end

always@(negedge Reset)
begin
    ReadDataOut = 0;
    ImmediateDataOut = 0;
    ReadRegisterOut = 0;
    WriteRegisterOut =  0;
//    WriteSignalOut = 0;
    opcodeOut = 0;
end

endmodule