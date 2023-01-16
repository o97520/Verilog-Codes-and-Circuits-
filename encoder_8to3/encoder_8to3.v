`timescale 1ns/1ps

module encoder_8to3 (out, input1);

output reg [2:0] out;

input [7:0] input1;

always @ (*)

case (input1)
  8'h01: out = 3'b000;
  8'h02: out = 3'b001;
  8'h04: out = 3'b010;
  8'h08: out = 3'b011;
  8'h10: out = 3'b100;
  8'h20: out = 3'b101;
  8'h40: out = 3'b110;
  8'h80: out = 3'b111;
  default: out = 3'bxxx;
endcase

endmodule


module encoder_8to3_test;

  //inputs
  reg [7:0] input1;

  //outputs
  wire [2:0] out;

  //instantiat unit under test
  encoder_8to3 enc(.out(out), .input1(input1));

  initial begin
  
    input1 = 8'h00;
    #1  input1 = + 8'h01;
    #1  input1 = + 8'h02;
    #1  input1 = + 8'h04;
    #1  input1 = + 8'h08;
    #1  input1 = + 8'h10;
    #1  input1 = + 8'h20;
    #1  input1 = + 8'h40;
    #1  input1 = + 8'h80;
  
  end



  initial begin
    $dumpfile("encoder_8to3.vcd");
    $dumpvars(0, encoder_8to3_test);
    $monitor("time = %g, out = %b, input1 = %b", $time, out, input1);
  end
  initial #32 $finish; 


endmodule