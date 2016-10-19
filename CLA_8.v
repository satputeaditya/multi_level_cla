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

module CLA_8  (      
                    input  Cin,
                    input  [7:0] A, B,
                    output [7:0] Sum,Generate ,Propogate);

wire [7:0] Carry,g,p; 

assign Sum          = (A ^ B^ Carry);
assign g  		    = (A & B);                 
assign p  		    = (A ^ B);				   
assign Carry_out    = Carry;				   
assign Generate     = g;				   
assign Propogate    = p; 

assign Carry[0] =   Cin ;
assign Carry[1] =(( Cin & p[0])                                     |  g[0]);
assign Carry[2] =(( Cin & p[0]&p[1] )                               | (g[0]&p[1])                               |  g[1]);
assign Carry[3] =(( Cin & p[0]&p[1]&p[2])                           | (g[0]&p[1]&p[2])                          | (g[1]&p[2])                           |  g[2] );
assign Carry[4] =(( Cin & p[0]&p[1]&p[2]&p[3])                      | (g[0]&p[1]&p[2]&p[3])                     | (g[1]&p[2]&p[3])                      | (g[2]&p[3])                       |  g[3] );
assign Carry[5] =(( Cin & p[0]&p[1]&p[2]&p[3]&p[4])                 | (g[0]&p[1]&p[2]&p[3]&p[4])                | (g[1]&p[2]&p[3]&p[4])                 | (g[2]&p[3]&p[4])                  | (g[3]&p[4])                   | g[4]  );
assign Carry[6] =(( Cin & p[0]&p[1]&p[2]&p[3]&p[4]&p[5])            | (g[0]&p[1]&p[2]&p[3]&p[4]&p[5])           | (g[1]&p[2]&p[3]&p[4]&p[5])            | (g[2]&p[3]&p[4]&p[5])             | (g[3]&p[4]&p[5])              | g[4]&p[5]             | g[5] );
assign Carry[7] =(( Cin & p[0]&p[1]&p[2]&p[3]&p[4]&p[5]&p[6])       | (g[0]&p[1]&p[2]&p[3]&p[4]&p[5]&p[6])      | (g[1]&p[2]&p[3]&p[4]&p[5]&p[6])       | (g[2]&p[3]&p[4]&p[5]&p[6])        | (g[3]&p[4]&p[5]&p[6])         | g[4]&p[5]&p[6]        | g[5]&p[6]         | g[6] );

endmodule