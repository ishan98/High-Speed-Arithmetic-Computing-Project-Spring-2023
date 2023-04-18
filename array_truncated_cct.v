module array_t(a,b,result);
input  [5:0] a;
input  [5:0] b;
output [7:0] result;
wire s_row_res_0_5;
AND_my and0_5(s_row_res_0_5, a[5], b[0]);
wire s_row_res_0_4;
AND_my and0_4(s_row_res_0_4, a[4], b[0]);
wire s_row_res_0_3;
AND_my and0_3(s_row_res_0_3, a[3], b[0]);
wire s_row_res_0_2;
AND_my and0_2(s_row_res_0_2, a[2], b[0]);
wire s_row_res_1_5;
AND_my and1_5(s_row_res_1_5, a[5], b[1]);
wire c_row_res_1_4, s_row_res_1_4;
mha mha1_4(a[4], b[1], s_row_res_0_5, 
                    c_row_res_1_4, s_row_res_1_4);
wire c_row_res_1_3, s_row_res_1_3;
mha mha1_3(a[3], b[1], s_row_res_0_4, 
                    c_row_res_1_3, s_row_res_1_3);
wire c_row_res_1_2, s_row_res_1_2;
mha mha1_2(a[2], b[1], s_row_res_0_3, 
                    c_row_res_1_2, s_row_res_1_2);
wire c_row_res_1_1;
AND_my and1_1(c_row_res_1_1, a[1], b[1]);
wire s_row_res_2_5;
AND_my and2_5(s_row_res_2_5, a[5], b[2]);
wire s_row_res_2_4, c_row_res_2_4;
mfa mfa2_4(a[4], b[2], s_row_res_1_5, c_row_res_1_4, 
                    c_row_res_2_4, s_row_res_2_4);
wire s_row_res_2_3, c_row_res_2_3;
mfa mfa2_3(a[3], b[2], s_row_res_1_4, c_row_res_1_3, 
                    c_row_res_2_3, s_row_res_2_3);
wire s_row_res_2_2, c_row_res_2_2;
mfa mfa2_2(a[2], b[2], s_row_res_1_3, c_row_res_1_2, 
                    c_row_res_2_2, s_row_res_2_2);
wire s_row_res_2_1, c_row_res_2_1;
mfa mfa2_1(a[1], b[2], s_row_res_1_2, c_row_res_1_1, 
                    c_row_res_2_1, s_row_res_2_1);
wire c_row_res_2_0;
AND_my and2_0(c_row_res_2_0, a[0], b[2]);
wire s_row_res_3_5;
AND_my and3_5(s_row_res_3_5, a[5], b[3]);
wire s_row_res_3_4, c_row_res_3_4;
mfa mfa3_4(a[4], b[3], s_row_res_2_5, c_row_res_2_4, 
                    c_row_res_3_4, s_row_res_3_4);
wire s_row_res_3_3, c_row_res_3_3;
mfa mfa3_3(a[3], b[3], s_row_res_2_4, c_row_res_2_3, 
                    c_row_res_3_3, s_row_res_3_3);
wire s_row_res_3_2, c_row_res_3_2;
mfa mfa3_2(a[2], b[3], s_row_res_2_3, c_row_res_2_2, 
                    c_row_res_3_2, s_row_res_3_2);
wire s_row_res_3_1, c_row_res_3_1;
mfa mfa3_1(a[1], b[3], s_row_res_2_2, c_row_res_2_1, 
                    c_row_res_3_1, s_row_res_3_1);
wire c_row_res_3_0;
rfa rfa3_0(a[0], b[3], s_row_res_2_1, c_row_res_2_0,
                        c_row_res_3_0);
wire s_row_res_4_5;
AND_my and4_5(s_row_res_4_5, a[5], b[4]);
wire s_row_res_4_4, c_row_res_4_4;
mfa mfa4_4(a[4], b[4], s_row_res_3_5, c_row_res_3_4, 
                    c_row_res_4_4, s_row_res_4_4);
wire s_row_res_4_3, c_row_res_4_3;
mfa mfa4_3(a[3], b[4], s_row_res_3_4, c_row_res_3_3, 
                    c_row_res_4_3, s_row_res_4_3);
wire s_row_res_4_2, c_row_res_4_2;
mfa mfa4_2(a[2], b[4], s_row_res_3_3, c_row_res_3_2, 
                    c_row_res_4_2, s_row_res_4_2);
wire s_row_res_4_1, c_row_res_4_1;
mfa mfa4_1(a[1], b[4], s_row_res_3_2, c_row_res_3_1, 
                    c_row_res_4_1, s_row_res_4_1);
wire s_row_res_4_0, c_row_res_4_0;
mfa mfa4_0(a[0], b[4], s_row_res_3_1, c_row_res_3_0, 
                        c_row_res_4_0, s_row_res_4_0);
wire s_row_res_5_5;
AND_my and5_5(s_row_res_5_5, a[5], b[5]);
wire s_row_res_5_4, c_row_res_5_4;
mfa mfa5_4(a[4], b[5], s_row_res_4_5, c_row_res_4_4, 
                    c_row_res_5_4, s_row_res_5_4);
wire s_row_res_5_3, c_row_res_5_3;
mfa mfa5_3(a[3], b[5], s_row_res_4_4, c_row_res_4_3, 
                    c_row_res_5_3, s_row_res_5_3);
wire s_row_res_5_2, c_row_res_5_2;
mfa mfa5_2(a[2], b[5], s_row_res_4_3, c_row_res_4_2, 
                    c_row_res_5_2, s_row_res_5_2);
wire s_row_res_5_1, c_row_res_5_1;
mfa mfa5_1(a[1], b[5], s_row_res_4_2, c_row_res_4_1, 
                    c_row_res_5_1, s_row_res_5_1);
wire s_row_res_5_0, c_row_res_5_0;
mfa mfa5_0(a[0], b[5], s_row_res_4_1, c_row_res_4_0, 
                        c_row_res_5_0, s_row_res_5_0);
wire cFull_4;
normal_FA faResult6(s_row_res_5_5, c_row_res_5_4, cFull_3, 
        cFull_4, result[6]);
wire cFull_3;
normal_FA faResult5(s_row_res_5_4, c_row_res_5_3, cFull_2, 
        cFull_3, result[5]);
wire cFull_2;
normal_FA faResult4(s_row_res_5_3, c_row_res_5_2, cFull_1, 
        cFull_2, result[4]);
wire cFull_1;
normal_FA faResult3(s_row_res_5_2, c_row_res_5_1, cFull_0, 
        cFull_1, result[3]);
wire cFull_0;
normal_HA haResult2(s_row_res_5_1, c_row_res_5_0, 
        cFull_0, result[2]);
assign result[0] = s_row_res_4_0;
assign result[1] = s_row_res_5_0;
assign result[7] = cFull_4;
endmodule;
