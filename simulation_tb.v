`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2023 05:57:47 PM
// Design Name: 
// Module Name: top_sim
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
`timescale 1ns / 10ps

module top_sim();

parameter integer BIT_WIDTH = 6;
parameter integer RESULT_BIT_WIDTH = 8;

reg clk, reset;
reg [BIT_WIDTH - 1 : 0] op_x, op_y;
//wire [(2*BIT_WIDTH)-1 : 0] result_mul;
wire [(2*BIT_WIDTH)-1 : 0] result_expected;

wire [(RESULT_BIT_WIDTH - 1):0] result_trunc;
wire [(RESULT_BIT_WIDTH - 1):0] ideal_trunc;

integer x, y, ideal, trunc; 

//top_array_mult #(BIT_WIDTH) top_module  (.op_x(op_x), .op_y(op_y), .result_mul(result_mul));
array_t array_trunc(op_x, op_y, result_trunc);

initial begin 
    clk = 1'b1;
    reset = 1'b0;
    #10 reset = 1'b1;
    #10 reset = 1'b0;
    #10 reset = 1'b1;
end

always #10 clk = ~clk;
wire equal; 

always @(posedge clk or negedge reset) begin 
        if (!reset) begin 
            op_x <= 'b0;
            op_y <= 'b0;
       
        end else begin 
            op_x <= $random;
            op_y <= $random; 
            $fwrite(x,"%d ", op_x);     
            $fwrite(x,"%d ", op_y); 
            $fwrite(x,"%d ",result_expected);  
            $fwrite(x,"%d\n",result_trunc);
            
       end
end

assign result_expected = op_x * op_y;
assign ideal_trunc = result_expected[((2*BIT_WIDTH)-1)-:RESULT_BIT_WIDTH];
assign equal = ideal_trunc == result_expected;
initial begin
    x = $fopen("op_x.txt","w");

end

endmodule
