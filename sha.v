`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2023 07:38:21 PM
// Design Name: 
// Module Name: sha
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


module sha(
    input x_bitline,
    input y_bitline,
    input sum_in,
    output carry_out,
    output sum_out
    );
    
    wire bitwise_and = 1'b1;

    normal_HA i_HA(.sum_in(sum_in),
                   .carry_in(bitwise_and),
                   .sum_out(sum_out),
                   .carry_out(carry_out)
                   );
    
   
//    assign sum_out = (bitwise_and ^ sum_in);
    
//    assign carry_out = (bitwise_and & sum_in);
    
    
endmodule
