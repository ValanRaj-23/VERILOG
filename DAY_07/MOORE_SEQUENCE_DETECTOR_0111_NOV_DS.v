module moore_0111_nov(input clk, rst, din,
		output reg dout);

reg [2:0]p_state, n_state;

 parameter s0 = 3'b00;
 parameter s1 = 3'b01;
 parameter s2 = 3'b10;
 parameter s3 = 3'b11;
 parameter s4 = 3'b100;

 always @(posedge clk or negedge rst)
 begin
	 if(rst)
		 p_state <= s0;
	 else 
		 p_state <= n_state;
 end
	 
 always@(p_state or din)begin
	case(p_state)
		s0 : begin
			dout <= 0;
			if(din == 0)
				n_state <= s1;
			else
				n_state <= s0;
		end
		s1 : begin
			dout <= 0;
			if(din == 0)
				n_state <= s1;
			else
				n_state <= s2;
		end
		s2 : begin
			dout <= 0;
			if(din == 0)
				n_state <= s1;
			else
				n_state <= s3;
		end
		s3 : begin
			dout <= 0;
			if(din == 0)
				n_state <= s1;
			else
				n_state <= s4;
		end
		s4 : begin
			dout <= 1;
			if(din == 0)
				n_state <= s1;
			else
				n_state <= s0;
		end

	endcase
end

endmodule
