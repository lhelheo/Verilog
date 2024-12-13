// implemente um módulo somador de 4 bits

// module somadorcompleto (
//     input [4:0] A,
//     input [4:0] B,
//     input Cin,
//     output [4:0] S,
//     output Cout

// );
//     // interconexão no módulo
//     wire [4:0] S;
//     wire Cout;

//     // Soma de bits e cálculo
//     assign {Cout, S} = A + B + Cin;

// endmodule

module somadorcompleto (a,b,cin,s,cout);
    input a,b,cin;
    output s,cout;

    assign s = a ^ b ^ cin;
    assign cout = (a & b) | (a & cin) | (b & cin);
endmodule   