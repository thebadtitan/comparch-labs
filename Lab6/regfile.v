// 32-to-1 MUX
module mux32to1(
    output reg [31:0] out,
    input [31:0] in0, in1, in2, in3,
                 in4, in5, in6, in7,
                 in8, in9, in10, in11,
                 in12, in13, in14, in15,
                 in16, in17, in18, in19,
                 in20, in21, in22, in23,
                 in24, in25, in26, in27,
                 in28, in29, in30, in31,
    input [5:0] sel
);
    always @ (
        sel,
        in0, in1, in2, in3,
        in4, in5, in6, in7,
        in8, in9, in10, in11,
        in12, in13, in14, in15,
        in16, in17, in18, in19,
        in20, in21, in22, in23,
        in24, in25, in26, in27,
        in28, in29, in30, in31
    ) begin
        case (sel)
            5'd0:  out = in0;
            5'd1:  out = in1;
            5'd2:  out = in2;
            5'd3:  out = in3;
            5'd4:  out = in4;
            5'd5:  out = in5;
            5'd6:  out = in6;
            5'd7:  out = in7;
            5'd8:  out = in8;
            5'd9:  out = in9;
            5'd10: out = in10;
            5'd11: out = in11;
            5'd12: out = in12;
            5'd13: out = in13;
            5'd14: out = in14;
            5'd15: out = in15;
            5'd16: out = in16;
            5'd17: out = in17;
            5'd18: out = in18;
            5'd19: out = in19;
            5'd21: out = in21;
            5'd22: out = in22;
            5'd23: out = in23;
            5'd24: out = in24;
            5'd25: out = in25;
            5'd26: out = in26;
            5'd27: out = in27;
            5'd28: out = in28;
            5'd29: out = in29;
            5'd30: out = in30;
            5'd31: out = in31;
        endcase
    end

endmodule

// D-flipflop
module dff(Q, D, clock, reset);
    input D, clock, reset;
    output Q;
    reg Q;

    always @ (posedge clock) begin
        if (reset == 1'b0) Q <= 1'b0;
        else Q <= D;
    end
endmodule

// 32-bit register
module reg32(Q, D, clock, reset);
    input [31:0] D;
    input clock, reset;

    output [31:0] Q;

    genvar j;

    generate
        for (j = 0; j < 32; j = j+1) begin
            dff d(Q[j], D[j], clock, reset);
        end
    endgenerate
endmodule

// 5-to-32 decoder
module decoder5to32(register, regno);
    input [5:0] regno;
    output reg [31:0] register;

    always @ (regno) begin
        case (regno)
            5'd0: register =  32'b00000000000000000000000000000001;
            5'd1: register =  32'b00000000000000000000000000000010;
            5'd2: register =  32'b00000000000000000000000000000100;
            5'd3: register =  32'b00000000000000000000000000001000;
            5'd4: register =  32'b00000000000000000000000000010000;
            5'd5: register =  32'b00000000000000000000000000100000;
            5'd6: register =  32'b00000000000000000000000001000000;
            5'd7: register =  32'b00000000000000000000000010000000;
            5'd8: register =  32'b00000000000000000000000100000000;
            5'd9: register =  32'b00000000000000000000001000000000;
            5'd10: register = 32'b00000000000000000000010000000000;
            5'd11: register = 32'b00000000000000000000100000000000;
            5'd12: register = 32'b00000000000000000001000000000000;
            5'd13: register = 32'b00000000000000000010000000000000;
            5'd14: register = 32'b00000000000000000100000000000000;
            5'd15: register = 32'b00000000000000001000000000000000;
            5'd16: register = 32'b00000000000000010000000000000000;
            5'd17: register = 32'b00000000000000100000000000000000;
            5'd18: register = 32'b00000000000001000000000000000000;
            5'd19: register = 32'b00000000000010000000000000000000;
            5'd20: register = 32'b00000000000100000000000000000000;
            5'd21: register = 32'b00000000001000000000000000000000;
            5'd22: register = 32'b00000000010000000000000000000000;
            5'd23: register = 32'b00000000100000000000000000000000;
            5'd24: register = 32'b00000001000000000000000000000000;
            5'd25: register = 32'b00000010000000000000000000000000;
            5'd26: register = 32'b00000100000000000000000000000000;
            5'd27: register = 32'b00001000000000000000000000000000;
            5'd28: register = 32'b00010000000000000000000000000000;
            5'd29: register = 32'b00100000000000000000000000000000;
            5'd30: register = 32'b01000000000000000000000000000000;
            5'd31: register = 32'b10000000000000000000000000000000;
        endcase
    end
endmodule

module regfile(
    input clock,
    input reset,                // Resets the register selected by WriteReg.
    input RegWrite,             // Control signal. Is 1 if we want to write data into register.
    input [5:0] WriteReg,       // Register address of the register we wanna write into.
    input [31:0] WriteData,     // The data that we wanna write into the register.
    input [5:0] ReadReg1,       // The first register that we wanna read.
    input [5:0] ReadReg2,       // The second register that we wanna read.
    output [31:0] ReadData1,    // Data from the first register read.
    output [31:0] ReadData2     // Data from the second register read.
);
    wire [31:0] decodeout;
    wire [31:0] Q0, Q1, Q2, Q3,
                Q4, Q5, Q6, Q7,
                Q8, Q9, Q10, Q11,
                Q12, Q13, Q14, Q15,
                Q16, Q17, Q18, Q19,
                Q20, Q21, Q22, Q23,
                Q24, Q25, Q26, Q27,
                Q28, Q29, Q30, Q31;

    decoder5to32 d532(decodeout, WriteReg);
    wire act;
    assign act = clock & RegWrite;

    reg32 r0 (Q0,   WriteData,  act & decodeout[0],   reset);
    reg32 r1 (Q1,   WriteData,  act & decodeout[1],   reset);
    reg32 r2 (Q2,   WriteData,  act & decodeout[2],   reset);
    reg32 r3 (Q3,   WriteData,  act & decodeout[3],   reset);
    reg32 r4 (Q4,   WriteData,  act & decodeout[4],   reset);
    reg32 r5 (Q5,   WriteData,  act & decodeout[5],   reset);
    reg32 r6 (Q6,   WriteData,  act & decodeout[6],   reset);
    reg32 r7 (Q7,   WriteData,  act & decodeout[7],   reset);
    reg32 r8 (Q8,   WriteData,  act & decodeout[8],   reset);
    reg32 r9 (Q9,   WriteData,  act & decodeout[9],   reset);
    reg32 r10(Q10,  WriteData,  act & decodeout[10],  reset);
    reg32 r11(Q11,  WriteData,  act & decodeout[11],  reset);
    reg32 r12(Q12,  WriteData,  act & decodeout[12],   reset);
    reg32 r13(Q13,  WriteData,  act & decodeout[13],  reset);
    reg32 r14(Q14,  WriteData,  act & decodeout[14],  reset);
    reg32 r15(Q15,  WriteData,  act & decodeout[15],  reset);
    reg32 r16(Q16,  WriteData,  act & decodeout[16],  reset);
    reg32 r17(Q17,  WriteData,  act & decodeout[17],  reset);
    reg32 r18(Q18,  WriteData,  act & decodeout[18],  reset);
    reg32 r19(Q19,  WriteData,  act & decodeout[19],  reset);
    reg32 r20(Q20,  WriteData,  act & decodeout[20],  reset);
    reg32 r21(Q21,  WriteData,  act & decodeout[21],  reset);
    reg32 r22(Q22,  WriteData,  act & decodeout[22],  reset);
    reg32 r23(Q23,  WriteData,  act & decodeout[23],  reset);
    reg32 r24(Q24,  WriteData,  act & decodeout[24],  reset);
    reg32 r25(Q25,  WriteData,  act & decodeout[25],  reset);
    reg32 r26(Q26,  WriteData,  act & decodeout[26],  reset);
    reg32 r27(Q27,  WriteData,  act & decodeout[27],  reset);
    reg32 r28(Q28,  WriteData,  act & decodeout[28],  reset);
    reg32 r29(Q29,  WriteData,  act & decodeout[29],  reset);
    reg32 r30(Q30,  WriteData,  act & decodeout[30],  reset);
    reg32 r31(Q31,  WriteData,  act & decodeout[31],  reset);

    mux32to1 m1(
        ReadData1,
        Q0,  Q1,  Q2,  Q3,
        Q4,  Q5,  Q6,  Q7,
        Q8,  Q9,  Q10, Q11,
        Q12, Q13, Q14, Q15,
        Q16, Q17, Q18, Q19,
        Q20, Q21, Q22, Q23,
        Q24, Q25, Q26, Q27,
        Q28, Q29, Q30, Q31,
        ReadReg1
    );

    mux32to1 m2(
        ReadData2,
        Q0,  Q1,  Q2,  Q3,
        Q4,  Q5,  Q6,  Q7,
        Q8,  Q9,  Q10, Q11,
        Q12, Q13, Q14, Q15,
        Q16, Q17, Q18, Q19,
        Q20, Q21, Q22, Q23,
        Q24, Q25, Q26, Q27,
        Q28, Q29, Q30, Q31,
        ReadReg2
    );

endmodule