module DECODER(
	
	output [7:0] B,
	input EN,
	input [2:0] A
	
);
	reg [7:0] B;
	always @(A) begin
		if(EN) begin
			case(A) 
				
				3'd0 : B = 8'b0000_0001;
				3'd1 : B = 8'b0000_0010;
				3'd2 : B = 8'b0000_0100;
				3'd3 : B = 8'b0000_1000;
				
				3'd4 : B = 8'b0001_0000;
				3'd5 : B = 8'b0010_0000;
				3'd6 : B = 8'b0100_0000;
				3'd7 : B = 8'b1000_0000;
			
			endcase
		end
	end


endmodule