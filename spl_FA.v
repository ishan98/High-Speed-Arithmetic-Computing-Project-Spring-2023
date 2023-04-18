`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2023 07:52:17 PM
// Design Name: 
// Module Name: spl_FA
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mfa(
    input x_bitline,
    input y_bitline,
    input sum_in,
    input carry_in,
    output carry_out,
    output sum_out
    );
    
    
    wire bitwise_and = x_bitline & y_bitline;
    
    normal_FA i_FA(.sum_in(sum_in),
                   .carry_in(carry_in),
                   .side_sum_in(bitwise_and),
                   .sum_out(sum_out),
                   .carry_out(carry_out)
                   );
    
    //assign sum_out = (~bitwise_and & ~sum_in & carry_in) | (~bitwise_and & sum_in & ~carry_in) | (bitwise_and & ~sum_in & ~carry_in) | (bitwise_and & sum_in & carry_in);
    
    //assign carry_out = (bitwise_and & sum_in) | (bitwise_and & carry_in) | (sum_in & carry_in);
    
endmodule
