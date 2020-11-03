module counter_tb;
    wire [3:0] out;
    reg clock;

    counter c(clock, out);

    initial begin
        clock = 0;
        $monitor("Counter value = %b", out);
        #100 $finish;
    end

    always
        #2 clock = ~clock;
endmodule