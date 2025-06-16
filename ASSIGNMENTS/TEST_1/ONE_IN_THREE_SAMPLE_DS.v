module one_in_three(
		input 		clk,
		input		reset,
		input 		data,
		output 		out
);

reg [3:0] present, next;

parameter [3:0] IDLE 	= 0,
		S1_A	= 1,
		S1_B	= 2,
		S1_C	= 3;


	always@(posedge clk or negedge reset)
	begin
		if(!reset)
			present <= IDLE;
		else
			present <= next;
	end

	always@(*)
	begin
		case(present)		
			IDLE 	: next = (data == 0) ? IDLE : S1_A;
			S1_A 	: next = (data == 0) ? S1_B : S1_A;	
                        S1_B 	: next = (data == 0) ? S1_C : S1_A;
                        S1_C 	: next = (data == 0) ? IDLE : S1_A;
			default : next = IDLE; 
		endcase
	end


assign out = (present == S1_A) || (present == S1_B) || (present == S1_C);

endmodule

