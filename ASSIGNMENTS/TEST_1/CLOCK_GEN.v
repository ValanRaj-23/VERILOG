module clock_gen(
		input 	clk,
		input 	reset,
		output reg 	out_clk
);
reg clk_counter = 0;

always@(posedge clk)
begin
	if(!reset)
		out_clk <= 0;
	else
	begin
		if(clk_counter == 49999)
          begin
			out_clk 	<= ~out_clk;
			clk_counter 	<= 0;
          end
		else
			clk_counter 	<= clk_counter + 1;
	end
end
endmodule
