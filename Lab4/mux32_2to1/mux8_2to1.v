module mux8_2to1(in1, in2, sel, out);
    input [7:0] in1, in2;
    input sel;
    output [7:0] out;

    genvar j;

    generate 
        for (j = 0; j < 8; j = j+1) begin
            mux1_2to1 m1(in1[j], in2[j], sel, out[j]);
        end
    endgenerate
endmodule 