module Adder(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] S,
    output Cout
);
    wire [3:0] S;
    wire Cout;
    
    assign {Cout, S} = A + B + Cin; 
endmodule
