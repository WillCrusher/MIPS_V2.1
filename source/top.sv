`timescale 1ns / 1ps

module top#(parameter N = 64)(
    input   logic       clk, reset,
    output  logic[N-1:0]writedata, dataadr,
    output  logic [1:0] memwrite,
    output  logic[N-1:0]readdata,
    output  logic [7:0] pclow,
    output  logic [4:0] state,
    input   logic [4:0] checka,
    output  logic [N-1:0]check,
    input   logic [7:0] checkma,
    output  logic [31:0]checkm
);
    logic dword;
    mips mips(clk,reset,dataadr,writedata,memwrite,dword,readdata,pclow,state,checka,check);
    mem mem(clk,dword,memwrite,dataadr,writedata,readdata,checkma,checkm);

endmodule