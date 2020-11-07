module reg32_tb;
    reg [31:0] D;
    reg clock, reset;

    wire [31:0] Q;

    reg32 r(Q, D, clock, reset);

    initial
        clock = 1'b1;

    initial
        $monitor("Register value = %h", Q);
    
    always
        #5 clock = ~clock;
    
    initial begin
        reset = 1'b0;
        #20 reset = 1'b1;
        #20 D = 32'hAFAFAFAF;
        #200 $finish;
    end
endmodule