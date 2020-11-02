module stringmatch(clock, reset, in, out);
    input clock, reset, in;
    output out;

    reg out;
    reg [3:0] state;

    always @ (posedge clock or posedge reset) begin
        if (reset) begin
            state <= 3'd0;
            out <= 0;
        end

        else begin
            case (state)

                3'd0: begin
                    if (in) begin
                        state <= 3'd1;
                        out <= 0;
                    end
                    else begin
                        state <= 3'd0;
                        out <= 0;
                    end
                end

                3'd1: begin
                    if (in) begin
                        state <= 3'd1;
                        out <= 0;
                    end
                    else begin
                        state <= 3'd2;
                        out <= 0;
                    end
                end

                3'd2: begin
                    if (in) begin
                        state <= 3'd3;
                        out <= 0;
                    end
                    else begin
                        state <= 3'd0;
                        out <= 0;
                    end
                end

                3'd3: begin
                    if (in) begin
                        state <= 3'd4;
                        out <= 0;
                    end
                    else begin
                        state <= 3'd2;
                        out <= 0;
                    end
                end

                3'd4: begin
                    if (in) begin
                        state <= 3'd1;
                        out <= 0;
                    end
                    else begin
                        state <= 3'd5;
                        out <= 1;
                    end
                end

                3'd5: begin
                    if (in) begin
                        state <= 3'd3;
                        out <= 0;
                    end
                    else begin
                        state <= 3'd0;
                        out <= 0;
                    end
                end
            endcase
        end
    end
endmodule
