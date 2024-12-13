`include "somadorcompleto.v"
`timescale 1ns/100ps

module somadorcompleto_tb;
    reg a0, b0, ci0;
    wire s0, co0;

    // instanciação do módulo e nomeação por uut
    // delimitação de onde as saídas vão ser ligadas (a quais registradores e fios)
    somadorcompleto uut (.a(a0), .b(b0), .cin(ci0), .s(s0), .cout(co0));

    initial begin
        // diretiva que diz onde o arquivo de dump vai ser criado (.vcd é a extensão padrão)
        $dumpfile("somadorcompleto_tb.vcd");
        // diretiva que diz quais variáveis vão ser monitoradas, 0 significa que você quer salvar variáveis de todos os módulos (entrada e saída)
        // segundo parâmetro é o módulo onde as variáveis serão salvas
        $dumpvars(0, somadorcompleto_tb);
            a0 = 0; b0 = 0; ci0 = 0;
        //#10 significa que após 10 unidades de tempo será realizada a próxima etapa
        #10; a0 = 0; b0 = 0; ci0 = 1;
        #10; a0 = 0; b0 = 1; ci0 = 0;
        #10; a0 = 0; b0 = 1; ci0 = 1;
        #10; a0 = 1; b0 = 0; ci0 = 0;
        #10; a0 = 1; b0 = 0; ci0 = 1;
        #10; a0 = 1; b0 = 1; ci0 = 0;
        #10; a0 = 1; b0 = 1; ci0 = 1;
        #10 $finish;
    end
endmodule