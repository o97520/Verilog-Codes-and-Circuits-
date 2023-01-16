
module sixteenbit_adder(sum, carry, input1, input2, input3);

output [15:0] sum;
output carry;
wire [14:0]carrybetween;
input [15:0] input1, input2;
input input3;

fulladder_behavioral fa0 (.sumfa(sum[0]), .carryfa(carrybetween[0]), .input1fa(input1[0]), .input2fa(input2[0]), .input3fa(input3));
fulladder_behavioral fa1 (.sumfa(sum[1]), .carryfa(carrybetween[1]),   .input1fa(input1[1]),  .input2fa(input2[1]),   .input3fa(carrybetween[0]));
fulladder_behavioral fa2 (.sumfa(sum[2]), .carryfa(carrybetween[2]),   .input1fa(input1[2]),  .input2fa(input2[2]),   .input3fa(carrybetween[1]));
fulladder_behavioral fa3 (.sumfa(sum[3]), .carryfa(carrybetween[3]),   .input1fa(input1[3]),  .input2fa(input2[3]),   .input3fa(carrybetween[2]));
fulladder_behavioral fa4 (.sumfa(sum[4]), .carryfa(carrybetween[4]),   .input1fa(input1[4]),  .input2fa(input2[4]),   .input3fa(carrybetween[3]));
fulladder_behavioral fa5 (.sumfa(sum[5]), .carryfa(carrybetween[5]),   .input1fa(input1[5]),  .input2fa(input2[5]),   .input3fa(carrybetween[4]));
fulladder_behavioral fa6 (.sumfa(sum[6]), .carryfa(carrybetween[6]),   .input1fa(input1[6]),  .input2fa(input2[6]),   .input3fa(carrybetween[5]));
fulladder_behavioral fa7 (.sumfa(sum[7]), .carryfa(carrybetween[7]),   .input1fa(input1[7]),  .input2fa(input2[7]),   .input3fa(carrybetween[6]));
fulladder_behavioral fa8 (.sumfa(sum[8]), .carryfa(carrybetween[8]),   .input1fa(input1[8]),  .input2fa(input2[8]),   .input3fa(carrybetween[7]));
fulladder_behavioral fa9 (.sumfa(sum[9]), .carryfa(carrybetween[9]),   .input1fa(input1[9]),  .input2fa(input2[9]),   .input3fa(carrybetween[8]));
fulladder_behavioral fa10 (.sumfa(sum[10]),.carryfa(carrybetween[10]),  .input1fa(input1[10]), .input2fa(input2[10]),  .input3fa(carrybetween[9]));
fulladder_behavioral fa11 (.sumfa(sum[11]), .carryfa(carrybetween[11]), .input1fa(input1[11]), .input2fa(input2[11]),  .input3fa(carrybetween[10]));
fulladder_behavioral fa12 (.sumfa(sum[12]), .carryfa(carrybetween[12]), .input1fa(input1[12]), .input2fa(input2[12]),  .input3fa(carrybetween[11]));
fulladder_behavioral fa13 (.sumfa(sum[13]), .carryfa(carrybetween[13]), .input1fa(input1[13]), .input2fa(input2[13]),  .input3fa(carrybetween[12]));
fulladder_behavioral fa14 (.sumfa(sum[14]), .carryfa(carrybetween[14]), .input1fa(input1[14]), .input2fa(input2[14]),  .input3fa(carrybetween[13]));
fulladder_behavioral fa15 (.sumfa(sum[15]), .carryfa(carry), .input1fa(input1[15]), .input2fa(input2[15]), .input3fa(carrybetween[14]));


endmodule


module fulladder_behavioral(sumfa, carryfa, input1fa, input2fa, input3fa);

  input input1fa , input2fa, input3fa;
  output reg sumfa , carryfa;

  //Behavioral

  always @(*)
    begin
      sumfa = input1fa  ^ input2fa ^ input3fa;
      carryfa = (input1fa & input2fa) | (input2fa & input3fa) | (input1fa & input3fa);
    end

endmodule


module sixteenbit_adder_test;

  //inputs
  reg [15:0]input1;
  reg [15:0]input2;
  reg input3;

  //outputs
  wire [15:0]sum;
  wire carry;

  //instantiat unit under test
  sixteenbit_adder ha ( .sum(sum), .carry(carry), .input1(input1), .input2(input2), .input3(input3));

  initial begin
    input1 = 16'b0000000000000000;
    input2 = 16'b0000000000000000;
    input3 = 0;
  end
  
  always #2 input1 = input1 + 1'b1;
  always #1 input2 = input2 + 1'b1;

  initial begin
    $dumpfile("sixteenbit_adder.vcd");
    $dumpvars(0, sixteenbit_adder_test);
    $monitor("time=%g,sum =%b,carry =%b,a=%b,b=%b,c=%b", $time, sum, carry, input1, input2, input3);
  end
  initial #1000 $finish; 

endmodule