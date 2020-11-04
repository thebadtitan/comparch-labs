module mux32_3to1_tb;
    reg [31:0] in0, in1, in2;
    reg [1:0] sel;
    wire [31:0] out;

    mux32_3to1 m1(in0, in1, in2, sel, out);

    initial begin
        in0 = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        in1 = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
        in2 = 32'b0000_0000_0000_0000_0000_0000_0000_0011;
        sel = 2'b01;
    end

    initial
        $monitor("out = %b", out);
endmodule