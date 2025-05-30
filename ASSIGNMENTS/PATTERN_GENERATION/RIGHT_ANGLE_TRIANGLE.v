module pattern_triangle;
int i, j;
  
  initial begin
    for(i = 0; i <= 5; i++)
      begin
      for(j = 1; j <= i ; j++)
        $write("*");
        $display("");
      end
  end
endmodule

// *
// **
// ***
// ****
// *****  
