module right_aligned_triangle;
int i, j, k;
  
  initial begin
    for(i = 1; i <= 5; i= i+1)
      begin
        for(j = 5; j >= i; j = j - 1)
            $write(" ");
      			for(k = 1; k <= i ; k = k + 1)
                  $write("&");
            $display("");
      end
  end
endmodule


//      *
//     **
//    ***
//   ****
//  *****
