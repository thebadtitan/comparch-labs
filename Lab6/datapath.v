module datapath(
    input [31:0] startpc;
);
    reg clock;
    
    // Initializing Main Controller
    MCU

    // Initializing Program counter
    reg [31:0] pc;
    wire [31:0] nextpc;
    assign nextpc = pc + 32'd4;

    // Initializing instruction memory
    wire [31:0] instruction;
    memory instructions(clock, 1'b0, 32'd0, pc, instruction);

    // Doing stuff to determine what the next PC should be (branching and stuff)
    wire [31:0] sign_extended_branch;
    signextender se1(instruction[15:0], sign_extended_branch);
    wire [31:0] partial_branch_target;
    shifter sh1(sign_extended_branch, partial_branch_target);
    wire [31:0] branch_target1;
    assign branch_target1 = nextpc + partial_branch_target;

    wire [31:0] newpc1;
    mux2to1 m1(newpc1, nextpc, branch_target1, /* TODO CONTROL SIGNAL */);

    wire [31:0] newpc2;
    wire [27:0] partial_branch_target2;
    shifter#(2, 28) sh2(instruction[25:0], partial_branch_target2);
    assign newpc2 = {instruction[31:28], partial_branch_target2};

    wire [31:0] finalpc;
    mux2to1 m2(finalpc, newpc1, newpc2, /* TODO CONTROL SIGNAL */);


    wire [4:0] writedst;
    mux2to1 m3(writedst, instruction[20:16], instruction[15:11], /* TODO CONTROL SIGNAL RegDst */)


    // Initializing the register file
    wire [31:0] reg1data, reg2data, RegWriteData;
    regfile rfile(
        clock,
        1'b1,
        /*RegWrite*/,
        writedst,
        RegWriteData,
        instruction[25:21],
        instruction[20:16],
        reg1data,
        reg2data
    );


    // Initializing the ALU
    wire [31:0] alu1, alu2, aluout;
    wire carryout, zero;
    assign alu1 = reg1data;

    mux2to1 m4(alu2, reg2data, sign_extended_branch, /* TODO CONTROL SIGNAL ALUSrc */);
    ALU A1(alu1, alu2, /*CONTROL SIGNAL*/, /*CONTROL SIGNAL*/, aluout, carryout);
    assign zero = (aluout == 32'd0 && carryout == 1'b0) ? 1'b1 : 1'b0;


    // Initializing Data Memory
    wire [31:0] memoryread;
    memory data(clock, /*CONTROL SIGNAL*/, reg2data, aluout, memoryread);
    mux2to1 m5(RegWriteData, aluout, memoryread, /*CONTROL SIGNAL*/);



    
endmodule