module instMem(
    input [7:0] PC,
    input Reset,
    output [7:0] Instruction
);

reg [7:0] IMem [7:0];

assign Instruction = IMem[PC];

always@(negedge Reset)
begin
    if(Reset == 0)
    begin
        IMem[0] = 8'h13;
        IMem[1] = 8'h52;
        IMem[2] = 8'h4b;
        IMem[3] = 8'hc1;
        IMem[4] = 8'h1c;
        IMem[5] = 8'h5d;
        IMem[6] = 8'h00;
        IMem[7] = 8'h00;
    end
end

endmodule