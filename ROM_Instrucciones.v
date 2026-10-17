module ROM_Instrucciones (
	input [3:0] Dir,
	output [11:0] Instruccion
);

reg [11:0] mem [0:15];

initial begin
	$readmemb("instrucciones.txt", mem);
end

assign Instruccion = mem[Dir];

endmodule