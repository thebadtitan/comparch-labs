module adder # (parameter N = 32) (
    input [N-1:0] in0, in1,
    output [N-1:0] sum,
    output wire carry
);

    assign {carry, sum} = in0 + in1;
endmodule