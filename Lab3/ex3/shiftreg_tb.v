// Testbench for shiftreg module
module shiftreg_tb;
    parameter N = 4;

    reg [N-1:0] r1;
    reg enable, load, clock;
    wire [N-1:0] Q;
    wire last;

    shiftreg sr(enable, clock, load, 1'b0, r1, Q, last);

    initial
        clock = 0;

    initial
        $monitor("Q=%b | last=%b", Q, last);

    always
        #2 clock = ~clock;

    initial begin
        r1 = 4'b1110;
        enable = 0; load = 1;
        #5 enable = 1; load = 0;
        #15 $finish;
    end
endmodule