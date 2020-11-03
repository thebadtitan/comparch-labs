module counter(clock, out);
    input clock;
    output [3:0] out;
    
    wire q0, q1, q2, q3, q01, q012;
    
    jkff j1(1'b1, 1'b1, clock, q0);
    jkff j2(q0, q0, clock, q1);
    and a1(q01, q0, q1);
    jkff j3(q01, q01, clock, q2);
    and a2(q012, q01, q2);
    jkff j4(q012, q012, clock ,q3);


    
    assign out = {q3, q2, q1, q0};
endmodule