module MUX_8x1(
	output O,
	input [7:0] E,
	input [2:0] Q
);

	assign O = Q[2] ? 
					(Q[1] ? 
						( (Q[0] ? (E[7]) : (E[6]) ) ) 
					:   ( (Q[0] ? (E[5]) : (E[4]) )) ) 
				  : (Q[1] ? 
						( (Q[0] ? (E[3]) : (E[2]) )) 
					:   ( (Q[0] ? (E[1]) : (E[0]) )));

endmodule