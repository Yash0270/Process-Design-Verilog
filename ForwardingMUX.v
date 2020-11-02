`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2018 01:38:37 AM
// Design Name: 
// Module Name: ForwardingMUX
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


module forwardingMUX(
    input [2:0] WriteRegister_EXWB, ReadRegister_IDEX,
    input WriteSignal_EXWB,
    input [7:0] ReadData_IDEX,
    input [7:0] WriteData_EXWB,
    output reg [7:0] ForwardChoice
    );
    
always@*
begin
    if((WriteRegister_EXWB == ReadRegister_IDEX))//&&(WriteSignal_EXWB==1))
    ForwardChoice = WriteData_EXWB;
    
    else ForwardChoice = ReadData_IDEX;
end

endmodule
