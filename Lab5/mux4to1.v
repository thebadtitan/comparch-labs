module mux4to1(out, in0, in1, in2, in3, sel);
    input [31:0] in0, in1, in2, in3;
    input [1:0] sel;
    output [31:0] out;

    reg [31:0] out;

    // Yep, we can also use commas instead of 'or'
    // in the sensitivity list in always blocks.
    always @ (in0, in1, in2, in3, sel) begin
        case (sel)
            2'b00: out = in0;
            2'b01: out = in1;
            2'b10: out = in2;
            2'b11: out = in3;
        endcase
    end
endmodule