module mux32_2to1(in1, in2, sel, out);
    input [31:0] in1, in2;
    input sel;
    output [31:0] out;

    genvar j;

    generate
        for (j = 0; j < 4; j = j+1) begin
            mux8_2to1 m1(in1[ (8*(j+1)-1) : (8*j) ], in2[ (8*(j+1)-1) : (8*j) ], sel, out[ (8*(j+1)-1) : (8*j) ]);
        end
    endgenerate
endmodule