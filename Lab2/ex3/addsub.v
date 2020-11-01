module addsub(s0, s1, s2, s3, cout, ofl, A, B, M);
    input [3:0] A, B;
    input M;
    output s0, s1, s2, s3, cout, ofl;
    wire ofl;
    wire c0, c1, c2;
    
    reg [3:0] newb;

    fulladder f1(s0, c0, A[0], newb[0], M);
    fulladder f2(s1, c1, A[1], newb[1], c0);
    fulladder f3(s2, c2, A[2], newb[2], c1);
    fulladder f4(s3, cout, A[3], newb[3], c2);
    assign ofl = cout ^ c2;

    always @ (A or B or M)
        begin
            newb[0] = B[0] ^ M;
            newb[1] = B[1] ^ M;
            newb[2] = B[2] ^ M;
            newb[3] = B[3] ^ M;
        end

endmodule