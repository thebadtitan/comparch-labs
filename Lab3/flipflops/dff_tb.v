module dff_tb;
    reg d, clk, rst;
    wire q;

    // dff_sync dff(d, rst, clk, q);
    dff_async dff(d, rst, clk, q);

    always @ (posedge clk)
        begin
            $display("d=%b | clk=%b | rst=%b | q=%b", d, clk, rst, q);
        end
    
    initial
        begin
            forever
                begin
                    clk = 0;
                    #5
                    clk = 1;
                    #5
                    clk = 0;
                end
        end

    initial
        begin
            d = 0; rst = 1;
            #4
            d = 1; rst = 0;
            #50
            d = 1; rst = 1;
            #20;
            d = 1; rst = 0;
            #10
            $finish;
        end

    initial
        begin
            $dumpfile("dff_test.vcd");
            $dumpvars(0, dff_tb);
        end
endmodule