module shiftreg(enable, in, clock, Q);
    parameter N = 4;
    input enable, in, clock;
    output [N-1:0] Q;

    reg [N-1:0] Q;

    initial
        Q = 4'b0000;
    
    always @ (posedge clock)
        begin
            if (enable) Q = {in, Q[N-1:1]};
        end
endmodule