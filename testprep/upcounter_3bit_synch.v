module COUNTER_3BIT(
	output [2:0] Q,
	input CLEAR,
	input CLK
);

	reg [2:0] Q;
	
	initial 
		Q = 3'b0;
	
	always @(posedge CLK) begin
		Q <= Q + 1;
	end
	
	always @(CLEAR)
		if(CLEAR) 
			Q <= 3'b0;
	
	

endmodule