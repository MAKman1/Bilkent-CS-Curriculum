`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Hamzeh Ahangari
// 
// Create Date: 
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision: 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module top(
	input clk, //100Mhz on Basys3

	// FPGA pins for 8x8 display
	output reset_out, //shift register's reset
	output OE, 	//output enable, active low 
	output SH_CP,  //pulse to the shift register
	output ST_CP,  //pulse to store shift register
	output DS, 	//shift register's serial input data
	output [7:0] col_select // active column, active high

	);
    
logic [2:0] col_num;

// initial value for RGB images:
//	image_???[0]     : left column  .... image_???[7]     : right column
//	image_???[?]'MSB : top line     .... image_???[?]'LSB : bottom line
logic [0:7] [7:0] image_red = 
{8'b00000000, 8'b00000000, 8'b0000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b01111100, 8'b00000000};
logic [0:7] [7:0]  image_green = 
{8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000};
logic [0:7] [7:0]  image_blue = 
{8'b00000000, 8'b00000000, 8'b01111000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000};


   
// This module displays 8x8 image on LED display module. 
display_8x8 display_8x8_0(
	.clk(clk),
	
	// RGB data for display current column
	.red_vect_in(image_red[col_num]),
	.green_vect_in(image_green[col_num]),
	.blue_vect_in(image_blue[col_num]),
	
	.col_data_capture(), // unused
	.col_num(col_num),
	
	// FPGA pins for display
	.reset_out(reset_out),
	.OE(OE),
	.SH_CP(SH_CP),
	.ST_CP(ST_CP),
	.DS(DS),
	.col_select(col_select)   
);
 
   
// move the image to right every half a second to make an animation
/*
logic [26:0] counter = {27{1'b0}}; 
always@ (posedge clk)
begin
	counter <= counter + 1;

	if ( counter == 27'd49_999_999 )
	begin
		counter <= {27{1'b0}}; 
		image_red   <= { image_red[7],   image_red[0:6]};
		image_green <= { image_green[7], image_green[0:6]};
		image_blue  <= { image_blue[7],  image_blue[0:6]};
	end

end
*/
 
 
endmodule




