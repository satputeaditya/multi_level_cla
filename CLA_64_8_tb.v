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

module CLA_64_8_tb ();

reg  [63:0] A=0, B=0 ;
wire [63:0] Sum;
wire Cout;
reg  reset,clock;


initial begin : A_TB
               A = 0;
          #10  A = 64'h00FF_00FF_00FF_00FF;     // Worst case delay - carry generated via propogate
          #30  A = 64'h0000_0000_0000_0000;     // Making input = 0 so that next transition can be noted

          #30  A = 64'h8080_8080_8080_80FF;     // Best case delay - carry generated via generate
          #30  A = 64'h0000_0000_0000_0000;     // Making input = 0 so that next transition can be noted

          #30  A = 64'h0888_8888_8888_8888;     // Best case delay - carry generated via propogate
          #30  A = 64'h0000_0000_0000_0000;     // Making input = 0 so that next transition can be noted

          #30  A = 64'h1111_1111_1111_1111;     // Random data

        end

initial begin : B_TB
              B = 0;
          #10 B = 64'hFF00_FF00_FF00_FF01;     // Worst case delay - carry generated via propogate 
          #30 B = 64'h0000_0000_0000_0000;     // Making input = 0 so that next transition can be noted

          #30 B = 64'h8080_8080_8080_8001;    // Best case delay - carry generated via generate
          #30 B = 64'h0000_0000_0000_0000;     // Making input = 0 so that next transition can be noted

          #30 B = 64'h0888_8888_8888_8888;     // Best case delay - carry generated via propogate
          #30 B = 64'h0000_0000_0000_0000;     // Making input = 0 so that next transition can be noted

          #30 B = 64'h2222_2222_2222_2222;     // Random data
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
        
CLA_64_8 U1 (A, B, Sum, Cout, clock, reset);

initial begin 
            $monitor("TIME :",$time,"   HEX VALUES :    a_inp = %h    b_inp = %h    s_out = %h    c_out = %h",A,B,Sum,Cout);
        end

initial begin
            $dumpfile("CLA_64_8_tb.vcd");
            $dumpvars(0,CLA_64_8_tb);
end 

endmodule