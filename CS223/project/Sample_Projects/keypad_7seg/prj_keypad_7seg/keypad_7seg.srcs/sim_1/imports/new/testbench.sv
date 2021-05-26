`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2016 10:21:00 AM
// Design Name: 
// Module Name: testbench
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
module testbench();

logic clk;
logic a, b, c, d, e, f, g, dp;
logic [3:0] an;
logic [3:0] keyb_row;
logic [3:0] keyb_col = {4{1'b0}};

top DUT(
	.clk(clk), //100Mhz on Basys3
	
	//7-segment signals	
	.a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g), .dp(dp),
	.an(an),
	
	//keyboard matrix 
	.keyb_row(keyb_row),
	.keyb_col(keyb_col)
);

initial begin
	clk = 1'b0;
	keyb_col = 4'b1111;
	#6000000;
	
	keyb_col = 4'b1110;
	#40000000;

	keyb_col = 4'b1111;
	
	
end
  
always 
	#5  clk =  !clk;  

endmodule
