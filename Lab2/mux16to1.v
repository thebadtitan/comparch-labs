module mux16to1(out, in, sel);
    input [0:15] in;
    input [0:3] sel;
    output out;
    wire [0:3] ma;

    mux4to1 mux1(ma[0], in[0:3], sel[2:3]);
    mux4to1 mux2(ma[1], in[4:7], sel[2:3]);
    mux4to1 mux3(ma[2], in[8:11], sel[2:3]);
    mux4to1 mux4(ma[3], in[12:15], sel[2:3]);

    mux4to1 mux5(out, ma, sel[0:1]);
endmodule