module mux1_2to1(in1, in2, sel, out);
    input in1, in2, sel;
    output out;

    wire a1, a2, sel0;
    not n1(sel0, sel);
    and an1(a1, sel, in2);
    and an2(a2, sel0, in1);
    or o1(out, a1, a2);
endmodule