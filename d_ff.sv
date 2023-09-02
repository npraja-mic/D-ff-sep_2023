module d_ff (
    input clk,
    input d_in,
    input rst,
    output reg q_out
);

always@(posedge clk) begin
    if(rst) begin
        q_out <= '0;
    end else begin
        q_out <= d_in;
    end
end
endmodule