module mux2to1 #(parameter N = 32) (
    output [N-1:0] out,
    input [N-1:0]  in0, in1,
    input wire     sel
);
    assign out = (sel == 1'b0) ? in0 : in1;

endmodule
