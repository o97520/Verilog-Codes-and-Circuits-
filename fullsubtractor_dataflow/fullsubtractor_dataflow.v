module fullsubtractor_dataflow(output Diff, Borr, input input1, input2, InBorr);
 
  //Dataflow
  assign Diff = input1 ^ input2 ^ InBorr;
  assign Borr = ((~input1) & input2 ) | (~(input1 ^ input2 ) & InBorr);

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
  fullsubtractor_dataflow ha ( .Diff(Diff), .Borr(Borr), .input1(input1), .input2(input2), .InBorr(InBorr));

  initial begin

    {input1, input2, InBorr} = 0;
  end
  
  always #4 input1 = input1 + 1'b1;
  always #2 input2 = input2 + 1'b1;
  always #1 InBorr = InBorr + 1'b1;

  initial begin
    $dumpfile("fullsubtractor_dataflow.vcd");
    $dumpvars(0, fullsubtractor_test);
    $monitor("time=%g,Diff =%b,Borr =%b, input1=%b, input2=%b, InBorra=%b", $time, Diff, Borr, input1, input2, InBorr);
  end
  
  initial #20 $finish; 

endmodule