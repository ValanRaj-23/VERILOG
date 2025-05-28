module count_ones;
reg 	clk;
reg 	reset;
reg 	data;
wire 	out;
integer i;


one_in_three uut( clk, reset, data, out);


always #5 clk = ~clk;
reg [31:0] sample = 16'b0100_0100_0001_0100;
initial begin
	clk 	= 0;
	reset 	= 0;
	#10;
	reset 	= 1;
end

initial begin
	for(i = 0; i < 32; i= i+1)
	begin
		#10;
		data = sample[i];
	end	
end

initial begin
	$dumpfile("dump.vcd");
	$dumpvars;
	#1000;
	$finish;
end

endmodule


