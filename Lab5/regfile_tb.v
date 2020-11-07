module regfile_tb;
    reg [31:0] writedata;
    wire [31:0] readdata1, readdata2;
    reg [1:0] writereg, readreg1, readreg2;
    reg regwrite, clock, reset;

    regfile rfile(
        clock,
        reset,
        regwrite,
        writereg,
        writedata,
        readreg1,
        readreg2,
        readdata1,
        readdata2
    );

    initial
        $monitor("\nR1=%b\nR2=%b", readdata1, readdata2);
    
    initial begin
        clock = 0;
        regwrite = 1'b0; writereg = 2'b00; readreg1 = 2'b00; readreg2 = 2'b01; reset = 1'b0;
        
        #2 clock = 1;
        #2 clock = 0;

        regwrite = 1'b1; reset = 1'b1;
        writereg = 2'b00; writedata = 32'b0000_0000_0000_0000_0000_0000_0000_0000;

        #2 clock = 1;
        #2 clock = 0;

        writereg = 2'b01; writedata = 32'b0000_0000_0000_0000_0000_0000_0000_0001;

        #2 clock = 1;
        #2 clock = 0;

        writereg = 2'b10; writedata = 32'b0000_0000_0000_0000_0000_0000_0000_0010;

        #2 clock = 1;
        #2 clock = 0;

        writereg = 2'b11; writedata = 32'b0000_0000_0000_0000_0000_0000_0000_0011;

        #2 clock = 1;
        #2 clock = 0;

        writereg = 2'b01; writedata = 32'b0000_0000_0110_0000_0000_0000_0000_0011;

        #2 clock = 1;
        #2 clock = 0;

        readreg1 = 2'b10; readreg2 = 2'b11;
    end
endmodule