module fulladder_dataflow(sum, carry, input1, input2, input3);

  input input1 , input2, input3;
  output sum , carry;

  //Dataflow
  assign  sum = input1  ^ input2 ^ input3;
  assign  carry = (input1 & input2) | (input2 & input3) | (input1 & input3);

endmodule

module fulladder_test;

  //inputs
  reg input1;
  reg input2;
  reg input3;

  //outputs
  wire sum;
  wire carry;

  //instantiat unit under test
  fulladder_dataflow ha ( .sum(sum), .carry(carry), .input1(input1), .input2(input2), .input3(input3));

  initial begin

    {input1, input2, input3} = 3'b000;
    #2 {input1, input2, input3} = 3'b001;
    #2 {input1, input2, input3} = 3'b010;
    #2 {input1, input2, input3} = 3'b011;
    #2 {input1, input2, input3} = 3'b100;
    #2 {input1, input2, input3} = 3'b101;
    #2 {input1, input2, input3} = 3'b110;
    #2 {input1, input2, input3} = 3'b111;

  end

  initial begin
    $dumpfile("fulladder_dataflow.vcd");
    $dumpvars(0, fulladder_test);
    $monitor("time=%g,sum =%b,carry =%b,a=%b,b=%b,c=%b", $time, sum, carry, input1, input2, input3);
  end
  initial #10 $finish; 

endmodule