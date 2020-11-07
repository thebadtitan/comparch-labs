module regfile(
    clock,
    reset,      // Resets the register selected by WriteReg.
    RegWrite,   // Control signal. Is 1 if we want to write data into register.
    WriteReg,   // Register address of the register we wanna write into.
    WriteData,  // The data that we wanna write into the register.
    ReadReg1,   // The first register that we wanna read.
    ReadReg2,   // The second register that we wanna read.
    ReadData1,  // Data from the first register read.
    ReadData2   // Data from the second register read.
);
    input clock ,reset, RegWrite;
    input [1:0] WriteReg, ReadReg1, ReadReg2;
    input [31:0] WriteData;
    output [31:0] ReadData1, ReadData2;

    wire [3:0] decodeout;
    wire [31:0] Q0, Q1, Q2, Q3;

    // Clock signals to registers (for write operations)
    decoder2to4 d24(decodeout, WriteReg);
    wire clock0, clock1, clock2, clock3;
    assign clock0 = clock & RegWrite & decodeout[0];
    assign clock1 = clock & RegWrite & decodeout[1];
    assign clock2 = clock & RegWrite & decodeout[2];
    assign clock3 = clock & RegWrite & decodeout[3];
    
    reg32 r0(Q0, WriteData, clock0, reset);
    reg32 r1(Q1, WriteData, clock1, reset);
    reg32 r2(Q2, WriteData, clock2, reset);
    reg32 r3(Q3, WriteData, clock3, reset);

    mux4to1 m1(ReadData1, Q0, Q1, Q2, Q3, ReadReg1);
    mux4to1 m2(ReadData2, Q0, Q1, Q2, Q3, ReadReg2);
endmodule