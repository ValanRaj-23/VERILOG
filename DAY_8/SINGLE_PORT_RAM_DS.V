module ram(	input clk, rst, en, wr,
		input[3:0]data_in,
		input[1:0]addr,
		output reg [3:0] data_out);

	reg [3:0] mem [3:0];
  reg [3:0] temp;


always@(posedge clk)
begin
  if(!rst)
    foreach(mem[i])
      mem[i] <= 0;
  else
	if(en && wr)
		mem[addr] <= data_in;
	else if (en && !wr)
		temp <= mem[addr];
end

  assign data_out = en && !wr ? temp : 'bz;
  
endmodule
