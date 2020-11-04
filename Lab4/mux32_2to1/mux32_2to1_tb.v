module mux32_2to1_tb;
    reg [31:0] in1, in2;
    reg sel;
    wire [31:0] out;

    mux32_2to1 m1(in1, in2, sel, out);

    initial begin
        in1 = 32'b0000_0000_0000_0100_0000_0000_0000_0001;
        in2 = 32'b0100_0000_0000_0000_0000_0000_0000_0011;
        sel = 1'b1;
    end

    initial
        $monitor("out = %b", out);
endmodule