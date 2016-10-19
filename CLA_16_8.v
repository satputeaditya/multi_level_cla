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

module CLA_16_8 (   input       [15:0] a_inp, 
                    input       [15:0] b_inp,
                    output reg  [15:0] s_out,
                    output reg         c_out,
                    input         clock,
                    input         reset);

wire       Cin_1      ,Cin_2 ;
wire       Cout_1     ,Cout_2;
reg  [7:0] A_1        ,A_2;
reg  [7:0] B_1        ,B_2;
wire [7:0] Sum_1      ,Sum_2;
wire [7:0] Generate_1 /*,Generate_2*/;
wire [7:0] Propogate_1 /*,Propogate_2*/;

wire [7:0] Ignore_1 ,Ignore_2 ;
wire [15:0] Propogate_2,Generate_2;

assign {Generate_2 }   = ({A_2,A_1} & {B_2,B_1});
assign {Propogate_2}   = ({A_2,A_1} ^ {B_2,B_1});


assign Cin_1 = 0;
assign Cin_2 = Cout_1;

always@(posedge clock or posedge reset) 
begin
    if (reset) 
        begin
            s_out <= 'b0;
            c_out <= 'b0;
            A_1   <= 'b0;
            A_2   <= 'b0;
            B_1   <= 'b0;
            B_2   <= 'b0;                                     
        end
    else 
        begin
            {A_2,A_1} <= a_inp;
            {B_2,B_1} <= b_inp;
            s_out <= {Sum_2,Sum_1};
            c_out <= Cout_2;
        end
end

CLA_8 U1 (Cin_1, A_1, B_1, Sum_1, Generate_1 ,Propogate_1 );
CLA_8 U2 (Cin_2, A_2, B_2, Sum_2, Ignore_1   ,Ignore_2);

carry_out_8  U3 (Cin_1, Generate_1, Propogate_1, Cout_1);                    
carry_out_16 U4 (Cin_1, Generate_2, Propogate_2, Cout_2);                    

endmodule