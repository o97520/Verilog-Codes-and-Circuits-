
module fourbit_subtractor(Diff, Borr, input1, input2, input3);

output [3:0] Diff;
output Borr;
input [3:0] input1, input2;
wire [2:0] carrybetween;
input input3;

fulladder_behavioral fs1 (.sumfa(Diff[0]), .carryfa(carrybetween[0]), .input1fa(input1[0]), .input2fa(~input2[0]), .input3fa(1'b1));
fulladder_behavioral fs2 (.sumfa(Diff[1]), .carryfa(carrybetween[1]), .input1fa(input1[1]), .input2fa(~input2[1]), .input3fa(carrybetween[0]));
fulladder_behavioral fs3 (.sumfa(Diff[2]), .carryfa(carrybetween[2]), .input1fa(input1[2]), .input2fa(~input2[2]), .input3fa(carrybetween[1]));
fulladder_behavioral fs4 (.sumfa(Diff[3]), .carryfa(Borr), .input1fa(input1[3]), .input2fa(~input2[3]), .input3fa(carrybetween[2]));


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


module fourbit_subtractor_test;

  //inputs
  reg [3:0]input1;
  reg [3:0]input2;
  reg input3;

  //outputs
  wire [3:0]Diff;
  wire Borr;

  //instantiat unit under test
  fourbit_subtractor ha ( .Diff(Diff), .Borr(Borr), .input1(input1), .input2(input2), .input3(input3));

  initial begin
    input1 = 4'b0000;
    input2 = 4'b0000;
    input3 = 0;
  end
  
  always #1 input2 = input2 + 1'b1;
  always #2 input1 = input1 + 1'b1;

  initial begin
    $dumpfile("fourbit_subtractor.vcd");
    $dumpvars(0, fourbit_subtractor_test);
    $monitor("time=%g,Diff =%b,Borr =%b,a=%b,b=%b,c=%b", $time, Diff, Borr, input1, input2, input3);
  end
  initial #100 $finish; 

endmodule