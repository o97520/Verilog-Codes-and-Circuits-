module multiplexer_2to1_ternary(out, input1, select);


output out;
input [1:0]input1;
input select;

assign out = select? input1[1] : input1[0];


endmodule


module multiplexer_2to1_ternary_test;

  //inputs
  reg [1:0]input1;
  reg select;

  //outputs
  wire out;

  //instantiat unit under test
  multiplexer_2to1_ternary mp(.out(out), .input1(input1), .select(select));

  initial begin
    input1 = 2'b00;  select = 1'b0;
  end

    always #1 input1 = input1 + 1;

    always #2  select = select + 1;

  initial begin
    $dumpfile("multiplexer_2to1_ternary.vcd");
    $dumpvars(0, multiplexer_2to1_ternary_test);
    $monitor("time=%g,out =%b,a=%b,b=%b", $time, out, input1, select);
  end
  initial #20 $finish; 


endmodule