module RORO(
	input [11:0]instruccion,
	output [31:0]resultado,
	output ZF
);

wire [31:0]c1, c2;

// Le pasamos los nombres de los .txt
ROM #("ROMa_init.txt") Roma(
	.DirL(instruccion[7:4]),
	.Data(c1)
);

ROM #("ROMina_init.txt") Romina(
	.DirL(instruccion[3:0]),
	.Data(c2)
);

MIPSALU Pablo(
	.ALUctl(instruccion[11:8]),
	.A(c1),
	.B(c2),
	.ALUOut(resultado),
	.Zero(ZF)
);

endmodule

