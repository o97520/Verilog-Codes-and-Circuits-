module fullsubtractor_structural(output Diff, Borr, input input1, input2, InBorr);
 
  //Structural
  wire Ninput1, Nv1, v1, v2, v3;
  xor g1(v1, input1, input2); 

  not (Ninput1, input1);
  and (v2, Ninput1, input2);

  not (Nv1, v1);
  and (v3, Nv1, InBorr);

  xor g2(Diff, v1, InBorr); 
  or (Borr, v3, v2);

endmodule


module fullsubtractor_test;

  //inputs
  reg input1;
  reg input2;
  reg InBorr;

  //outputs
  wire Diff;
  wire Borr;

  //instantiat unit under test
  fullsubtractor_structural ha ( .Diff(Diff), .Borr(Borr), .input1(input1), .input2(input2), .InBorr(InBorr));

  initial begin

    {input1, input2, InBorr} = 0;
  end
  
  always #4 input1 = input1 + 1'b1;
  always #2 input2 = input2 + 1'b1;
  always #1 InBorr = InBorr + 1'b1;

  initial begin
    $dumpfile("fullsubtractor_structural.vcd");
    $dumpvars(0, fullsubtractor_test);
    $monitor("time=%g,Diff =%b,Borr =%b, input1=%b, input2=%b, InBorra=%b", $time, Diff, Borr, input1, input2, InBorr);
  end
  
  initial #20 $finish; 

endmodule