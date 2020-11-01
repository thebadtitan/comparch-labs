module fulladder(s, c, x, y, z);
    input x, y, z;
    output s, c;

    wire d0, d1, d2, d3, d4, d5, d6, d7;

    decoder3to8 dec(d0, d1, d2, d3, d4, d5, d6, d7, x, y, z);

    or or1(s, d1, d2, d4, d7);
    or or2(c, d3, d5, d6, d7);
endmodule