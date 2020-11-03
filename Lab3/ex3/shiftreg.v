// Shift register with parallel-loading functionality
module shiftreg(enable, clock, load, in, loadval, Q);
    parameter N = 4;

    input enable, in, clock, load;
    input [N-1:0] loadval;

    output [N-1:0] Q;
    output last;

    wire last;
    reg [N-1:0] Q;

    initial
        Q = 4'b0000;
    
    always @ (posedge clock)
        begin
            if (load)
                Q = loadval;
            else if (enable)
                Q = {in, Q[N-1:1]};
        end
endmodule

