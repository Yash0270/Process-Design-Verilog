`timescale 1ns / 1ps

module alu(
    input [7:0] A,
    input [7:0] B,
    output [7:0] Out
);

assign Out = B+A;

endmodule