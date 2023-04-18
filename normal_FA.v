`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2023 08:24:57 PM
// Design Name: 
// Module Name: FA
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


module normal_FA(
    input sum_in,
    input carry_in,
    input side_sum_in,
    output carry_out,
    output sum_out
    );
    
    wire temp1, temp2, temp3;
    
    normal_HA i_HA_1(.sum_in(sum_in),
                     .carry_in(carry_in),
                     .sum_out(temp1),
                     .carry_out(temp2)
                     );
                     
    normal_HA i_HA_2(.sum_in(temp1),
                     .carry_in(side_sum_in),
                     .sum_out(sum_out),
                     .carry_out(temp3)
                     );
                     
    assign carry_out = temp2 | temp3;
    
    
    //assign sum_out = (~side_sum_in & ~sum_in & carry_in) | (~side_sum_in & sum_in & ~carry_in) | (side_sum_in & ~sum_in & ~carry_in) | (side_sum_in & sum_in & carry_in);
    
    //assign carry_out = (side_sum_in & sum_in) | (side_sum_in & carry_in) | (sum_in & carry_in);

endmodule
