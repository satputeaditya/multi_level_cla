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

module CLA_64_4 (   input  [63:0] a_inp, 
                    input  [63:0] b_inp,
                    output reg [63:0] s_out,
                    output reg        c_out,
                    input         clock,
                    input         reset);


wire       Cin_1        ,Cin_2          ,Cin_3          ,Cin_4          ,Cin_5          ,Cin_6          ,Cin_7          ,Cin_8;
wire       Cin_9        ,Cin_10         ,Cin_11         ,Cin_12         ,Cin_13         ,Cin_14         ,Cin_15         ,Cin_16;

wire       Cout_1       ,Cout_2         ,Cout_3         ,Cout_4         ,Cout_5         ,Cout_6         ,Cout_7         ,Cout_8;
wire       Cout_9       ,Cout_10        ,Cout_11        ,Cout_12        ,Cout_13        ,Cout_14        ,Cout_15        ,Cout_16;

reg  [3:0] A_1          ,A_2            ,A_3            ,A_4            ,A_5            ,A_6            ,A_7            ,A_8;
reg  [3:0] A_9          ,A_10           ,A_11           ,A_12           ,A_13           ,A_14           ,A_15           ,A_16;

reg  [3:0] B_1          ,B_2            ,B_3            ,B_4            ,B_5            ,B_6            ,B_7            ,B_8;
reg  [3:0] B_9          ,B_10           ,B_11           ,B_12           ,B_13           ,B_14           ,B_15           ,B_16;

wire [3:0] Sum_1        ,Sum_2          ,Sum_3          ,Sum_4          ,Sum_5          ,Sum_6          ,Sum_7          ,Sum_8;
wire [3:0] Sum_9        ,Sum_10         ,Sum_11         ,Sum_12         ,Sum_13         ,Sum_14         ,Sum_15         ,Sum_16;

wire [3:0] Generate_1   ,Generate_2     ,Generate_3     ,Generate_4     ,Generate_5     ,Generate_6     ,Generate_7     /*,Generate_8*/;
wire [3:0] Generate_9   ,Generate_10    ,Generate_11    ,Generate_12    ,Generate_13    ,Generate_14    ,Generate_15    /*,Generate_16*/;

wire [3:0] Propogate_1   ,Propogate_2   ,Propogate_3    ,Propogate_4    ,Propogate_5    ,Propogate_6     ,Propogate_7    /*,Propogate_8*/;
wire [3:0] Propogate_9   ,Propogate_10  ,Propogate_11   ,Propogate_12   ,Propogate_13   ,Propogate_14    ,Propogate_15   /*,Propogate_16*/;


wire [3:0]  Ignore_1 ,Ignore_2 ,Ignore_3 ,Ignore_4;
wire [31:0] Propogate_8,Generate_8,Propogate_16,Generate_16;

assign {Generate_16 ,Generate_8 }   = ({A_16,A_15,A_14,A_13,A_12,A_11,A_10,A_9,A_8,A_7,A_6,A_5,A_4,A_3,A_2,A_1} & {B_16,B_15,B_14,B_13,B_12,B_11,B_10,B_9,B_8,B_7,B_6,B_5,B_4,B_3,B_2,B_1});
assign {Propogate_16,Propogate_8}   = ({A_16,A_15,A_14,A_13,A_12,A_11,A_10,A_9,A_8,A_7,A_6,A_5,A_4,A_3,A_2,A_1} ^ {B_16,B_15,B_14,B_13,B_12,B_11,B_10,B_9,B_8,B_7,B_6,B_5,B_4,B_3,B_2,B_1});



assign Cin_1 = 0;
assign Cin_2 = Cout_1;
assign Cin_3 = Cout_2;
assign Cin_4 = Cout_3;
assign Cin_5 = Cout_4;
assign Cin_6 = Cout_5;
assign Cin_7 = Cout_6;
assign Cin_8 = Cout_7;
assign Cin_9  = Cout_8;
assign Cin_10 = Cout_9;
assign Cin_11 = Cout_10;
assign Cin_12 = Cout_11;
assign Cin_13 = Cout_12;
assign Cin_14 = Cout_13;
assign Cin_15 = Cout_14;
assign Cin_16 = Cout_15;
//assign c_out  = Cout_16;

//assign  {A_16,A_15,A_14,A_13,A_12,A_11,A_10,A_9,A_8,A_7,A_6,A_5,A_4,A_3,A_2,A_1}           = a_inp;
//assign  {B_16,B_15,B_14,B_13,B_12,B_11,B_10,B_9,B_8,B_7,B_6,B_5,B_4,B_3,B_2,B_1}           = b_inp;
//assign  s_out = {Sum_16,Sum_15,Sum_14,Sum_13,Sum_12,Sum_11,Sum_10,Sum_9,Sum_8,Sum_7,Sum_6,Sum_5,Sum_4,Sum_3,Sum_2,Sum_1};



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

            A_5   <= 'b0;
            A_6   <= 'b0;
            A_7   <= 'b0;
            A_8   <= 'b0;

            A_9    <= 'b0;
            A_10   <= 'b0;
            A_11   <= 'b0;
            A_12   <= 'b0;

            A_13   <= 'b0;
            A_14   <= 'b0;
            A_15   <= 'b0;
            A_16   <= 'b0;


            B_1   <= 'b0;
            B_2   <= 'b0;
            B_3   <= 'b0;
            B_4   <= 'b0;

            B_5   <= 'b0;
            B_6   <= 'b0;
            B_7   <= 'b0;
            B_8   <= 'b0;

            B_9    <= 'b0;
            B_10   <= 'b0;
            B_11   <= 'b0;
            B_12   <= 'b0;

            B_13   <= 'b0;
            B_14   <= 'b0;
            B_15   <= 'b0;
            B_16   <= 'b0;

        end
    else 
        begin
            {A_16,A_15,A_14,A_13,A_12,A_11,A_10,A_9,A_8,A_7,A_6,A_5,A_4,A_3,A_2,A_1} <= a_inp;
            {B_16,B_15,B_14,B_13,B_12,B_11,B_10,B_9,B_8,B_7,B_6,B_5,B_4,B_3,B_2,B_1} <= b_inp;
            s_out <= {Sum_16,Sum_15,Sum_14,Sum_13,Sum_12,Sum_11,Sum_10,Sum_9,Sum_8,Sum_7,Sum_6,Sum_5,Sum_4,Sum_3,Sum_2,Sum_1};
            c_out <= Cout_16;
        end
end




CLA_4 U1  (Cin_1,  A_1,  B_1,  Sum_1,  Generate_1,  Propogate_1 );
CLA_4 U2  (Cin_2,  A_2,  B_2,  Sum_2,  Generate_2,  Propogate_2 );
CLA_4 U3  (Cin_3,  A_3,  B_3,  Sum_3,  Generate_3,  Propogate_3 );
CLA_4 U4  (Cin_4,  A_4,  B_4,  Sum_4,  Generate_4,  Propogate_4 );
CLA_4 U5  (Cin_5,  A_5,  B_5,  Sum_5,  Generate_5,  Propogate_5 );
CLA_4 U6  (Cin_6,  A_6,  B_6,  Sum_6,  Generate_6,  Propogate_6 );
CLA_4 U7  (Cin_7,  A_7,  B_7,  Sum_7,  Generate_7,  Propogate_7 );
CLA_4 U8  (Cin_8,  A_8,  B_8,  Sum_8,  Ignore_1  ,  Ignore_2    );

CLA_4 U9  (Cin_9 , A_9 , B_9 , Sum_9 , Generate_9 , Propogate_9  );
CLA_4 U10 (Cin_10, A_10, B_10, Sum_10, Generate_10, Propogate_10 );
CLA_4 U11 (Cin_11, A_11, B_11, Sum_11, Generate_11, Propogate_11 );
CLA_4 U12 (Cin_12, A_12, B_12, Sum_12, Generate_12, Propogate_12 );
CLA_4 U13 (Cin_13, A_13, B_13, Sum_13, Generate_13, Propogate_13 );
CLA_4 U14 (Cin_14, A_14, B_14, Sum_14, Generate_14, Propogate_14 );
CLA_4 U15 (Cin_15, A_15, B_15, Sum_15, Generate_15, Propogate_15 );
CLA_4 U16 (Cin_16, A_16, B_16, Sum_16, Ignore_3   , Ignore_4     );


carry_out_4 U17 (Cin_1,  Generate_1  ,Propogate_1,  Cout_1);
carry_out_4 U18 (Cin_2,  Generate_2  ,Propogate_2,  Cout_2);
carry_out_4 U19 (Cin_3,  Generate_3  ,Propogate_3,  Cout_3);
carry_out_4 U20 (Cin_4,  Generate_4  ,Propogate_4,  Cout_4);
carry_out_4 U21 (Cin_5,  Generate_5  ,Propogate_5,  Cout_5);
carry_out_4 U22 (Cin_6,  Generate_6  ,Propogate_6,  Cout_6);
carry_out_4 U23 (Cin_7,  Generate_7  ,Propogate_7,  Cout_7);
//carry_out_4 U24 (Cin_8,  Generate_8  ,Propogate_8,  Cout_8);
carry_out_32 U24 (Cin_1,  Generate_8  ,Propogate_8,  Cout_8); 

carry_out_4 U25 (Cin_9 , Generate_9  ,Propogate_9 , Cout_9 );
carry_out_4 U26 (Cin_10, Generate_10 ,Propogate_10, Cout_10);
carry_out_4 U27 (Cin_11, Generate_11 ,Propogate_11, Cout_11);
carry_out_4 U28 (Cin_12, Generate_12 ,Propogate_12, Cout_12);
carry_out_4 U29 (Cin_13, Generate_13 ,Propogate_13, Cout_13);
carry_out_4 U30 (Cin_14, Generate_14 ,Propogate_14, Cout_14);
carry_out_4 U31 (Cin_15, Generate_15 ,Propogate_15, Cout_15);
//carry_out_4 U32 (Cin_16, Generate_16 ,Propogate_16, Cout_16);
carry_out_32 U32 (Cin_9, Generate_16 ,Propogate_16, Cout_16);

endmodule 