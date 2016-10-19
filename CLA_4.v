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

module CLA_4 (      
                    input  Cin,
                    input  [3:0] A, B,
                    output [3:0] Sum,Generate ,Propogate);

wire [3:0] Carry,g,p; 

assign Sum          = (A ^ B^ Carry);
assign g  		    = (A & B);                 
assign p  		    = (A ^ B);				   
assign Generate     =  g;				   
assign Propogate    =  p; 

assign Carry[0] =     Cin ;
assign Carry[1] =  (( Cin & p[0])                    |  g[0]);
assign Carry[2] =  (( Cin & p[0]&p[1] )              | (g[0]&p[1])               |  g[1]);
assign Carry[3] =  (( Cin & p[0]&p[1]&p[2])          | (g[0]&p[1]&p[2])          | (g[1]&p[2])           |  g[2] );
//assign Carry[3] =  (( Cin & p[0]&p[1]&p[2]&p[3])     | (g[0]&p[1]&p[2]&p[3])     | (g[1]&p[2]&p[3])      | (g[2]&p[3])       |  g[3] );

endmodule