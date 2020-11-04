module mux8_3to1(in0, in1, in2, sel, out);
    input [7:0] in0, in1, in2;
    input [1:0] sel;
    output [7:0] out;

    genvar j;

    generate 
        for (j = 0; j < 8; j = j+1) begin
            mux1_3to1 m1(in0[j], in1[j], in2[j], sel, out[j]);
        end
    endgenerate
endmodule 