`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.02.2026 23:35:03
// Design Name: 
// Module Name: test_bench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module test_bench(

    );

    reg clk, rst;
    reg [3:0] opcode;
    reg [7:0] A, B;
    wire [7:0] result;

    ALU_PIPELINE dut (
        .clk(clk),
        .rst(rst),
        .opcode(opcode),
        .A(A),
        .B(B),
        .result(result)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        A = 0; B = 0; opcode = 0;

        #10 rst = 0;

        // ADD
        #10 A = 8'd5;  B = 8'd3;  opcode = 4'b0000;

        // SUB
        #10 A = 8'd10; B = 8'd4;  opcode = 4'b0001;

        // AND
        #10 A = 8'd8;  B = 8'd3;  opcode = 4'b0010;

        // OR
        #10 A = 8'd8;  B = 8'd3;  opcode = 4'b0011;

        // XOR
        #10 A = 8'd6;  B = 8'd2;  opcode = 4'b0100;

        #100 $stop;
    end

endmodule
