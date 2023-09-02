`timescale 1ns/10ps
`include "d_ff.sv"

module d_ff_tb();
reg clk;
reg rst;
reg d_in;
wire q_out;

d_ff d_ff_inst(
    .clk(clk),
    .rst(rst),
    .d_in(d_in),
    .q_out(q_out)
);

initial begin
    clk = 1'b0;
    rst = 1'b0;
    d_in = 1'b1;
    forever #5 clk = ~clk;
    #500 $finish();
end

integer i,j;
always@(posedge clk) begin
    for(i=0; i<20;i= i+1) begin
        if(d_in) begin
            d_in <= 1'b0;
        end else if(!d_in) begin
            d_in <= 1'b1;
        end else begin
            d_in <= 1'b0;
        end
    end

    for(j=0; j<20; j= j+4) begin
        if(rst) begin
            rst <= 1'b0;
        end else if(!rst) begin
            rst <= 1'b1;
        end else begin
            rst <= 1'b0;
        end
    end
end

initial begin
    $monitor($time, " d_in= %b, q_out = %b",d_in,q_out);
end


endmodule
// how to use github