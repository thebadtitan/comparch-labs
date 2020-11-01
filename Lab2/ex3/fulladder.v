module fulladder(s, c, a1, a2, cin);
    input a1, a2, cin;
    output s, c;
    reg s, c;

    always @ (a1 or a2 or cin)
        begin
            s = (~a1 & ~a2 & cin) | (~a1 & a2 & ~cin) | (a1 & ~a2 & ~cin) | (a1 & a2 & cin);
            c = (~a1 & a2 & cin) | (a1 & ~a2 & cin) | (a1 & a2 & ~cin) | (a1 & a2 & cin); 
        end
endmodule