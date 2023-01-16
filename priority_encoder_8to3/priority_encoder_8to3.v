`timescale 1ns/1ps

module priority_encoder_8to3 (out, input1);

output reg [2:0] out;

input [7:0] input1;

always @ (*)

casex (input1)
  8'b00000001: out = 3'b000;
  8'b0000001x: out = 3'b001;
  8'b000001xx: out = 3'b010;
  8'b00001xxx: out = 3'b011;
  8'b0001xxxx: out = 3'b100;
  8'b001xxxxx: out = 3'b101;
  8'b01xxxxxx: out = 3'b110;
  8'b1xxxxxxx: out = 3'b111;
  default: out = 3'bxxx;
endcase

endmodule


module priority_encoder_8to3_test;

  //inputs
  reg [7:0] input1;

  //outputs
  wire [2:0] out;

  //instantiat unit under test
  priority_encoder_8to3 enc(.out(out), .input1(input1));

  initial begin
  
    input1 = 8'h00;
    #1  input1 = + 8'h01;
    #1  input1 = + 8'h02;
    #1  input1 = + 8'h03;
    #1  input1 = + 8'h05;
    #1  input1 = + 8'h19;
    #1  input1 = + 8'ha2;
    #1  input1 = + 8'hff;
    #1  input1 = + 8'h80;
  
  end



  initial begin
    $dumpfile("priority_encoder_8to3.vcd");
    $dumpvars(0, priority_encoder_8to3_test);
    $monitor("time = %g, out = %b, input1 = %b", $time, out, input1);
  end
  initial #32 $finish; 


endmodule