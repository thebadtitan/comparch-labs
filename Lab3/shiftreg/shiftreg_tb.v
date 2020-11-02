module shiftreg_tb;
    parameter N = 4;
    reg enable, in, clock;
    wire [N-1:0] Q;
    
    shiftreg sreg(enable, in, clock, Q);

    initial
        begin
            clock = 0;
        end

    always
        #2 clock = ~clock;
    
    initial
        $monitor($time, "enable=%b | in=%b | Q=%b", enable, in, Q);
    
    initial
        begin
            in = 0;
            enable = 0;

            #4 in = 1; enable = 1;
            #4 in = 1; enable = 0;
            #4 in = 0; enable = 1;
            #5 $finish;
        end
endmodule