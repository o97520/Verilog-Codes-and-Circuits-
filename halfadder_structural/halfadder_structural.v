module halfadder(sum,carry,a,b);

input a,b;
output sum,carry;

//Structural
xor (sum,a,b);
and (carry,a,b);

endmodule


module halfadder_test;

//inputs
reg a;
reg b;

//outputs
wire sum;
wire carry;

//instantiat unit under test
halfadder ha ( .sum(sum), .carry(carry), .a(a), .b(b));

initial begin
  a = 1'b0;
  b = 1'b0;
  #2 a = 1'b0; b= 1'b1;
  #2 a = 1'b1; b= 1'b0;
  #2 a = 1'b1; b= 1'b1;
end

initial begin
  $dumpfile("a.vcd");
  $dumpvars(0, halfadder_test);
  $monitor("time=%g,s=%b,c=%b,a=%b,b=%b", $time, sum,carry,a,b);
end
initial #10 $finish; 



endmodule