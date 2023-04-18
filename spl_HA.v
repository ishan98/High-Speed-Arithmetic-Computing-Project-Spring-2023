`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2023 08:40:27 PM
// Design Name: 
// Module Name: spl_HA
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


module mha(
    input x_bitline,
    input y_bitline,
    input sum_in,
    output carry_out,
    output sum_out
    );
    
    wire bitwise_and = x_bitline & y_bitline;

    normal_HA i_HA(.sum_in(sum_in),
                   .carry_in(bitwise_and),
                   .sum_out(sum_out),
                   .carry_out(carry_out)
                   );
    
   
//    assign sum_out = (bitwise_and ^ sum_in);
    
//    assign carry_out = (bitwise_and & sum_in);
    
    
endmodule
