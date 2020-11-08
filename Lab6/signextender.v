module signextender # (parameter FINAL_SIZE = 32, N = 16) (
    input [N-1:0]           in,
    output [FINAL_SIZE-1:0] out
);

    assign out = { {(FINAL_SIZE-N){in[N-1]}}, in };
endmodule

// module signextender_tb;
//     reg [3:0] in;
//     wire [7:0] out;

//     signextender#(8, 4) s1(in, out);

//     initial begin
//         in = 4'b1011;
//         $monitor("in = %b | out = %b", in, out);
//     end
// endmodule