`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2023 07:14:27 PM
// Design Name: 
// Module Name: rfa
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


module rfa (
input x_bitline,
    input y_bitline,
    input sum_in,
    input carry_in,
    output carry_out
    );
    
    wire temp1, temp2, temp3, temp4;
    
    assign temp1 = x_bitline & y_bitline;
    assign temp2 = sum_in & carry_in;
    assign temp3 = sum_in | carry_in;
    assign temp4 = temp1 & temp3;
    
    assign carry_out = temp4 | temp2;
    
    
endmodule
