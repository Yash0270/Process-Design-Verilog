`timescale 1ns / 1ps

module registerFile(
    input Reset,
    input [2:0] ReadRegister,
    input [2:0] WriteRegister,
    input [7:0] WriteData,
    input WriteSignal,
    output [7:0] ReadData
);

reg [7:0] RegFile [7:0];

assign ReadData = RegFile[ReadRegister];

always@(negedge Reset)
begin
    if(Reset == 0)
    begin
        RegFile[0] = 0;
        RegFile[1] = 1;
        RegFile[2] = 2;
        RegFile[3] = 3;
        RegFile[4] = 4;
        RegFile[5] = 5;
        RegFile[6] = 6;
        RegFile[7] = 7;
    end
end

always@(WriteData,WriteRegister)//(WriteSignal)
begin
    if(WriteSignal == 1)
    begin
       RegFile[WriteRegister] = WriteData;
    end
end

endmodule