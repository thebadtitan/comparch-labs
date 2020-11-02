module mealy_tb;
    reg clock, reset, in;
    wire out;
    reg [15:0] sequence;
    integer i;

    mealy m1(clock, reset, in, out);

    initial
        begin
            clock = 0;
            reset = 1;
            sequence = 16'b0101_0111_0111_0010;
            #5 reset = 0;
            
            // Controlled test, since we know what the input sequence is going to be
            for (i = 0; i <= 15; i = i+1)
                begin
                    $display("Currently in state %b", m1.state);
                    in = sequence[i];
                    $display("Sending input = %b", in);
                    #2 clock = 1;
                    #2 clock = 0;
                    $display("New state is %b | output = %b\n\n", m1.state, out);
                end
            
            testing;
        end

    // Uncontrolled test, since we do not know what the input sequence is gonna be.
    // This isn't specifically required or anything. We're just doing this because
    // we can
    task testing;
        for (i = 0; i <= 15; i = i+1)
            begin
                $display("Currently in state %b", m1.state);
                in = $random % 2;
                $display("Sending input = %b", in);
                #2 clock = 1;
                #2 clock = 0;
                $display("New state is %b | output = %b\n\n", m1.state, out);
            end
    endtask
endmodule
    