module comparator(agtb, aeqb, altb, a, b);
    input [3:0] a;
    input [3:0] b;
    output agtb, aeqb, altb;
    reg agtb, aeqb, altb;

    always @ (a or b)
        begin
            if ($signed(a) < $signed(b))
                begin
                    agtb = 0;
                    aeqb = 0;
                    altb = 1;
                end
            else if ($signed(a) > $signed(b))
                begin
                    agtb = 1;
                    aeqb = 0;
                    altb = 0;
                end
            else
                begin
                    agtb = 0;
                    aeqb = 1;
                    altb = 0;
                end
        end
endmodule