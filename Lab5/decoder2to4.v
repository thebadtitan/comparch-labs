module decoder2to4(register, regno);
    input [1:0] regno;
    output [3:0] register;

    assign register[0] = ~regno[1] & ~regno[0];
    assign register[1] = ~regno[1] &  regno[0];
    assign register[2] =  regno[1] & ~regno[0];
    assign register[3] =  regno[1] &  regno[0];
endmodule