`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2018 01:38:37 AM
// Design Name: 
// Module Name: OutputMUX
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


module outputMUX(
    input [1:0] opcode,
    input [7:0] ALUResult,
    input [7:0] ForwardChoice,
    output [7:0] WriteDataChoice
    );
    
assign WriteDataChoice = (opcode[0]==0) ? ForwardChoice : ALUResult;

endmodule
