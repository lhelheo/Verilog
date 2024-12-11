// implemente um módulo somador de 4 bits

module somadorCompleto (
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] S,
    output Cout

);
    // interconexão no módulo
    wire [3:0] S;
    wire Cout;

    // Soma de bits e cálculo
    assign {Cout, S} = A + B + Cin;

endmodule