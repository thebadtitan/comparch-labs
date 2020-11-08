module ALUControl(operation, ALUOp1, ALUOp2, funct);
    input ALUOp1, ALUOp2;
    input [5:0] funct;

    output [2:0] operation;

    assign operation[0] = (
        (ALUOp1 & (~funct[3]) & funct[2] & (~funct[1]) & funct[0]) | 
        (ALUOp1 & funct[3] & (~funct[2]) & funct[1] & (~funct[0]))
    );

    assign operation[1] = ~(
        (ALUOp1 & (~funct[3]) & funct[2] & (~funct[1]) & (~funct[0])) |
        (ALUOp1 & (~funct[3]) & funct[2] & (~funct[1]) & funct[0])
    );

    assign operation[2] = (
        ((~ALUOp1) & ALUOp2) |
        (ALUOp1 & (~funct[3]) & (~funct[2]) & funct[1] & (~funct[0])) |
        (ALUOp1 & funct[3] & (~funct[2]) & funct[1] & (~funct[0]))
    );
endmodule