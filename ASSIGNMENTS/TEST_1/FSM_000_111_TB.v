 module ones_tb;
reg 	clk;
reg 	reset;
reg 	data;
wire 	out;

count_ones uut( clk, reset, data, out);


always #5 clk = ~clk;
reg [31:0] sample = 16'b0000_0100_1001_1100;
initial begin
	clk 	= 0;
	reset 	= 0;
	#10;
	reset 	= 1;
end

initial begin
	for(integer i = 0; i < 32; i++)
	begin
		#10;
		data = sample[i];
	end	
end

initial begin
	$dumpfile("dump.vcd");
	$dumpvars;
end

endmodule

