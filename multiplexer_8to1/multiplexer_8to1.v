
module multiplexer_8to1(out, input1, select);


output out;
input [7:0]input1;
input [2:0]select;
wire [5:0] interconnections;
multiplexer_2to1_ifelse m2t11 (.outmp(interconnections[0]), .input1(input1[1:0]), .select(select[2]));
multiplexer_2to1_ifelse m2t12 (.outmp(interconnections[1]), .input1(input1[3:2]), .select(select[2]));
multiplexer_2to1_ifelse m2t13 (.outmp(interconnections[2]), .input1(input1[5:4]), .select(select[2]));
multiplexer_2to1_ifelse m2t14 (.outmp(interconnections[3]), .input1(input1[7:6]), .select(select[2]));
multiplexer_2to1_ifelse m2t15 (.outmp(interconnections[4]), .input1(interconnections[1:0]), .select(select[1]));
multiplexer_2to1_ifelse m2t16 (.outmp(interconnections[5]), .input1(interconnections[3:2]), .select(select[1]));
multiplexer_2to1_ifelse m2t17 (.outmp(out), .input1(interconnections[5:4]), .select(select[0]));

endmodule

module multiplexer_2to1_ifelse(outmp, input1, select);


output reg outmp;
input [1:0]input1;
input select;


always @(*)
  if (select == 1'b1) begin
    outmp = input1[1];
  
  end else begin
    outmp = input1[0];
  
  end

endmodule


module multiplexer_8to1_test;

  //inputs
  reg [7:0]input1;
  reg [2:0]select;

  
  //outputs
  wire out;

  //instantiat unit under test
  multiplexer_8to1 mp(.out(out), .input1(input1), .select(select));

  initial begin
  
    input1 = 8'b10110110;  
        
    select = 3'b000;
    #2 select = 3'b001;
    #2 select = 3'b010;
    #2 select = 3'b011;
    #2 select = 3'b100;
    #2 select = 3'b101;
    #2 select = 3'b110;
    #2 select = 3'b111;
  
  end

  initial begin
    $dumpfile("multiplexer_8to1.vcd");
    $dumpvars(0, multiplexer_8to1_test);
    $monitor("time=%g,out =%b,output=%b,select=%b", $time, out, input1, select);
  end
  initial #30 $finish; 


endmodule