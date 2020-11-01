module decoder3to8(d0, d1, d2, d3, d4, d5, d6, d7, x, y, z);
    input x, y, z;
    output d0, d1, d2, d3, d4, d5, d6, d7;

    wire xn, yn, zn;
    not n1(xn, x);
    not n2(yn, y);
    not n3(zn, z);

    and a0(d0, xn, yn, zn);
    and a1(d1, xn, yn, z);
    and a2(d2, xn, y, zn);
    and a3(d3, xn, y, z);
    and a4(d4, x, yn, zn);
    and a5(d5, x, yn, z);
    and a6(d6, x, y, zn);
    and a7(d7, x, y, z);
endmodule