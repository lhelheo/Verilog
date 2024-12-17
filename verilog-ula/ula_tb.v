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