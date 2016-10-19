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

//`timescale 1ns  / 10 ps
//
//module carry_out_8 ( input  Cin,   input  [7:0] g, p, output Cout);
//assign Cout = (( Cin & p[0]&p[1]&p[2]&p[3]&p[4]&p[5]&p[6]&p[7])  | (g[0]&p[1]&p[2]&p[3]&p[4]&p[5]&p[6]&p[7]) | (g[1]&p[2]&p[3]&p[4]&p[5]&p[6]&p[7])  | (g[2]&p[3]&p[4]&p[5]&p[6]&p[7])   | (g[3]&p[4]&p[5]&p[6]&p[7])    | g[4]&p[5]&p[6]&p[7]   | g[5]&p[6]&p[7]    | g[6]&p[7] | g[7]);  
//endmodule
 