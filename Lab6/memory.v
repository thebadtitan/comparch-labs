module memory # (parameter SIZE = 128) (
    input wire    clock, writemode,
    input [31:0]  writedata,
    input [31:0]  address,
    output [31:0] readval
);

    reg [31:0] ram[0:SIZE-1];

    assign readval = ram[address];

    always @ (posedge clock) begin
        if (writemode) ram[address] <= writedata;
    end

endmodule