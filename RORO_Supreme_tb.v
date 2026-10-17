`timescale 1ns/1ps
module RORO_Supreme_tb;

reg [3:0] dir;
wire [31:0] DD;
wire ZF;

// Arreglo para guardar las respuestas correctas
reg [31:0] exp_DD [0:15];
reg exp_ZF [0:15];
integer i;

RORO_Supreme UUT(
    .dir_instruccion(dir),
    .DD(DD),
    .ZF(ZF)
);

initial begin
    // Respuestas correctas del PDF
    exp_DD[0]=17; exp_ZF[0]=0;
    exp_DD[1]=21; exp_ZF[1]=0;
    exp_DD[2]=35; exp_ZF[2]=0;
    exp_DD[3]=12; exp_ZF[3]=0;
    exp_DD[4]=60; exp_ZF[4]=0;
    exp_DD[5]=48; exp_ZF[5]=0;
    exp_DD[6]=0;  exp_ZF[6]=1;
    exp_DD[7]=9;  exp_ZF[7]=0;
    exp_DD[8]=51; exp_ZF[8]=0;
    exp_DD[9] = 4294967255; exp_ZF[9] = 0; // Resta negativa
    exp_DD[10]=97; exp_ZF[10]=0;
    exp_DD[11]=0;  exp_ZF[11]=1;
    exp_DD[12]=0;  exp_ZF[12]=1;
    exp_DD[13]=0;  exp_ZF[13]=1;
    exp_DD[14]=1;  exp_ZF[14]=0;
    exp_DD[15]=0;  exp_ZF[15]=1;

    for(i=0; i<16; i=i+1) begin
        dir = i;
        #10;
        
        // Comprobacion automatica
        if(DD == exp_DD[i] && ZF == exp_ZF[i]) begin
            $display("Caso %0d: PASS", i);
        end else begin
            $display("Caso %0d: FAIL", i);
        end
    end
    
    $finish;
end
endmodule
