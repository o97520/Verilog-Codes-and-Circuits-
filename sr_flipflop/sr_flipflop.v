`timescale 1ns/1ps

module sr_flipflop (Q, Qbar, Set, Reset, Clock, Preset, Clear);

output reg Q, Qbar;

input Set, Reset, Clock, Preset, Clear;

  
  always @(posedge Clock)
    if(Clear == 1'b1)
      begin Q<=1'b0; Qbar<=1'b1; end
    else if (Preset == 1'b1)
      begin Q<=1'b1; Qbar<=1'b0; end
    else
      case ({Set, Reset}) 

        2'b00: begin Q<=Q; Qbar<=Qbar; end 
        2'b01: begin Q<=1'b0; Qbar<=1'b1; end 
        2'b10: begin Q<=1'b1; Qbar<=1'b0; end 
        2'b11: begin Q<=1'bx; Qbar<=1'bx; end 
        
        default: {Q, Qbar} <= 2'bxx; 
      endcase


endmodule


module sr_flipflop_test;

  //inputs
  reg  Set, Reset, Clock, Preset, Clear;


  //outputs
  wire Q, Qbar;

  //instantiat unit under test        
  sr_flipflop srflpflp(.Q(Q), .Qbar(Qbar), .Set(Set), .Reset(Reset), .Clock(Clock), .Preset(Preset), .Clear(Clear));

  initial begin
    
    Set = 0;
    Reset = 0;
    Clock = 0;
    Clear = 1'b1;
    #10 Preset = 1'b1;
    #10 Preset = 1'b0;

  end

  always #2 {Set, Reset} = {Set, Reset} + 1'b1;
  always #1 Clock = ~Clock;
  initial #10 Clear = 1'b0;


  initial begin
    $dumpfile("sr_flipflop.vcd");
    $dumpvars(0, sr_flipflop_test);
    $monitor("time = %g, Q = %b, Qbar = %b,, Set = %b, Reset = %b, Clock = %b, Preset = %b, Clear = %b", $time, Q, Qbar, Set, Reset, Clock, Preset, Clear );
  end
  initial #200 $finish; 


endmodule