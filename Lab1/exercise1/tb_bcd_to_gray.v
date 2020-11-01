module testbench;
    reg b0, b1, b2, b3;
    wire g0, g1, g2, g3;

    localparam period = 20;
    bcd_to_gray()