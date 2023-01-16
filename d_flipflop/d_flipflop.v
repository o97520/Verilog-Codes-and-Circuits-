`timescale 1ns/1ps

module d_flipflop (Q, Qbar, Data, Clock, Clear);

output reg Q, Qbar;

input Data, Clock, Clear;

  
  always @(posedge Clock or negedge Clear)
    if(Clear == 1'b0)
      begin Q<=1'b0; Qbar<=1'b1; end
    else
      begin Q<=Data ; Qbar<=~Data; end
    
endmodule


module d_flipflop_test;

  //inputs
  reg  Data, Clock, Clear;


  //outputs
  wire Q, Qbar;

  //instantiat unit under test        
  d_flipflop dflpflp(.Q(Q), .Qbar(Qbar), .Data(Data), .Clock(Clock), .Clear(Clear));

  initial begin
    
    Data = 1'b0;
    Clock = 1'b0;
    Clear = 1'b1;

  end

  always #2 Data = Data + 1'b1;
  initial #10 Clear = 1'b0;
  always #5 Clock = ~Clock;


  initial begin
    $dumpfile("d_flipflop.vcd");
    $dumpvars(0, d_flipflop_test);
    $monitor("time = %g, Q = %b, Qbar = %b, Data = %b, Clock = %b, Clear = %b", $time, Q, Qbar, Data, Clock, Clear );
  end
  initial #100 $finish; 


endmodule