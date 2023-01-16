module halfsubtractor_structural(Diff, Borr, input1, input2);

  input input1, input2;
  output Diff, Borr;
  wire Ninput1;
  //Structural
  xor g1(Diff, input1, input2); 
  not (Ninput1, input1);
  and (Borr, Ninput1, input2);

endmodule

module halfsubtractor_test;

  //inputs
  reg input1;
  reg input2;

  //outputs
  wire Diff;
  wire Borr;

  //instantiat unit under test
  halfsubtractor_structural ha ( .Diff(sum), .Borr(carry), .input1(input1), .input2(input2));

  initial begin

    {input1, input2} = 1'b0;
    #2 input1 = 1'b0 ; input2 = 1'b1;
    #2 input1 = 1'b1 ; input2 = 1'b0;
    #2 {input1, input2} = 1'b1;
  
  end

  initial begin
    $dumpfile("halfsubtractor_structural.vcd");
    $dumpvars(0, halfsubtractor_test);
    $monitor("time=%g, Diff=%b, Borr=%b, input1=%b, input1=%b", $time, Diff, Borr, input1, input2);
  end
  initial #10 $finish; 

endmodule