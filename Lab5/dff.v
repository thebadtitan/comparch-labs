module dff(Q, D, clock, reset);
    input D, clock, reset;
    output Q;
    reg Q;

    always @ (posedge clock) begin
        if (reset == 1'b0) Q <= 1'b0;
        else Q <= D;
    end
endmodule