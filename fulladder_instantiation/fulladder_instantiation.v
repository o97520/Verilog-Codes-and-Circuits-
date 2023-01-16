module fulladder_instantiation(sum, carry, input1, input2, input3);

  input input1 , input2, input3;
  output sum, carry;

  wire sum1, carry2;

  halfadder_dataflow ha1 ( .sumha(sum1), .carryha(carry1), .input1ha(input1), .input2ha(input2));
  halfadder_dataflow ha2 ( .sumha(sum), .carryha(carry2), .input1ha(sum1), .input2ha(input3));
  or (carry, carry2, carry1);

endmodule







module halfadder_dataflow(sumha,carryha,input1ha,input2ha);
  input input1ha , input2ha;
  output sumha , carryha;
  //Dataflow
  assign sumha =  input1ha ^ input2ha;
  assign carryha =  input1ha & input2ha;
endmodule



module fulladder_instantiation_test;

  //inputs
  reg input1;
  reg input2;
  reg input3;

  //outputs
  wire sum;
  wire carry;

  //instantiat unit under test
  fulladder_instantiation ha ( .sum(sum), .carry(carry), .input1(input1), .input2(input2), .input3(input3));

  initial begin

    input1 =1'b1;
    input2 =1'b0;
    input3 = 1'b1;
  
  end
  
  always #2 input1 = input1 + 1'b1;
  always #3 input2 = input2 + 1'b1;
  always #4 input3 = input3 + 1'b1;

  initial begin
    $dumpfile("fulladder_instantiation.vcd");
    $dumpvars(0, fulladder_instantiation_test);
    $monitor("time=%g,sum =%b,carry =%b,a=%b,b=%b,c=%b", $time, sum, carry, input1, input2, input3);
  end
  initial #100 $finish; 

endmodule