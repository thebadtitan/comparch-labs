module stringmatch_tb;
    reg clock, reset, in;
    wire out;
    reg [0:7] sequence;
    integer i;

    stringmatch sm(clock, reset, in, out);

    initial
        begin
            clock = 0;
            reset = 1;

            sequence = 8'b10110_110;
            #5 reset = 0;

            for (i = 0; i <= 8; i = i+1) begin
                in = sequence[i];
                $display("Sending input %b", in);
                #2 clock = 1;
                #2 clock = 0;
                $display("Sequence Detected = %b", out);
            end
        end
endmodule