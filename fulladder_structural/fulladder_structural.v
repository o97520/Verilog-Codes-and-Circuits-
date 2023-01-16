module fulladder_structural(sum, carry, input1, input2, input3);

  input input1 , input2, input3;
  output sum , carry;

  wire t1, t2, k;
  
  //Structural
  xor g2(sum, input1, input2, input3); 
  xor g1(k, input1, input2);
  and (t1, input1, input2);
  and (t2, k, input3);
  or (carry, t1, t2);

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
  fulladder_structural ha ( .sum(sum), .carry(carry), .input1(input1), .input2(input2), .input3(input3));

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
    $dumpfile("fulladder_structural.vcd");
    $dumpvars(0, fulladder_test);
    $monitor("time=%g,sum =%b,carry =%b,a=%b,b=%b,c=%b", $time, sum, carry, input1, input2, input3);
  end
  initial #10 $finish; 

endmodule