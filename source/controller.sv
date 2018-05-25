`timescale 1ns / 1ps

module controller(
    input   logic       clk, reset,
    input   logic [5:0] op, funct,
    input   logic       zero,
    output  logic       pcen, 
    output  logic [1:0] memwrite, 
    output  logic       irwrite, regwrite,
    output  logic       iord, memtoreg, regdst, alusrca,
    output  logic [2:0] alusrcb,
    output  logic [1:0] pcsrc,
    output  logic [3:0] alucontrol,
    output  logic [2:0] readtype,
    output  logic [4:0] state
); 
    logic [2:0] aluop;
    logic       branch, pcwrite;
    logic       bne; 
    maindec maindec(clk, reset, op, pcwrite, memwrite, irwrite,
                regwrite, branch, iord, memtoreg, regdst,
                alusrca, alusrcb, pcsrc, aluop, bne, readtype, state);
    aludec aludec(funct, aluop, alucontrol);
    assign pcen = pcwrite | (branch & zero) | (bne & ~zero);
endmodule