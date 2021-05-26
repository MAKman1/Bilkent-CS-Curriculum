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
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module top(
    input clk, //100Mhz on Basys3
	
	//7-segment signals
	output a, b, c, d, e, f, g, dp, 
    output [3:0] an,	
	
	//matrix  4x4 keypad
	output [3:0] keyb_row,
	input  [3:0] keyb_col
		
    );
    
//matrix keypad scanner
logic [3:0] key_value;
keypad4X4 keypad4X4_inst0(
	.clk(clk),
	.keyb_row(keyb_row), // just connect them to FPGA pins, row scanner
	.keyb_col(keyb_col), // just connect them to FPGA pins, column scanner
    .key_value(key_value), //user's output code for detected pressed key: row[1:0]_col[1:0]
    .key_valid(key_valid)  // user's output valid: if the key is pressed long enough (more than 20~40 ms), key_valid becomes '1' for just one clock cycle.
);	

//4 numbers to keep value of any of 4 digits
//user's hex inputs for 4 digits
logic [3:0] in0 = 4'h0; //initial value
logic [3:0] in1 = 4'h0; //initial value
logic [3:0] in2 = 4'h0; //initial value
logic [3:0] in3 = 4'h0; //initial value

// this module shows 4 hexadecimal numbers on 4-digit 7-Segment.  
// 4 digits are scanned with high speed, then you do not notice that every time 
// only one of them is ON. dp is always off.
SevSeg_4digit SevSeg_4digit_inst0(
	.clk(clk),
	.in3(in3), .in2(in2), .in1(in1), .in0(in0), //user inputs for each digit (hexadecimal)
	.a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g), .dp(dp), // just connect them to FPGA pins (individual LEDs).
	.an(an)   // just connect them to FPGA pins (enable vector for 4 digits active low) 
);

	
// run an example function for each key of keypad.
always@ (posedge clk)
if (key_valid == 1'b1) begin

	case(key_value) 
	4'b00_00:  //increments 1st digit of 7-segment.
		in0 <= in0 + 4'd1;	

	4'b00_01:  //increments 1st digit of 7-segment.
		in0 <= in0 + 4'd2;

	4'b00_10:  //increments 1st digit of 7-segment.
		in0 <= in0 + 4'd3;

	4'b00_11:  //increments 1st digit of 7-segment.
		in0 <= in0 + 4'd4;		

	4'b01_00:  //increments 2nd digit of 7-segment.
		in1 <= in1 + 4'd1;	
		
	4'b01_01:  //increments 2nd digit of 7-segment.
		in1 <= in1 + 4'd2;
		
	4'b01_10:  //increments 2nd digit of 7-segment.
		in1 <= in1 + 4'd3;
		
	4'b01_11:  //increments 2nd digit of 7-segment.
		in1 <= in1 + 4'd4;		
		
	4'b10_00:  //increments 3rd digit of 7-segment.
		in2 <= in2 + 4'd1;

	4'b10_01:  //increments 3rd digit of 7-segment.
		in2 <= in2 + 4'd2;

	4'b10_10:  //increments 3rd digit of 7-segment.
		in2 <= in2 + 4'd3;

	4'b10_11:  //increments 3rd digit of 7-segment.
		in2 <= in2 + 4'd4;	
		
	4'b11_00:  //increments 4th digit of 7-segment.
		in3 <= in3 + 4'd1;

	4'b11_01:  //increments 4th digit of 7-segment.
		in3 <= in3 + 4'd2;	

	4'b11_10:  //increments 4th digit of 7-segment.
		in3 <= in3 + 4'd3;

	4'b11_11:  //increments 4th digit of 7-segment.
		in3 <= in3 + 4'd4;		
			

	//default:
		//nothing
		
	endcase

end//if

    
    
endmodule




