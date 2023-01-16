`timescale 1ns/1ps

module d_latch (Q, Qbar, Clock, input1);

output Q, Qbar;

input Clock, input1;

  
assign Q = ~((Clock & ~input1) | Qbar ) ;
assign Qbar= ~((Clock & input1) | Q ) ;

endmodule


module d_latch_test;

  //inputs
  reg Clock, input1;


  //outputs
  wire Q, Qbar;

  //instantiat unit under test
  d_latch enc(.Q(Q), .Qbar(Qbar), .Clock(Clock), .input1(input1));

  initial begin
     input1 = 1'b1;
     Clock = 1'b1;
     end
  always #6 Clock = Clock + 1'b1;
  initial begin
    

  #1  input1 = 1'b0;
  #1  input1 = 1'b1;
  #1  input1 = 1'b0;
  #1  input1 = 1'b1;
  #1  input1 = 1'b1;
  #1  input1 = 1'b0;
  #1  input1 = 1'b0;
  #1  input1 = 1'b1;
  #1  input1 = 1'b0; 
  #1  input1 = 1'b1; 
  #1  input1 = 1'b0; 
  #1  input1 = 1'b0; 
  #1  input1 = 1'b0; 
  #1  input1 = 1'b0; 
  #1  input1 = 1'b1; 
  #1  input1 = 1'b0; 
  #1  input1 = 1'b0; 
  #1  input1 = 1'b0; 
  #1  input1 = 1'b0; 
  #1  input1 = 1'b1; 
  #1  input1 = 1'b1; 
  #1  input1 = 1'b0; 
  #1  input1 = 1'b1; 
  #1  input1 = 1'b0; 
  #1  input1 = 1'b0; 
  #1  input1 = 1'b0; 
  #1  input1 = 1'b1; 
  #1  input1 = 1'b1; 
  #1  input1 = 1'b1; 
  #1  input1 = 1'b0; 
  #1  input1 = 1'b1; 
  #1  input1 = 1'b0; 
  #1  input1 = 1'b0; 
  #1  input1 = 1'b0; 
  #1  input1 = 1'b0; 
  #1  input1 = 1'b1; 
  #1  input1 = 1'b0; 
  #1  input1 = 1'b0; 
  #1  input1 = 1'b0; 
  #1  input1 = 1'b0; 
  #1  input1 = 1'b1; 
  #1  input1 = 1'b1; 
  end

  initial begin
    $dumpfile("d_latch.vcd");
    $dumpvars(0, d_latch_test);
    $monitor("time = %g, Q = %b, Qbar = %b, input1 = %b, Clock = %b", $time, Q, Qbar, input1, Clock);
  end
  initial #70 $finish; 


endmodule