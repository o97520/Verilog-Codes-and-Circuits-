module multiplexer_2to1_ifelse(out, input1, select);


output reg out;
input [1:0]input1;
input select;


always @(*)
  if (select == 1'b1) begin
    out = input1[1];
  
  end else begin
    out = input1[0];
  
  end

endmodule


module multiplexer_2to1_ifelse_test;

  //inputs
  reg [1:0]input1;
  reg select;

  //outputs
  wire out;

  //instantiat unit under test
  multiplexer_2to1_ifelse mp(.out(out), .input1(input1), .select(select));

  initial begin
  
    input1 = 2'b00;  select = 1'b0;
  
  end

    always #1 input1 = input1 + 1;

    always #2  select = select + 1;

  initial begin
    $dumpfile("multiplexer_2to1_ifelse.vcd");
    $dumpvars(0, multiplexer_2to1_ifelse_test);
    $monitor("time=%g,out =%b,a=%b,b=%b", $time, out, input1, select);
  end
  initial #20 $finish; 


endmodule