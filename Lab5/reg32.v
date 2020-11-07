module reg32(Q, D, clock, reset);
    input [31:0] D;
    input clock, reset;

    output [31:0] Q;

    genvar j;

    generate
        for (j = 0; j < 32; j = j+1) begin
            dff d(Q[j], D[j], clock, reset);
        end
    endgenerate
endmodule
