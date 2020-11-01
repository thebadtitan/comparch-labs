module bcdtogray (b0, b1, b2, b3, g0, g1, g2, g3);
    input b0, b1, b2, b3;
    output g0, g1, g2, g3;
    
    xor x0(g0, b0, b1);
    xor x1(g1, b1, b2);
    xor x2(g2, b2, b3);
    assign g3 = b3;
endmodule