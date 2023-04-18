`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2023 08:46:50 PM
// Design Name: 
// Module Name: HA
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


module normal_HA(
    input sum_in,
    input carry_in,
    output carry_out,
    output sum_out
    );
    
    wire temp1, temp2, temp3;

    assign temp1 = sum_in | carry_in;
    assign temp2 = sum_in & carry_in;
    assign temp3 = ~temp2;
    
    
    assign sum_out = temp1 & temp3;
    
    assign carry_out = temp2;
    
endmodule
