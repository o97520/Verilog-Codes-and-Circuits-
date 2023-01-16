module halfadder_behavioral(sum,carry,input1,input2);

  input input1 , input2;
  output reg sum , carry;


  //Behavioral
  always @(*)
    begin
      sum =  input1 ^ input2;
      carry =  input1 & input2;
    end

endmodule


module halfadder_test;

  //inputs
  reg input1;
  reg input2;

  //outputs
  wire sum;
  wire carry;

  //instantiat unit under test
  halfadder_behavioral ha ( .sum(sum), .carry(carry), .input1(input1), .input2(input2));

  initial begin
    input1 = 1'b0;
    input2 = 1'b0;
    #2 input1 = 1'b0; input2 = 1'b1;
    #2 input1 = 1'b1; input2 = 1'b0;
    #2 input1 = 1'b1; input2 = 1'b1;
  end

  initial begin
    $dumpfile("halfadder_behavioral.vcd");
    $dumpvars(0, halfadder_test);
    $monitor("time=%g,s=%b,c=%b,a=%b,b=%b", $time, sum,carry,input1,input2);
  end
  initial #10 $finish; 

endmodule