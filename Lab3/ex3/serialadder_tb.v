module serialadder_tb;
    parameter N = 4;
    reg [N-1:0] r1, r2;
    reg enable, load, clock;

    wire [N-1:0] sum;
    wire carry;

    serialadder sa(enable, load, clock, r1, r2, carry, sum);
    integer i;

    initial
        $monitor($time, " sum = %b | sum2=%b | carry = %b", sum, sa.sum2, carry);

    initial begin
        clock = 0;
        enable = 0; load = 1;
        r1 = 4'b1111; r2 = 4'b1111;
        #2 clock = 1;
        #2 clock = 0;

        enable = 1; load = 0;
        for (i = 0; i < 4; i = i+1) begin
            #2 clock = 1;
            #2 clock = 0;
        end
        #100 $finish;
    end
endmodule