module demultiplexer_1to2(out, input1, select);


output [1:0]out;

input input1, select;

assign out[0] = ~(select) & input1;
assign out[1] = (select) & input1;

endmodule


module demultiplexer_1to2_test;

  //inputs
  reg input1;
  reg select;

  //outputs
  wire [1:0]out;

  //instantiat unit under test
  demultiplexer_1to2 mp(.out(out), .input1(input1), .select(select));

  initial begin
  
    select = 1'b0;
    input1 = 1'b1;  
  
  end

    always #2  select = select + 1'b1;
    always #1  input1 = input1 + 1'b1;


  initial begin
    $dumpfile("demultiplexer_1to2.vcd");
    $dumpvars(0, demultiplexer_1to2_test);
    $monitor("time = %g, out = %b, input1 = %b, select = %b", $time, out, input1, select);
  end
  initial #10 $finish; 


endmodule