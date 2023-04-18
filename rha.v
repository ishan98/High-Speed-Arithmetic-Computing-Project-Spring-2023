`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2023 07:13:35 PM
// Design Name: 
// Module Name: rha
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


module rha(
        input x_bitline,
        input y_bitline,
        input sum_in,
        output carry_out
        );
        
wire temp1;

assign temp1 = x_bitline & y_bitline;

assign carry_out = temp1 & sum_in;
        
endmodule
