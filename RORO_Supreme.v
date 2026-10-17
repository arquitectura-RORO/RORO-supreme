module RORO_Supreme(
	input [3:0] dir_instruccion,
	output [31:0] DD,
	output ZF
);

wire [11:0] w_inst;

ROM_Instrucciones memoria_inst(
	.Dir(dir_instruccion),
	.Instruccion(w_inst)
);

RORO modulo_roro(
	.instruccion(w_inst),
	.resultado(DD),
	.ZF(ZF)
);

endmodule
