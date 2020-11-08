module ALU(
    input [31:0]  in0, in1,
    input [1:0]   op,
    input         binvert, 
    output [31:0] out,
    output wire   carryout
);

    wire [31:0] andout, orout, addsubout;

    assign andout = in0 & in1;
    assign orout = in0 | in1;
    assign {carryout, addsubout} = binvert ? (in0 + ~in1 + 1'b1) : (in0 + in1);

    mux4to1 m(out, andout, orout, addsubout, 0, op);
endmodule