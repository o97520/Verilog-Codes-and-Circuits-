`timescale 1ns/1ps

module demultiplexer_1to8(out, input1, select);


output [7:0]out;

input input1;
input [2:0]select;

wire [5:0] interconnections;

demultiplexer_1to2 dm1t21(.out(interconnections[1:0]), .input1(input1), .select(select[0]));

demultiplexer_1to2 dm1t22(.out(interconnections[3:2]), .input1(interconnections[0]), .select(select[1]));
demultiplexer_1to2 dm1t23(.out(interconnections[5:4]), .input1(interconnections[1]), .select(select[1]));

demultiplexer_1to2 dm1t24(.out(out[1:0]), .input1(interconnections[2]), .select(select[2]));
demultiplexer_1to2 dm1t25(.out(out[3:2]), .input1(interconnections[3]), .select(select[2]));
demultiplexer_1to2 dm1t26(.out(out[5:4]), .input1(interconnections[4]), .select(select[2]));
demultiplexer_1to2 dm1t27(.out(out[7:6]), .input1(interconnections[5]), .select(select[2]));


endmodule

module demultiplexer_1to2(out, input1, select);


output [1:0]out;

input input1, select;

assign out[0] = ~(select) & input1;
assign out[1] = (select) & input1;

endmodule


module demultiplexer_1to8_test;

  //inputs
  reg input1;
  reg [2:0]select;

  //outputs
  wire [7:0]out;

  //instantiat unit under test
  demultiplexer_1to8 mp(.out(out), .input1(input1), .select(select));

  initial begin
  
    select = 3'b000;
    input1 = 1'b0;
  
  end

    always #1  select = select + 1'b1;
    always #8  input1 = input1 + 1'b1;


  initial begin
    $dumpfile("demultiplexer_1to8.vcd");
    $dumpvars(0, demultiplexer_1to8_test);
    $monitor("time = %g, out = %b, input1 = %b, select = %b", $time, out, input1, select);
  end
  initial #32 $finish; 


endmodule