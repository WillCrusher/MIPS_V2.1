`timescale 1ns / 1ps

module simulation();
    logic clk;
    logic reset;
    logic [63:0]writedata, dataadr;
    logic [1:0] memwrite;
    logic [63:0]datapc;
    logic [63:0]readdata;
    logic [9:0] cnt;
    logic [7:0] pclow;
    logic [7:0] addr;
    logic [4:0] checka;
    logic [63:0]check;
    logic [63:0]memdata;
    top top(clk, reset, writedata, dataadr, memwrite, readdata,pclow, state,checka,check,addr,memdata);
    
    initial begin
        cnt <= 7'b0;
        reset <= 1; #22; reset <= 0;
        end    
    always begin
        clk <= 1; #5 clk <= 0; #5;
    end
    always @(negedge clk) begin
        if (memwrite) begin
            if (dataadr === 100 & writedata === 7)begin
                $display("Test-standard2 pass!");
                #100  $stop;
            end
            if (dataadr === 128 & writedata === 7)begin
                 $display("Test-power2 pass!");
                 #100 $stop;
            end            
            if (dataadr === 80 & writedata === 1)begin
                 $display("Test-loadstore pass!");
                 #100 $stop;
            end
        end
        cnt = cnt + 1;
        if(cnt === 512)begin
            $display("Some error occurs!");
            $stop;
        end
    end

endmodule  