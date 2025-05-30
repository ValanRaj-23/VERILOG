module pattern_triangle;
int i, j;
  
  initial begin
    for(i = 0; i <= 5; i = i+1)
      begin
      for(j = 1; j <= i ; j =j+1)
        $write("%0d", i);
      $display("");
      end
  end
endmodule

// 1
// 22
// 333
// 4444
// 55555
