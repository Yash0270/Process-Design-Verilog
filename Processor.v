`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2018 04:37:16 PM
// Design Name: 
// Module Name: Processor
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

module TOP_MODULE(
    input clk,
    input reset
    );

reg [7:0] pc;
wire [1:0] opcode;
wire [7:0] inst;

always@(posedge clk, negedge reset)
begin
    if(reset==0)
        pc <= 0;
    else
    begin
        if(opcode == 2'b11)
        pc <= pc+1+{{2{inst[5]}},inst[5:0]};
        
        else pc <= pc + 1;
    end
end

instMem I1(
    pc,
    reset,
    inst
);

assign opcode = inst[7:6];

wire [1:0] opcode_IFID;
wire [7:0] ins_IFID;

if_id PipeReg_yolo3(
    clk,
    reset,
    
    opcode,
    opcode_IFID,
    
    inst,
    ins_IFID
);

wire [2:0] readReg;
assign readReg = ins_IFID[5:3];
    
wire [7:0] writeData_EXWB, readData;
wire writeSignal_EXWB;
wire [2:0] writeRegister_EXWB;
    
registerFile yolo_mama(
        reset,
        readReg,
        writeRegister_EXWB,
        writeData_EXWB,
        writeSignal_EXWB,
        readData
);
    
wire[1:0] opcode_IDEX;
wire[2:0] WriteRegister_IDEX, readRegister_IDEX;
wire[7:0] readData_IDEX, immediateData, immediateData_IDEX;

assign immediateData = {{5{ins_IFID[2]}},ins_IFID[2:0]};

wire writeSignal, writeSignal_IDEX;
assign writeSignal = (opcode_IFID == 2'b11) ? 1'b0 : 1'b1;

ID_EX PipeReg_IDEX(
    clk,
    reset,
    
    opcode_IFID,
    opcode_IDEX,
    
    readData,
    readData_IDEX,
    
    immediateData,
    immediateData_IDEX,
    
    readReg,
    readRegister_IDEX,
    
    ins_IFID[5:3],
    WriteRegister_IDEX,
    
    writeSignal,
    writeSignal_IDEX
);

wire [7:0] B;

forwardingMUX yolo2(
    writeRegister_EXWB, readRegister_IDEX,
    writeSignal_EXWB,
    readData_IDEX,
    writeData_EXWB,
    B
    );

wire[7:0] ALUResult;

alu yolo1 (
    immediateData_IDEX,
    B,
    ALUResult
);

wire [7:0] WriteDataChoice;

outputMUX yolo4 (
    opcode_IDEX,
    ALUResult,
    immediateData_IDEX,
    WriteDataChoice
    );

wire[1:0] opcode_EXWB;

EX_WB PipeReg_EXWB(
    clk,
    reset,
    
    opcode_IDEX,
    opcode_EXWB,
    
    WriteDataChoice,
    writeData_EXWB,
    
    writeSignal_IDEX,
    writeSignal_EXWB,
    
    WriteRegister_IDEX,
    writeRegister_EXWB
);

endmodule
