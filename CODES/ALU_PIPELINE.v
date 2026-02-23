`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.02.2026 19:21:40
// Design Name: 
// Module Name: ALU_PIPELINE
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


module ALU_PIPELINE(input clk,
                    input rst,
                    input [3:0]opcode,
                    input [7:0]A,
                    input [7:0]B,
                    output reg [7:0]result
                    );
                    //stage-1,fetch
                    reg [7:0]a1;
                    reg [7:0]b1;
                    reg [3:0]op1;
                    //stage-2,execute
                    reg [7:0]alu_out;
                    reg [7:0]alu_result;
                    always @(posedge clk or posedge rst)
                    begin
                     if(rst)begin
                     a1<=0;
                     b1<=0;
                     op1<=0;
                    end
                    else
                    begin
                    a1<=A;
                    b1<=B;
                    op1<=opcode;
                    end
                    end
                    //stage-2:execute
                    always@(*)
                    begin
                    case(op1)
                    4'b0000:alu_out=a1+b1;
                    4'b0001:alu_out=a1-b1;
                    4'b0010:alu_out=a1&b1;
                    4'b0011:alu_out=a1|b1;
                    4'b0100:alu_out=a1^b1;
                    default:
                          alu_out=0;
                    endcase
                    end
                    always@(posedge clk or posedge rst)
                    begin
                    if(rst)
                    begin
                    alu_result=0;
                    end
                    else
                    begin
                    alu_result=alu_out;
                    end
                    end
                    //stage-3:write back
                    always@(posedge clk or posedge rst)
                    begin
                    if(rst)
                    result=0;
                    else
                    result=alu_result;
                    end
                    
                    
                    
                    
endmodule
