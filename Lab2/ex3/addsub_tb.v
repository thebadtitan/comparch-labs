module addsub_tb;
    reg [3:0] A, B;
    reg M;

    wire s0, s1, s2, s3, cout, ofl;
    addsub asb(s0, s1, s2, s3, cout, ofl, A, B, M);

    initial
        begin
            M = 0;
            A = 2; B = 5;
            #1 A =  5; B =  3;
            #1 A =  5; B = 1;
        end

    initial
        begin
            $monitor($time, " | A = %b | B = %b | SUM=%b%b%b%b | CARRY=%b | OVERFLOW=%b", A, B, s3, s2, s1, s0, cout, ofl);
        end
    
    initial
        begin
            #5 $finish;
        end
endmodule