module gray_counter (
	input clk ,rst,
	output  [3:0]q 
) ;
reg [3:0] cnt;

always @( posedge clk or posedge rst )
begin
	if(rst)
		cnt <= 0;
	else 
	begin
		if(cnt == 4'hF)
			cnt <= 0;
		else
			cnt <= cnt + 1;
	end
end

assign q = cnt ^ (cnt >> 1);
endmodule



module tb_gray_counter;

  reg clk;
  reg rst;
  wire [3:0] q;

  gray_counter uut (
    .clk(clk),
    .rst(rst),
    .q(q)
  );


  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end


  initial begin

	rst = 1;
	#20;
	rst = 0;

    #1000;
    $finish;
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars();
  end

endmodule

