`timescale 1ns/1ps
module RORO_tb;

reg [11:0] instruccion;
wire [31:0] resultado;
wire ZF;

RORO UUT(
    .instruccion(instruccion),
    .resultado(resultado),
    .ZF(ZF)
);

initial begin
    instruccion = 12'b0010_0000_0000; #10;
    instruccion = 12'b0010_0001_0001; #10;
    instruccion = 12'b0010_0010_0010; #10;
    instruccion = 12'b0010_0011_0011; #10;
    instruccion = 12'b0010_0100_0100; #10;
    instruccion = 12'b0010_0101_0101; #10;
    instruccion = 12'b0110_0110_0110; #10;
    instruccion = 12'b0110_0111_0111; #10;
    instruccion = 12'b0110_1000_1000; #10;
    instruccion = 12'b0110_1001_1001; #10;
    instruccion = 12'b0110_1010_1010; #10;
    instruccion = 12'b0110_1011_1011; #10;
    instruccion = 12'b0111_1100_1100; #10;
    instruccion = 12'b0111_1101_1101; #10;
    instruccion = 12'b0111_1110_1110; #10;
    instruccion = 12'b0111_1111_1111; #10;
    $finish;
end
endmodule
