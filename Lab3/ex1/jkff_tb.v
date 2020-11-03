module jkff_tb;
    reg J, K, clock;
    wire out;

    jkff j1(J, K, clock, out);

    initial begin
        clock = 0;
        J = 1; K = 0;
        $monitor("Q = %b", out);
        #20 $finish;
    end

    always
        #2 clock = ~clock;
endmodule