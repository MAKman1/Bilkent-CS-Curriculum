`timescale 1 ps / 1 ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Hamzeh Ahangari
// 
// Create Date: 
// Design Name: 
// Module Name: 
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

// This module shows 4 decimal numbers on 4-digit 7-Segment.  
// 4 digits are scanned with high speed, then you do not notice that every time 
// only one of them is ON. dp is always off.

// LED positions inside 7-segment
//    A 
//  F   B
//    G
//  E   C
//    D      DP

// digit positions on Basys3 :
// in3(left), in2, in1, in0(right)

(* keep_hierarchy = "yes" *) 
module SevSeg_4digit(
 input clk,
 input [3:0] in0, in1, in2, in3, //user inputs for each digit (hexadecimal value)
 output a, b, c, d, e, f, g, dp, // just connect them to FPGA pins (individual LEDs).
 output [3:0] an   // just connect them to FPGA pins (enable vector for 4 digits, active low)
 );
 
// divide system clock (100Mhz for Basys3) by 2^N using a counter, which allows us to multiplex at lower speed
localparam N = 18;
logic [N-1:0] count = {N{1'b0}}; //initial value
always@ (posedge clk)
	count <= count + 1;

 
logic [3:0]digit_val; // multiplexer of digits
logic [3:0]digit_en;  // decoder of enable bits
 
always_comb
 begin
 digit_en = 4'b1111; 
 digit_val = in0; 
 
  case(count[N-1:N-2]) //using only the 2 MSB's of the counter 
    
   2'b00 :  //select first 7Seg.
    begin
     digit_val = in0;
     digit_en = 4'b1110;
    end
    
   2'b01:  //select second 7Seg.
    begin
     digit_val = in1;
     digit_en = 4'b1101;
    end
    
   2'b10:  //select third 7Seg.
    begin
     digit_val = in2;
     digit_en = 4'b1011;
    end
     
   2'b11:  //select forth 7Seg.
    begin
     digit_val = in3;
     digit_en = 4'b0111;
    end
  endcase
 end
 

//Convert digit value to LED vector. LEDs are active low.
logic [6:0] sseg_LEDs; 
always_comb
 begin 
  sseg_LEDs = 7'b1111111; //default
  case(digit_val)
   4'd0 : sseg_LEDs = 7'b1000000; //to display 0
   4'd1 : sseg_LEDs = 7'b1111001; //to display 1
   4'd2 : sseg_LEDs = 7'b0100100; //to display 2
   4'd3 : sseg_LEDs = 7'b0110000; //to display 3
   4'd4 : sseg_LEDs = 7'b0011001; //to display 4
   4'd5 : sseg_LEDs = 7'b0010010; //to display 5
   4'd6 : sseg_LEDs = 7'b0000010; //to display 6
   4'd7 : sseg_LEDs = 7'b1111000; //to display 7
   4'd8 : sseg_LEDs = 7'b0000000; //to display 8
   4'd9 : sseg_LEDs = 7'b0010000; //to display 9
   4'd10: sseg_LEDs = 7'b0001000; //to display a
   4'd11: sseg_LEDs = 7'b0000011; //to display b
   4'd12: sseg_LEDs = 7'b1000110; //to display c
   4'd13: sseg_LEDs = 7'b0100001; //to display d
   4'd14: sseg_LEDs = 7'b0000110; //to display e
   4'd15: sseg_LEDs = 7'b0001110; //to display f   
   default : sseg_LEDs = 7'b0111111; //dash
  endcase
 end
 
assign an = digit_en; 
assign {g, f, e, d, c, b, a} = sseg_LEDs; 
assign dp = 1'b1; //turn dp off
 
 
endmodule