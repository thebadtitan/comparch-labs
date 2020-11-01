module comparator_tb;
    reg [3:0] a;
    reg [3:0] b;

    wire agtb, aeqb, altb;

    initial
        begin
            a = 4'b0000;
            b = 4'b0000;
        end

    initial
        begin
            #1 a = -8; b = -5;
            #2 a =  2; b =  7;
            #1 a =  5; b = -1;
        end

    comparator comp(agtb, aeqb, altb, a, b);

    initial
        begin
            $monitor($time, " | a = %b | b = %b | agtb = %b | aeqb = %b | altb = %b", a, b, agtb, aeqb, altb);
        end

    initial
        begin
            #5 $finish;
        end
endmodule