module tff(
	output q,
	input t,
	input clk,
	input reset
);
	reg q;
	initial 
		q <= 1'b0;
	always @(posedge clk) begin
		if(reset)
			q <= 1'b0;
		else
			if( t == 0)
				q <= q;
			else 
				q <= ~q;
	end

endmodule