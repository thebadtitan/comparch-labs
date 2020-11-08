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
    input [4:0] regno;
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
    input [4:0] WriteReg,       // Register address of the register we wanna write into.
    input [31:0] WriteData,     // The data that we wanna write into the register.
    input [5:0] ReadReg1,       // The first register that we wanna read.
    input [5:0] ReadReg2,       // The second register that we wanna read.
    output [31:0] ReadData1,    // Data from the first register read.
    output [31:0] ReadData2     // Data from the second register read.
);

    wire [31:0] decodeout;
    decoder5to32 d532(decodeout, WriteReg);

    wire act;
    assign act = clock & RegWrite;

    wire [31:0] file[31:0];

    genvar j;
    generate
        for (j = 0; j < 32; j = j+1) begin
            reg32 r(file[j], WriteData, act & decodeout[j], reset);
        end
    endgenerate

    mux32to1 m1(
        ReadData1,
        file[0],  file[1],  file[2],  file[3],
        file[4],  file[5],  file[6],  file[7],
        file[8],  file[9],  file[10], file[11],
        file[12], file[13], file[14], file[15],
        file[16], file[17], file[18], file[19],
        file[20], file[21], file[22], file[23],
        file[24], file[25], file[26], file[27],
        file[28], file[29], file[30], file[31],
        ReadReg1
    );

    mux32to1 m2(
        ReadData2,
        file[0],  file[1],  file[2],  file[3],
        file[4],  file[5],  file[6],  file[7],
        file[8],  file[9],  file[10], file[11],
        file[12], file[13], file[14], file[15],
        file[16], file[17], file[18], file[19],
        file[20], file[21], file[22], file[23],
        file[24], file[25], file[26], file[27],
        file[28], file[29], file[30], file[31],
        ReadReg2
    );

endmodule