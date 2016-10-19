// testbench.v

`timescale 1ns  / 10 ps

module testbench ();

reg  [63:0] A=0, B=0 ;
wire [63:0] Sum;
wire Cout;
reg  reset,clock;


initial begin : A_TB
               A = 0;
 forever   #10 A = (A-1);
        end

initial begin : B_TB
               B = 0;
 forever   #10 B = (B-1);
        end


initial begin : reset_TB
               reset = 0; 
           #1  reset = 1;
           #5  reset = 0;

        end

initial begin : clock_TB
                clock = 0;
            #5  clock = 1;
  forever   #5  clock = ~clock;
        end
        
CLA_64_4 U1 (A, B, Sum, Cout, clock, reset);

initial begin 
            $monitor("TIME :",$time,"   HEX VALUES : a_inp = %h    b_inp = %h    s_out = %h    c_out = %h",A,B,Sum,Cout);
        end

initial begin
            $dumpfile("testbench.vcd");
            $dumpvars(0,testbench);
end 

endmodule