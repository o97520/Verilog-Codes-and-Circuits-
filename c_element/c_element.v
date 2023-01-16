`timescale 1ns/1ps

module c_element (out, input1, input2);

output out;

input input1, input2;

  
assign out = (input1 & input2) | (input2 & out) | (input1 & out) ;

endmodule


module c_element_test;

  //inputs
  reg input1, input2;

  //outputs
  wire out;

  //instantiat unit under test
  c_element enc(.out(out), .input1(input1), .input2(input2));

  initial begin
     input1 = 1'b1; input2 = 1'b0;
     
    end
initial begin
  
#1 input1 = 1'b0;
 #1  input2 = 1'b1;
#1 input1 = 1'b1;
 #1  input2 = 1'b1;
#1 input1 = 1'b0;
 #1  input2 = 1'b1;
#1 input1 = 1'b1;
 #1  input2 = 1'b0;
#1 input1 = 1'b1;
 #1  input2 = 1'b1;
#1 input1 = 1'b0;
 #1  input2 = 1'b1;
#1 input1 = 1'b0;
 #1  input2 = 1'b0;
#1 input1 = 1'b1;
 #1  input2 = 1'b0;
#1  input1 = 1'b0; 
#1  input2 = 1'b1;
#1  input1 = 1'b1; 
#1  input2 = 1'b0;
#1  input1 = 1'b0; 
#1  input2 = 1'b0;
#1  input1 = 1'b0; 
#1  input2 = 1'b0;
#1  input1 = 1'b0; 
#1  input2 = 1'b1;
#1  input1 = 1'b0; 
#1  input2 = 1'b1;
#1  input1 = 1'b1; 
#1  input2 = 1'b0;
#1  input1 = 1'b0; 
#1  input2 = 1'b0;
#1  input1 = 1'b0; 
#1  input2 = 1'b0;
#1  input1 = 1'b0; 
#1  input2 = 1'b1;
#1  input1 = 1'b0; 
#1  input2 = 1'b0;
#1  input1 = 1'b1; 
#1  input2 = 1'b1;
#1  input1 = 1'b1; 
#1  input2 = 1'b0;
#1  input1 = 1'b0; 
#1  input2 = 1'b1;
#1  input1 = 1'b1; 
#1  input2 = 1'b1;
#1  input1 = 1'b0; 
#1  input2 = 1'b1;
#1  input1 = 1'b0; 
#1  input2 = 1'b1;
#1  input1 = 1'b0; 
#1  input2 = 1'b1;
#1  input1 = 1'b1; 
#1  input2 = 1'b1;
#1  input1 = 1'b1; 
#1  input2 = 1'b1;
#1  input1 = 1'b1; 
#1  input2 = 1'b0;
end

  initial begin
    $dumpfile("c_element.vcd");
    $dumpvars(0, c_element_test);
    $monitor("time = %g, out = %b, input1 = %b, input2 = %b", $time, out, input1, input2);
  end
  initial #70 $finish; 


endmodule