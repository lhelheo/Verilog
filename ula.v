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

module Subtractor(
    input [3:0] A,
    input [3:0] B,
    output [3:0] S,
    output Cout
);
    wire [3:0] S;
    wire Cout;
    
    assign {Cout, S} = A - B;
endmodule

module Multiplier(
    input [3:0] A,
    input [3:0] B,
    output [7:0] S
);
    wire [7:0] S;
    
    assign S = A * B;
endmodule

module Divider(
    input [7:0] A,
    input [3:0] B,
    output [3:0] S,
    output [3:0] R
);
    wire [3:0] S;
    wire [3:0] R;
    
    assign {S, R} = A / B;
endmodule

module Incrementer(
    input [3:0] A,
    output [3:0] S
);
    wire [3:0] S;
    
    assign S = A + 1;
endmodule

module Decrementer(
    input [3:0] A,
    output [3:0] S
);
    wire [3:0] S;
    
    assign S = A - 1;
endmodule

module Comparator(
    input [3:0] A,
    input [3:0] B,
    output [3:0] S
);
    wire [3:0] S;
    
    assign S = A == B;
endmodule

module And(
    input [3:0] A,
    input [3:0] B,
    output [3:0] S
);
    wire [3:0] S;
    
    assign S = A & B;
endmodule

module Or(
    input [3:0] A,
    input [3:0] B,
    output [3:0] S
);
    wire [3:0] S;
    
    assign S = A | B;
endmodule

module Xor(
    input [3:0] A,
    input [3:0] B,
    output [3:0] S
);
    wire [3:0] S;
    
    assign S = A ^ B;
endmodule

module Not(
    input [3:0] A,
    output [3:0] S
);
    wire [3:0] S;
    
    assign S = ~A;  
endmodule

module ShiftLeft(
    input [3:0] A,
    output [3:0] S
);
    wire [3:0] S;
    
    assign S = A << 1;
endmodule

module ShiftRight(
    input [3:0] A,
    output [3:0] S
);
    wire [3:0] S;
    
    assign S = A >> 1;
endmodule

module RotateLeft(
    input [3:0] A,
    output [3:0] S
);
    wire [3:0] S;
    
    assign S = {A[2:0], A[3]};
endmodule

module RotateRight(
    input [3:0] A,
    output [3:0] S
);
    wire [3:0] S;
    
    assign S = {A[0], A[3:1]};
endmodule

module ULA (
    input [3:0] A,
    input [3:0] B,
    input Cin,
    input [1:0] Op,
    output [3:0] S,
    output Cout
);
    wire [3:0] S;
    wire Cout;
    
    Adder adder(A, B, Cin, S, Cout);
    Subtractor subtractor(A, B, S, Cout);
    Multiplier multiplier(A, B, S);
    Divider divider(A, B, S, Cout);
    Incrementer incrementer(A, S);
    Decrementer decrementer(A, S);
    Comparator comparator(A, B, S);
    And and(A, B, S);
    Or or(A, B, S);
    Xor xor(A, B, S);
    Not not(A, S);
    ShiftLeft shiftLeft(A, S);
    ShiftRight shiftRight(A, S);
    RotateLeft rotateLeft(A, S);
    RotateRight rotateRight(A, S);
    
    assign S = Op[1] ? (Op[0] ? S : S) : S;
    assign Cout = Op[1] ? (Op[0] ? Cout : Cout) : Cout;
endmodule
