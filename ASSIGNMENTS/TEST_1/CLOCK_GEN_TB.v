module clock_generator_tb;

reg clk;
reg reset;
wire out_clk;

always #5 clk = ~clk;

clock_gen clk_gen(
			.clk		(clk	),					
                        .reset		(reset	),
                        .out_clk 	(out_clk)
			);

initial begin
	clk = 0;
	
	#100;
	reset = 0;
	#100;
	reset = 1;
end

initial begin
	$dumpfile("dump.vcd");
	$dumpvars;
	#1000000000;
	$finish;
end

endmodule
