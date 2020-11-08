module memory # (parameter SIZE = 128, N = 32) (
    input wire    clock, writemode,
    input [N-1:0]  writedata,
    input [N-1:0]  address,
    output [N-1:0] readval
);

    reg [N-1:0] ram[0:SIZE-1];

    assign readval = ram[address];

    always @ (posedge clock) begin
        if (writemode) ram[address] <= writedata;
    end

endmodule