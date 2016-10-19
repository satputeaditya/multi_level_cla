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

module CLA_16_4 (   input  [15:0] a_inp, 
                    input  [15:0] b_inp,
                    output reg [15:0] s_out,
                    output reg        c_out,
                    input         clock,
                    input         reset);


wire       Cin_1      ,Cin_2      ,Cin_3      ,Cin_4;
wire       Cout_1     ,Cout_2     ,Cout_3     ,Cout_4;
reg  [3:0] A_1        ,A_2        ,A_3        ,A_4;
reg  [3:0] B_1        ,B_2        ,B_3        ,B_4;
wire [3:0] Sum_1      ,Sum_2      ,Sum_3      ,Sum_4;
wire [3:0] Generate_1 ,Generate_2 ,Generate_3  /*,Generate_4*/;
wire [3:0] Propogate_1,Propogate_2,Propogate_3 /*,Propogate_4*/;

wire [3:0] Ignore_1 ,Ignore_2 ;
wire [15:0] Propogate_4,Generate_4;

assign {Generate_4 }   = ({A_4,A_3,A_2,A_1} & {B_4,B_3,B_2,B_1});
assign {Propogate_4}   = ({A_4,A_3,A_2,A_1} ^ {B_4,B_3,B_2,B_1});

assign Cin_1 = 0;
assign Cin_2 = Cout_1;
assign Cin_3 = Cout_2;
assign Cin_4 = Cout_3;
//assign c_out = Cout_4;

//assign  {A_4,A_3,A_2,A_1}           = a_inp;
//assign  {B_4,B_3,B_2,B_1}           = b_inp;
//assign  s_out = {Sum_4,Sum_3,Sum_2,Sum_1};




always@(posedge clock or posedge reset) 
begin
    if (reset) 
        begin
            s_out <= 'b0;
            c_out <= 'b0;
            A_1   <= 'b0;
            A_2   <= 'b0;
            A_3   <= 'b0;
            A_4   <= 'b0;
            B_1   <= 'b0;
            B_2   <= 'b0;
            B_3   <= 'b0;
            B_4   <= 'b0;
        end
    else 
        begin
            {A_4,A_3,A_2,A_1} <= a_inp;
            {B_4,B_3,B_2,B_1}  <= b_inp;
            s_out <= {Sum_4,Sum_3,Sum_2,Sum_1};
            c_out <= Cout_4;
        end
end


CLA_4 U1 (Cin_1, A_1, B_1, Sum_1, Generate_1 ,Propogate_1 );
CLA_4 U2 (Cin_2, A_2, B_2, Sum_2, Generate_2 ,Propogate_2 );
CLA_4 U3 (Cin_3, A_3, B_3, Sum_3, Generate_3 ,Propogate_3 );
CLA_4 U4 (Cin_4, A_4, B_4, Sum_4, Ignore_1   ,Ignore_2    );


carry_out_4  U5 (Cin_1, Generate_1, Propogate_1, Cout_1);                    // Cout_1 = C7
carry_out_4  U6 (Cin_2, Generate_2, Propogate_2, Cout_2);                    // Cout_2 = C15
carry_out_4  U7 (Cin_3, Generate_3, Propogate_3, Cout_3);                    // Cout_3 = C23
carry_out_16 U8 (Cin_1, Generate_4, Propogate_4, Cout_4);                    // Cout_4 = C31

endmodule