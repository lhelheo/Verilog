module mux8x1_4b (i0, i1, i2, i3, i4, i5, i6, i7, s0, s1, s2, f);
    input [3:0] i0, i1, i2, i3, i4, i5, i6, i7;
    input [2:0] s0, s1, s2;
    output [3:0] f;

    assign f[3] = ~s2&(~s1)&(~s0)&i0[3] | ~s2&(~s1)&s0&i1[3] | ~s2&s1&(~s0)&i2[3] | ~s2&s1&s0&i3[3] | s2&(~s1)&(~s0)&i4[3] | s2&(~s1)&s0&i5[3] | s2&s1&(~s0)&i6[3] | s2&s1&s0&i7[3];
    assign f[2] = ~s2&(~s1)&(~s0)&i0[2] | ~s2&(~s1)&s0&i1[2] | ~s2&s1&(~s0)&i2[2] | ~s2&s1&s0&i3[2] | s2&(~s1)&(~s0)&i4[2] | s2&(~s1)&s0&i5[2] | s2&s1&(~s0)&i6[2] | s2&s1&s0&i7[2];
    assign f[1] = ~s2&(~s1)&(~s0)&i0[1] | ~s2&(~s1)&s0&i1[1] | ~s2&s1&(~s0)&i2[1] | ~s2&s1&s0&i3[1] | s2&(~s1)&(~s0)&i4[1] | s2&(~s1)&s0&i5[1] | s2&s1&(~s0)&i6[1] | s2&s1&s0&i7[1];
    assign f[0] = ~s2&(~s1)&(~s0)&i0[0] | ~s2&(~s1)&s0&i1[0] | ~s2&s1&(~s0)&i2[0] | ~s2&s1&s0&i3[0] | s2&(~s1)&(~s0)&i4[0] | s2&(~s1)&s0&i5[0] | s2&s1&(~s0)&i6[0] | s2&s1&s0&i7[0];
endmodule

module ula (a, b, x, y, z, S);
    input [3:0] a, b;
    input [2:0] x, y, z; // Expanded to 3 bits
    output [3:0] S;

    wire [3:0] w0, w1, w2, w3, w4, w5, w6, w7;

    // ADD, SUB, NOT, NAND, XOR, OR, AND
    assign w0 = a + b;
    assign w1 = a - b;
    assign w2 = a << b;
    assign w3 = a >> b;
    assign w4 = a & b;
    assign w5 = a | b;
    assign w6 = a ^ b;
    assign w7 = ~a;

    mux8x1_4b muxout (.i0(w0), .i1(w1), .i2(w2), .i3(w3),
                      .i4(w4), .i5(w5), .i6(w6), .i7(w7), 
                      .s0(x), .s1(y), .s2(z), .f(S));
endmodule


`timescale 1ns/1ps

module ula_tb;

    // Declaração dos sinais
    reg [3:0] a, b;
    reg [2:0] x, y, z; // Expandido para 3 bits
    wire [3:0] S;

    // Instancia o módulo ULA
    ula dut (
        .a(a),
        .b(b),
        .x(x),
        .y(y),
        .z(z),
        .S(S)
    );

    // Testbench
    integer i, j, k;
    initial begin
        $display("Starting testbench for ULA...");

        // Configuração do dumpfile para o gtkwave
        $dumpfile("ula_sim.vcd"); // Gera o arquivo .vcd
        $dumpvars(0, ula_tb);    // Registra todos os sinais do módulo de teste

        // Inicializa entradas
        a = 0; b = 0; x = 0; y = 0; z = 0;

        // Gera todas as combinações exaustivas
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                for (k = 0; k < 8; k = k + 1) begin
                    a = i; 
                    b = j;
                    {x, y, z} = k; // Atribui 3 bits para x, y e z

                    #10;

                    $display("a=%b, b=%b, x=%b, y=%b, z=%b --> S=%b", a, b, x, y, z, S);
                end
            end
        end

        $display("Testbench completed.");
        $finish;
    end

endmodule