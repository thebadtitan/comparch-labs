module serialadder(enable, load, clock, r1, r2, carry, sum);
    parameter N = 4;

    input [N-1:0] r1, r2;
    input clock, load, enable;

    output [N-1:0] sum;
    wire [N-1:0] sum2;
    output carry;
    reg s, d, carry;
    reg [1:0] res;

    shiftreg sr1(enable, clock, load, s, r1, sum);
    shiftreg sr2(enable, clock, load, 1'b0, r2, sum2);

    // assign {s, carry} = sum[0] + sum2[0] + carry;
    initial
        d=0;

    always @ (posedge clock)
        carry = d;

    always @ (sum or sum2) begin
            res = sum[0] + sum2[0] + d;
            s = res[0];
            d = res[1];
            // $display("sum=%b | d=%b", s, d);
    end
endmodule