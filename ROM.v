module ROM #(parameter archivo = "datos.txt") (
	input [3:0]DirL,
	output [31:0]Data
);

// Memoria de 16 espacios
reg [31:0] srom [0:15];

assign Data = srom[DirL];

initial begin
	// Lee el archivo 
	$readmemb(archivo, srom);
end

endmodule