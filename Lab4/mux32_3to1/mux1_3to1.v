module mux1_3to1(in0, in1, in2, sel, out);
    input in0, in1, in2;
    input [1:0] sel;
    output out;

    wire a0, a1, a2, sel00, sel10;
    not n1(sel00, sel[0]);
    not n2(sel10, sel[1]);

    and an0(a0, in0, sel10, sel00);
    and an1(a1, in1, sel10, sel[0]);
    and an2(a2, in2, sel[1], sel00);

    or o1(out, a0, a1, a2);
endmodule