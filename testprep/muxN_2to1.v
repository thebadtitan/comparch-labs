module muxN_2to1 # (parameter N = 32) (
    output [N-1:0] out,
    input [N-1:0]  in0, in1,
    input wire     sel
);

    genvar j;
    generate
        for (j = 0; j < N; j = j+1) begin
            mux1_2to1 m(out[j], in0[j], in1[j], sel);
        end
    endgenerate
endmodule