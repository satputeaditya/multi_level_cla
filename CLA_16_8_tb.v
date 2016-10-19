// ----------------------------------------------------------------------------
// Class                : EE271
// Term                 : Summer 2016
// Author               : Aditya Satpute
// Student ID           : 010120266
// Date                 : 30/06/2016
// Module               :  .v
// Edianness            : 
// Active clock edge    : Positive edge
// Edianness            : Big endian - MSB:LSB
// Reset                : Asynchronous active high level triggered
// ----------------------------------------------------------------------------

`timescale 1ns  / 10 ps

module CLA_16_8_tb ();

reg  [15:0] A=0, B=0 ;
wire [15:0] Sum;
wire Cout;
reg  reset,clock;


initial begin : A_TB
               A = 0;
          #10  A = 16'h00FF;
          #30  A = 16'h0000;

          #30  A = 16'h80FF;
          #30  A = 16'h0000;

          #30  A = 16'h00FF;
          #30  A = 16'h0000;

          #30  A = 16'h1111;

        end

initial begin : B_TB
              B = 0;
          #10 B = 16'hFF01;
          #30 B = 16'h0000;

          #30 B = 16'h8080;
          #30 B = 16'h0000;

          #30 B = 16'hFF80;
          #30 B = 16'h0000;

          #30 B = 16'h2222;
        end

initial begin : reset_TB
               reset = 0; 
           #2  reset = 1;
           #5  reset = 0;

           #55  reset = 1;
           #5   reset = 0;

           #55  reset = 1;
           #5   reset = 0;

           #55  reset = 1;
           #5   reset = 0;

           #65 $finish;
        end

initial begin : clock_TB
                clock = 0;
            #5  clock = 1;
  forever   #5  clock = ~clock;
        end
        
CLA_16_8 U1 (A, B, Sum, Cout, clock, reset);

initial begin 
            $monitor("TIME :",$time,"   HEX VALUES : a_inp = %h    b_inp = %h    s_out = %h    c_out = %h",A,B,Sum,Cout);
        end

initial begin
            $dumpfile("CLA_16_8_tb.vcd");
            $dumpvars(0,CLA_16_8_tb);
end 

endmodule