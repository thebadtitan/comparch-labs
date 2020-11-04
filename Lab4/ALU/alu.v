module ALU(in0, in1, op, binvert, out, carryout);
    input [31:0] in0, in1;
    input [1:0] op;
    input binvert;

    output [31:0] out;
    output carryout;
    wire [31:0] andout, orout, addsubout;
    wire carryout;

    assign andout = in0 & in1;
    assign orout = in0 | in1;
    assign {carryout, addsubout} = binvert ? (in0 + ~in1 + 1'b1) : (in0 + in1);

    mux3to1 m(andout, orout, addsubout, op, out);
endmodule