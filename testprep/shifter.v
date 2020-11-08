module shifter # (parameter SHIFT = 2, N = 32) (
    input [N-1:0]  in
    output [N-1:0] out,
);

    assign out = { in, {SHIFT{1'b0}} };
endmodule


// module shifter_tb;
//     reg [7:0] a;
//     wire [7:0] shiftout;

//     shifter#(7, 8) s1(shiftout, a);

//     initial begin
//         a = 8'b10011111;
//         $monitor("a = %b | shiftout = %b", a, shiftout);
//     end
// endmodule