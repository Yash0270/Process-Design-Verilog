`timescale 1ns / 1ps

module if_id(
    input clk,
    input Reset,
    
    input [1:0] opcodeIn,
    output reg [1:0] opcodeOut,
    
    input [7:0] Iin,
    output reg [7:0] Iout
);

always@(posedge clk)
begin
    Iout = Iin;
    opcodeOut = opcodeIn;
end

always@(negedge Reset)
begin
    Iout = 0;
    opcodeOut = 0;
end
endmodule