module count_ones(
		input 		clk,
		input		reset,
		input 		data,
		output reg	out
);

reg [3:0] present, next;

parameter [3:0] IDLE 	= 0,
		D1_A	= 1,
		D1_B	= 2,
		D1_C	= 3,
		D1_D	= 4,
		D0_A	= 5,
                D0_B	= 6,
                D0_C	= 7,
                D0_D	= 8;

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
		
			IDLE : next = (data == 1) ? D1_A : D0_A;
			D1_A : next = (data == 1) ? D1_B : D0_A;	
                        D1_B : next = (data == 1) ? D1_C : D0_A;
                        D1_C : next = (data == 1) ? D1_C : D0_A;
                        D0_A : next = (data == 0) ? D0_B : D1_A;
                        D0_B : next = (data == 0) ? D0_C : D1_A;
		        D0_C : next = (data == 0) ? D0_C : D1_A;
		endcase
	end


assign out = (present == D1_C) || (present == D0_C);

endmodule
