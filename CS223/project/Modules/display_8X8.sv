// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: 
// Date        : 
// Host        : 
// Command     : write_verilog 
// Design      : 
// Purpose     : This is a Verilog netlist.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
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
// Revision: 1.0
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

// This module displays 8x8 image on LED display module.  
(* M = "10" *) (* N = "8" *)
(* keep_hierarchy = "yes" *) 
module display_8x8
   (clk, //100Mhz on Basys3
    
    red_vect_in,
    green_vect_in, // due to problem with Beti boards, green light is very week, hardly can be seen.
    blue_vect_in,
    
    col_data_capture, // a single pulse, showing the moment of capturing the data (Frequency is about 480 columns per second, or 60 full images per second ).
    col_num,	// showing the current column to be captured next, rotating from 0 to 7.
    
    // just connect below ports to FPGA pins.    
    reset_out,  //shift register's reset
    OE, //output enable, active low
    SH_CP, //shift register's clock pulse
    ST_CP, //store register's clock pulse
    DS, //shift register's serial input data
    col_select);
    
  input clk;
  input [7:0]red_vect_in;
  input [7:0]green_vect_in;
  input [7:0]blue_vect_in;
  output col_data_capture;
  output [2:0]col_num;
  output reset_out;
  output OE;
  output SH_CP;
  output ST_CP;
  output DS;
  output [7:0]col_select;

  wire \<const0> ;
  wire \<const1> ;
  wire DS;
  wire OE;
  wire SH_CP;
  wire ST_CP;
  wire \bit_sent_count[0]_i_1_n_0 ;
  wire \bit_sent_count[1]_i_1_n_0 ;
  wire \bit_sent_count[2]_i_1_n_0 ;
  wire \bit_sent_count[3]_i_1_n_0 ;
  wire \bit_sent_count[4]_i_1_n_0 ;
  wire \bit_sent_count[4]_i_2_n_0 ;
  wire \bit_sent_count_reg_n_0_[0] ;
  wire \bit_sent_count_reg_n_0_[1] ;
  wire \bit_sent_count_reg_n_0_[2] ;
  wire \bit_sent_count_reg_n_0_[3] ;
  wire \bit_sent_count_reg_n_0_[4] ;
  wire [7:0]blue_vect_in;
  wire clk;
  wire clk_en_slow;
  wire clk_en_slow_i_2_n_0;
  wire \cnt_clkdiv[7]_i_2_n_0 ;
  wire [7:0]cnt_clkdiv_reg__0;
  wire col_cnt;
  wire \col_cnt[0]_i_1_n_0 ;
  wire \col_cnt[1]_i_1_n_0 ;
  wire \col_cnt[2]_i_1_n_0 ;
  wire col_data_capture;
  wire col_data_capture_INST_0_i_1_n_0;
  wire col_data_capture_INST_0_i_2_n_0;
  wire [2:0]col_num;
  wire [7:0]col_select;
  wire \color_data[0]_i_1_n_0 ;
  wire \color_data[0]_i_2_n_0 ;
  wire \color_data[0]_i_3_n_0 ;
  wire \color_data[0]_i_4_n_0 ;
  wire \color_data[10]_i_1_n_0 ;
  wire \color_data[11]_i_1_n_0 ;
  wire \color_data[12]_i_1_n_0 ;
  wire \color_data[13]_i_1_n_0 ;
  wire \color_data[14]_i_1_n_0 ;
  wire \color_data[15]_i_1_n_0 ;
  wire \color_data[16]_i_1_n_0 ;
  wire \color_data[17]_i_1_n_0 ;
  wire \color_data[18]_i_1_n_0 ;
  wire \color_data[19]_i_1_n_0 ;
  wire \color_data[1]_i_1_n_0 ;
  wire \color_data[20]_i_1_n_0 ;
  wire \color_data[21]_i_1_n_0 ;
  wire \color_data[22]_i_1_n_0 ;
  wire \color_data[23]_i_1_n_0 ;
  wire \color_data[2]_i_1_n_0 ;
  wire \color_data[3]_i_1_n_0 ;
  wire \color_data[4]_i_1_n_0 ;
  wire \color_data[5]_i_1_n_0 ;
  wire \color_data[6]_i_1_n_0 ;
  wire \color_data[7]_i_1_n_0 ;
  wire \color_data[8]_i_1_n_0 ;
  wire \color_data[9]_i_1_n_0 ;
  wire \color_data_reg_n_0_[10] ;
  wire \color_data_reg_n_0_[11] ;
  wire \color_data_reg_n_0_[12] ;
  wire \color_data_reg_n_0_[13] ;
  wire \color_data_reg_n_0_[14] ;
  wire \color_data_reg_n_0_[15] ;
  wire \color_data_reg_n_0_[16] ;
  wire \color_data_reg_n_0_[17] ;
  wire \color_data_reg_n_0_[18] ;
  wire \color_data_reg_n_0_[19] ;
  wire \color_data_reg_n_0_[1] ;
  wire \color_data_reg_n_0_[20] ;
  wire \color_data_reg_n_0_[21] ;
  wire \color_data_reg_n_0_[22] ;
  wire \color_data_reg_n_0_[23] ;
  wire \color_data_reg_n_0_[2] ;
  wire \color_data_reg_n_0_[3] ;
  wire \color_data_reg_n_0_[4] ;
  wire \color_data_reg_n_0_[5] ;
  wire \color_data_reg_n_0_[6] ;
  wire \color_data_reg_n_0_[7] ;
  wire \color_data_reg_n_0_[8] ;
  wire \color_data_reg_n_0_[9] ;
  wire [9:1]data0;
  wire [7:0]green_vect_in;
  wire \op_count[0]_i_1_n_0 ;
  wire \op_count[6]_i_2_n_0 ;
  wire \op_count[9]_i_1_n_0 ;
  wire \op_count[9]_i_3_n_0 ;
  wire \op_count[9]_i_4_n_0 ;
  wire \op_count[9]_i_5_n_0 ;
  wire \op_count[9]_i_6_n_0 ;
  wire \op_count_reg_n_0_[0] ;
  wire \op_count_reg_n_0_[1] ;
  wire \op_count_reg_n_0_[2] ;
  wire \op_count_reg_n_0_[3] ;
  wire \op_count_reg_n_0_[4] ;
  wire \op_count_reg_n_0_[5] ;
  wire \op_count_reg_n_0_[6] ;
  wire \op_count_reg_n_0_[7] ;
  wire \op_count_reg_n_0_[8] ;
  wire \op_count_reg_n_0_[9] ;
  wire p_0_in;
  wire [7:0]p_0_in__0;
  wire [7:0]red_vect_in;
  wire reset_out;

  GND GND
       (.G(\<const0> ));
  LUT2 #(
    .INIT(4'h7)) 
    OE_INST_0
       (.I0(\bit_sent_count_reg_n_0_[4] ),
        .I1(\bit_sent_count_reg_n_0_[3] ),
        .O(OE));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'h8F)) 
    SH_CP_INST_0
       (.I0(\bit_sent_count_reg_n_0_[3] ),
        .I1(\bit_sent_count_reg_n_0_[4] ),
        .I2(\op_count_reg_n_0_[0] ),
        .O(SH_CP));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    ST_CP_INST_0
       (.I0(\op_count_reg_n_0_[0] ),
        .I1(\bit_sent_count_reg_n_0_[4] ),
        .I2(\bit_sent_count_reg_n_0_[3] ),
        .O(ST_CP));
  VCC VCC
       (.P(\<const1> ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \bit_sent_count[0]_i_1 
       (.I0(\color_data[0]_i_3_n_0 ),
        .I1(\bit_sent_count_reg_n_0_[0] ),
        .O(\bit_sent_count[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'h14)) 
    \bit_sent_count[1]_i_1 
       (.I0(\color_data[0]_i_3_n_0 ),
        .I1(\bit_sent_count_reg_n_0_[0] ),
        .I2(\bit_sent_count_reg_n_0_[1] ),
        .O(\bit_sent_count[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h1540)) 
    \bit_sent_count[2]_i_1 
       (.I0(\color_data[0]_i_3_n_0 ),
        .I1(\bit_sent_count_reg_n_0_[0] ),
        .I2(\bit_sent_count_reg_n_0_[1] ),
        .I3(\bit_sent_count_reg_n_0_[2] ),
        .O(\bit_sent_count[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h15554000)) 
    \bit_sent_count[3]_i_1 
       (.I0(\color_data[0]_i_3_n_0 ),
        .I1(\bit_sent_count_reg_n_0_[1] ),
        .I2(\bit_sent_count_reg_n_0_[0] ),
        .I3(\bit_sent_count_reg_n_0_[2] ),
        .I4(\bit_sent_count_reg_n_0_[3] ),
        .O(\bit_sent_count[3]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hBA)) 
    \bit_sent_count[4]_i_1 
       (.I0(col_cnt),
        .I1(\color_data[0]_i_3_n_0 ),
        .I2(clk_en_slow),
        .O(\bit_sent_count[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h1555555540000000)) 
    \bit_sent_count[4]_i_2 
       (.I0(\color_data[0]_i_3_n_0 ),
        .I1(\bit_sent_count_reg_n_0_[3] ),
        .I2(\bit_sent_count_reg_n_0_[2] ),
        .I3(\bit_sent_count_reg_n_0_[0] ),
        .I4(\bit_sent_count_reg_n_0_[1] ),
        .I5(\bit_sent_count_reg_n_0_[4] ),
        .O(\bit_sent_count[4]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bit_sent_count_reg[0] 
       (.C(clk),
        .CE(\bit_sent_count[4]_i_1_n_0 ),
        .D(\bit_sent_count[0]_i_1_n_0 ),
        .Q(\bit_sent_count_reg_n_0_[0] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \bit_sent_count_reg[1] 
       (.C(clk),
        .CE(\bit_sent_count[4]_i_1_n_0 ),
        .D(\bit_sent_count[1]_i_1_n_0 ),
        .Q(\bit_sent_count_reg_n_0_[1] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \bit_sent_count_reg[2] 
       (.C(clk),
        .CE(\bit_sent_count[4]_i_1_n_0 ),
        .D(\bit_sent_count[2]_i_1_n_0 ),
        .Q(\bit_sent_count_reg_n_0_[2] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \bit_sent_count_reg[3] 
       (.C(clk),
        .CE(\bit_sent_count[4]_i_1_n_0 ),
        .D(\bit_sent_count[3]_i_1_n_0 ),
        .Q(\bit_sent_count_reg_n_0_[3] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \bit_sent_count_reg[4] 
       (.C(clk),
        .CE(\bit_sent_count[4]_i_1_n_0 ),
        .D(\bit_sent_count[4]_i_2_n_0 ),
        .Q(\bit_sent_count_reg_n_0_[4] ),
        .R(\<const0> ));
  LUT5 #(
    .INIT(32'h00000001)) 
    clk_en_slow_i_1
       (.I0(cnt_clkdiv_reg__0[4]),
        .I1(cnt_clkdiv_reg__0[5]),
        .I2(cnt_clkdiv_reg__0[7]),
        .I3(cnt_clkdiv_reg__0[6]),
        .I4(clk_en_slow_i_2_n_0),
        .O(p_0_in));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    clk_en_slow_i_2
       (.I0(cnt_clkdiv_reg__0[1]),
        .I1(cnt_clkdiv_reg__0[0]),
        .I2(cnt_clkdiv_reg__0[3]),
        .I3(cnt_clkdiv_reg__0[2]),
        .O(clk_en_slow_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    clk_en_slow_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(p_0_in),
        .Q(clk_en_slow),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \cnt_clkdiv[0]_i_1 
       (.I0(cnt_clkdiv_reg__0[0]),
        .O(p_0_in__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \cnt_clkdiv[1]_i_1 
       (.I0(cnt_clkdiv_reg__0[0]),
        .I1(cnt_clkdiv_reg__0[1]),
        .O(p_0_in__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \cnt_clkdiv[2]_i_1 
       (.I0(cnt_clkdiv_reg__0[0]),
        .I1(cnt_clkdiv_reg__0[1]),
        .I2(cnt_clkdiv_reg__0[2]),
        .O(p_0_in__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \cnt_clkdiv[3]_i_1 
       (.I0(cnt_clkdiv_reg__0[1]),
        .I1(cnt_clkdiv_reg__0[0]),
        .I2(cnt_clkdiv_reg__0[2]),
        .I3(cnt_clkdiv_reg__0[3]),
        .O(p_0_in__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \cnt_clkdiv[4]_i_1 
       (.I0(cnt_clkdiv_reg__0[2]),
        .I1(cnt_clkdiv_reg__0[0]),
        .I2(cnt_clkdiv_reg__0[1]),
        .I3(cnt_clkdiv_reg__0[3]),
        .I4(cnt_clkdiv_reg__0[4]),
        .O(p_0_in__0[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \cnt_clkdiv[5]_i_1 
       (.I0(cnt_clkdiv_reg__0[3]),
        .I1(cnt_clkdiv_reg__0[1]),
        .I2(cnt_clkdiv_reg__0[0]),
        .I3(cnt_clkdiv_reg__0[2]),
        .I4(cnt_clkdiv_reg__0[4]),
        .I5(cnt_clkdiv_reg__0[5]),
        .O(p_0_in__0[5]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \cnt_clkdiv[6]_i_1 
       (.I0(\cnt_clkdiv[7]_i_2_n_0 ),
        .I1(cnt_clkdiv_reg__0[6]),
        .O(p_0_in__0[6]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \cnt_clkdiv[7]_i_1 
       (.I0(\cnt_clkdiv[7]_i_2_n_0 ),
        .I1(cnt_clkdiv_reg__0[6]),
        .I2(cnt_clkdiv_reg__0[7]),
        .O(p_0_in__0[7]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \cnt_clkdiv[7]_i_2 
       (.I0(cnt_clkdiv_reg__0[5]),
        .I1(cnt_clkdiv_reg__0[3]),
        .I2(cnt_clkdiv_reg__0[1]),
        .I3(cnt_clkdiv_reg__0[0]),
        .I4(cnt_clkdiv_reg__0[2]),
        .I5(cnt_clkdiv_reg__0[4]),
        .O(\cnt_clkdiv[7]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_clkdiv_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(p_0_in__0[0]),
        .Q(cnt_clkdiv_reg__0[0]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_clkdiv_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(p_0_in__0[1]),
        .Q(cnt_clkdiv_reg__0[1]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_clkdiv_reg[2] 
       (.C(clk),
        .CE(\<const1> ),
        .D(p_0_in__0[2]),
        .Q(cnt_clkdiv_reg__0[2]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_clkdiv_reg[3] 
       (.C(clk),
        .CE(\<const1> ),
        .D(p_0_in__0[3]),
        .Q(cnt_clkdiv_reg__0[3]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_clkdiv_reg[4] 
       (.C(clk),
        .CE(\<const1> ),
        .D(p_0_in__0[4]),
        .Q(cnt_clkdiv_reg__0[4]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_clkdiv_reg[5] 
       (.C(clk),
        .CE(\<const1> ),
        .D(p_0_in__0[5]),
        .Q(cnt_clkdiv_reg__0[5]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_clkdiv_reg[6] 
       (.C(clk),
        .CE(\<const1> ),
        .D(p_0_in__0[6]),
        .Q(cnt_clkdiv_reg__0[6]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_clkdiv_reg[7] 
       (.C(clk),
        .CE(\<const1> ),
        .D(p_0_in__0[7]),
        .Q(cnt_clkdiv_reg__0[7]),
        .R(\<const0> ));
  LUT2 #(
    .INIT(4'h6)) 
    \col_cnt[0]_i_1 
       (.I0(col_cnt),
        .I1(col_num[0]),
        .O(\col_cnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \col_cnt[1]_i_1 
       (.I0(col_num[0]),
        .I1(col_cnt),
        .I2(col_num[1]),
        .O(\col_cnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \col_cnt[2]_i_1 
       (.I0(col_num[1]),
        .I1(col_num[0]),
        .I2(col_cnt),
        .I3(col_num[2]),
        .O(\col_cnt[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000800000000000)) 
    \col_cnt[2]_i_2 
       (.I0(\op_count_reg_n_0_[5] ),
        .I1(\op_count_reg_n_0_[4] ),
        .I2(\op_count_reg_n_0_[9] ),
        .I3(\op_count_reg_n_0_[8] ),
        .I4(\op_count[6]_i_2_n_0 ),
        .I5(col_data_capture_INST_0_i_2_n_0),
        .O(col_cnt));
  FDRE #(
    .INIT(1'b0)) 
    \col_cnt_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\col_cnt[0]_i_1_n_0 ),
        .Q(col_num[0]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \col_cnt_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\col_cnt[1]_i_1_n_0 ),
        .Q(col_num[1]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \col_cnt_reg[2] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\col_cnt[2]_i_1_n_0 ),
        .Q(col_num[2]),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    col_data_capture_INST_0
       (.I0(col_data_capture_INST_0_i_1_n_0),
        .I1(\op_count_reg_n_0_[0] ),
        .I2(\op_count_reg_n_0_[1] ),
        .I3(col_data_capture_INST_0_i_2_n_0),
        .O(col_data_capture));
  LUT4 #(
    .INIT(16'hFFFE)) 
    col_data_capture_INST_0_i_1
       (.I0(\op_count_reg_n_0_[9] ),
        .I1(\op_count_reg_n_0_[5] ),
        .I2(\op_count_reg_n_0_[4] ),
        .I3(\op_count_reg_n_0_[8] ),
        .O(col_data_capture_INST_0_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h00000004)) 
    col_data_capture_INST_0_i_2
       (.I0(\op_count_reg_n_0_[2] ),
        .I1(clk_en_slow),
        .I2(\op_count_reg_n_0_[6] ),
        .I3(\op_count_reg_n_0_[7] ),
        .I4(\op_count_reg_n_0_[3] ),
        .O(col_data_capture_INST_0_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \col_select[0]_INST_0 
       (.I0(col_num[1]),
        .I1(col_num[2]),
        .I2(col_num[0]),
        .O(col_select[0]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \col_select[1]_INST_0 
       (.I0(col_num[1]),
        .I1(col_num[2]),
        .I2(col_num[0]),
        .O(col_select[1]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \col_select[2]_INST_0 
       (.I0(col_num[2]),
        .I1(col_num[0]),
        .I2(col_num[1]),
        .O(col_select[2]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \col_select[3]_INST_0 
       (.I0(col_num[0]),
        .I1(col_num[2]),
        .I2(col_num[1]),
        .O(col_select[3]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \col_select[4]_INST_0 
       (.I0(col_num[1]),
        .I1(col_num[0]),
        .I2(col_num[2]),
        .O(col_select[4]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \col_select[5]_INST_0 
       (.I0(col_num[0]),
        .I1(col_num[1]),
        .I2(col_num[2]),
        .O(col_select[5]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \col_select[6]_INST_0 
       (.I0(col_num[2]),
        .I1(col_num[0]),
        .I2(col_num[1]),
        .O(col_select[6]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \col_select[7]_INST_0 
       (.I0(col_num[2]),
        .I1(col_num[0]),
        .I2(col_num[1]),
        .O(col_select[7]));
  LUT6 #(
    .INIT(64'h0100FFFF01000100)) 
    \color_data[0]_i_1 
       (.I0(col_data_capture_INST_0_i_1_n_0),
        .I1(\op_count_reg_n_0_[0] ),
        .I2(\op_count_reg_n_0_[1] ),
        .I3(col_data_capture_INST_0_i_2_n_0),
        .I4(\color_data[0]_i_3_n_0 ),
        .I5(clk_en_slow),
        .O(\color_data[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \color_data[0]_i_2 
       (.I0(blue_vect_in[0]),
        .I1(\color_data[0]_i_3_n_0 ),
        .I2(\color_data_reg_n_0_[1] ),
        .O(\color_data[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0111FFFFFFFFFFFF)) 
    \color_data[0]_i_3 
       (.I0(col_data_capture_INST_0_i_1_n_0),
        .I1(\color_data[0]_i_4_n_0 ),
        .I2(\op_count_reg_n_0_[2] ),
        .I3(\op_count_reg_n_0_[1] ),
        .I4(OE),
        .I5(\op_count_reg_n_0_[0] ),
        .O(\color_data[0]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \color_data[0]_i_4 
       (.I0(\op_count_reg_n_0_[3] ),
        .I1(\op_count_reg_n_0_[7] ),
        .I2(\op_count_reg_n_0_[6] ),
        .O(\color_data[0]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \color_data[10]_i_1 
       (.I0(green_vect_in[2]),
        .I1(\color_data[0]_i_3_n_0 ),
        .I2(\color_data_reg_n_0_[11] ),
        .O(\color_data[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \color_data[11]_i_1 
       (.I0(green_vect_in[3]),
        .I1(\color_data[0]_i_3_n_0 ),
        .I2(\color_data_reg_n_0_[12] ),
        .O(\color_data[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \color_data[12]_i_1 
       (.I0(green_vect_in[4]),
        .I1(\color_data[0]_i_3_n_0 ),
        .I2(\color_data_reg_n_0_[13] ),
        .O(\color_data[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \color_data[13]_i_1 
       (.I0(green_vect_in[5]),
        .I1(\color_data[0]_i_3_n_0 ),
        .I2(\color_data_reg_n_0_[14] ),
        .O(\color_data[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \color_data[14]_i_1 
       (.I0(green_vect_in[6]),
        .I1(\color_data[0]_i_3_n_0 ),
        .I2(\color_data_reg_n_0_[15] ),
        .O(\color_data[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \color_data[15]_i_1 
       (.I0(green_vect_in[7]),
        .I1(\color_data[0]_i_3_n_0 ),
        .I2(\color_data_reg_n_0_[16] ),
        .O(\color_data[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \color_data[16]_i_1 
       (.I0(red_vect_in[0]),
        .I1(\color_data[0]_i_3_n_0 ),
        .I2(\color_data_reg_n_0_[17] ),
        .O(\color_data[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \color_data[17]_i_1 
       (.I0(red_vect_in[1]),
        .I1(\color_data[0]_i_3_n_0 ),
        .I2(\color_data_reg_n_0_[18] ),
        .O(\color_data[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \color_data[18]_i_1 
       (.I0(red_vect_in[2]),
        .I1(\color_data[0]_i_3_n_0 ),
        .I2(\color_data_reg_n_0_[19] ),
        .O(\color_data[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \color_data[19]_i_1 
       (.I0(red_vect_in[3]),
        .I1(\color_data[0]_i_3_n_0 ),
        .I2(\color_data_reg_n_0_[20] ),
        .O(\color_data[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \color_data[1]_i_1 
       (.I0(blue_vect_in[1]),
        .I1(\color_data[0]_i_3_n_0 ),
        .I2(\color_data_reg_n_0_[2] ),
        .O(\color_data[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \color_data[20]_i_1 
       (.I0(red_vect_in[4]),
        .I1(\color_data[0]_i_3_n_0 ),
        .I2(\color_data_reg_n_0_[21] ),
        .O(\color_data[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \color_data[21]_i_1 
       (.I0(red_vect_in[5]),
        .I1(\color_data[0]_i_3_n_0 ),
        .I2(\color_data_reg_n_0_[22] ),
        .O(\color_data[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \color_data[22]_i_1 
       (.I0(red_vect_in[6]),
        .I1(\color_data[0]_i_3_n_0 ),
        .I2(\color_data_reg_n_0_[23] ),
        .O(\color_data[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \color_data[23]_i_1 
       (.I0(\color_data[0]_i_3_n_0 ),
        .I1(red_vect_in[7]),
        .O(\color_data[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \color_data[2]_i_1 
       (.I0(blue_vect_in[2]),
        .I1(\color_data[0]_i_3_n_0 ),
        .I2(\color_data_reg_n_0_[3] ),
        .O(\color_data[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \color_data[3]_i_1 
       (.I0(blue_vect_in[3]),
        .I1(\color_data[0]_i_3_n_0 ),
        .I2(\color_data_reg_n_0_[4] ),
        .O(\color_data[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \color_data[4]_i_1 
       (.I0(blue_vect_in[4]),
        .I1(\color_data[0]_i_3_n_0 ),
        .I2(\color_data_reg_n_0_[5] ),
        .O(\color_data[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \color_data[5]_i_1 
       (.I0(blue_vect_in[5]),
        .I1(\color_data[0]_i_3_n_0 ),
        .I2(\color_data_reg_n_0_[6] ),
        .O(\color_data[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \color_data[6]_i_1 
       (.I0(blue_vect_in[6]),
        .I1(\color_data[0]_i_3_n_0 ),
        .I2(\color_data_reg_n_0_[7] ),
        .O(\color_data[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \color_data[7]_i_1 
       (.I0(blue_vect_in[7]),
        .I1(\color_data[0]_i_3_n_0 ),
        .I2(\color_data_reg_n_0_[8] ),
        .O(\color_data[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \color_data[8]_i_1 
       (.I0(green_vect_in[0]),
        .I1(\color_data[0]_i_3_n_0 ),
        .I2(\color_data_reg_n_0_[9] ),
        .O(\color_data[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \color_data[9]_i_1 
       (.I0(green_vect_in[1]),
        .I1(\color_data[0]_i_3_n_0 ),
        .I2(\color_data_reg_n_0_[10] ),
        .O(\color_data[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \color_data_reg[0] 
       (.C(clk),
        .CE(\color_data[0]_i_1_n_0 ),
        .D(\color_data[0]_i_2_n_0 ),
        .Q(DS),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \color_data_reg[10] 
       (.C(clk),
        .CE(\color_data[0]_i_1_n_0 ),
        .D(\color_data[10]_i_1_n_0 ),
        .Q(\color_data_reg_n_0_[10] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \color_data_reg[11] 
       (.C(clk),
        .CE(\color_data[0]_i_1_n_0 ),
        .D(\color_data[11]_i_1_n_0 ),
        .Q(\color_data_reg_n_0_[11] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \color_data_reg[12] 
       (.C(clk),
        .CE(\color_data[0]_i_1_n_0 ),
        .D(\color_data[12]_i_1_n_0 ),
        .Q(\color_data_reg_n_0_[12] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \color_data_reg[13] 
       (.C(clk),
        .CE(\color_data[0]_i_1_n_0 ),
        .D(\color_data[13]_i_1_n_0 ),
        .Q(\color_data_reg_n_0_[13] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \color_data_reg[14] 
       (.C(clk),
        .CE(\color_data[0]_i_1_n_0 ),
        .D(\color_data[14]_i_1_n_0 ),
        .Q(\color_data_reg_n_0_[14] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \color_data_reg[15] 
       (.C(clk),
        .CE(\color_data[0]_i_1_n_0 ),
        .D(\color_data[15]_i_1_n_0 ),
        .Q(\color_data_reg_n_0_[15] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \color_data_reg[16] 
       (.C(clk),
        .CE(\color_data[0]_i_1_n_0 ),
        .D(\color_data[16]_i_1_n_0 ),
        .Q(\color_data_reg_n_0_[16] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \color_data_reg[17] 
       (.C(clk),
        .CE(\color_data[0]_i_1_n_0 ),
        .D(\color_data[17]_i_1_n_0 ),
        .Q(\color_data_reg_n_0_[17] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \color_data_reg[18] 
       (.C(clk),
        .CE(\color_data[0]_i_1_n_0 ),
        .D(\color_data[18]_i_1_n_0 ),
        .Q(\color_data_reg_n_0_[18] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \color_data_reg[19] 
       (.C(clk),
        .CE(\color_data[0]_i_1_n_0 ),
        .D(\color_data[19]_i_1_n_0 ),
        .Q(\color_data_reg_n_0_[19] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \color_data_reg[1] 
       (.C(clk),
        .CE(\color_data[0]_i_1_n_0 ),
        .D(\color_data[1]_i_1_n_0 ),
        .Q(\color_data_reg_n_0_[1] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \color_data_reg[20] 
       (.C(clk),
        .CE(\color_data[0]_i_1_n_0 ),
        .D(\color_data[20]_i_1_n_0 ),
        .Q(\color_data_reg_n_0_[20] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \color_data_reg[21] 
       (.C(clk),
        .CE(\color_data[0]_i_1_n_0 ),
        .D(\color_data[21]_i_1_n_0 ),
        .Q(\color_data_reg_n_0_[21] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \color_data_reg[22] 
       (.C(clk),
        .CE(\color_data[0]_i_1_n_0 ),
        .D(\color_data[22]_i_1_n_0 ),
        .Q(\color_data_reg_n_0_[22] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \color_data_reg[23] 
       (.C(clk),
        .CE(\color_data[0]_i_1_n_0 ),
        .D(\color_data[23]_i_1_n_0 ),
        .Q(\color_data_reg_n_0_[23] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \color_data_reg[2] 
       (.C(clk),
        .CE(\color_data[0]_i_1_n_0 ),
        .D(\color_data[2]_i_1_n_0 ),
        .Q(\color_data_reg_n_0_[2] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \color_data_reg[3] 
       (.C(clk),
        .CE(\color_data[0]_i_1_n_0 ),
        .D(\color_data[3]_i_1_n_0 ),
        .Q(\color_data_reg_n_0_[3] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \color_data_reg[4] 
       (.C(clk),
        .CE(\color_data[0]_i_1_n_0 ),
        .D(\color_data[4]_i_1_n_0 ),
        .Q(\color_data_reg_n_0_[4] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \color_data_reg[5] 
       (.C(clk),
        .CE(\color_data[0]_i_1_n_0 ),
        .D(\color_data[5]_i_1_n_0 ),
        .Q(\color_data_reg_n_0_[5] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \color_data_reg[6] 
       (.C(clk),
        .CE(\color_data[0]_i_1_n_0 ),
        .D(\color_data[6]_i_1_n_0 ),
        .Q(\color_data_reg_n_0_[6] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \color_data_reg[7] 
       (.C(clk),
        .CE(\color_data[0]_i_1_n_0 ),
        .D(\color_data[7]_i_1_n_0 ),
        .Q(\color_data_reg_n_0_[7] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \color_data_reg[8] 
       (.C(clk),
        .CE(\color_data[0]_i_1_n_0 ),
        .D(\color_data[8]_i_1_n_0 ),
        .Q(\color_data_reg_n_0_[8] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \color_data_reg[9] 
       (.C(clk),
        .CE(\color_data[0]_i_1_n_0 ),
        .D(\color_data[9]_i_1_n_0 ),
        .Q(\color_data_reg_n_0_[9] ),
        .R(\<const0> ));
  LUT1 #(
    .INIT(2'h1)) 
    \op_count[0]_i_1 
       (.I0(\op_count_reg_n_0_[0] ),
        .O(\op_count[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \op_count[1]_i_1 
       (.I0(\op_count_reg_n_0_[0] ),
        .I1(\op_count_reg_n_0_[1] ),
        .O(data0[1]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \op_count[2]_i_1 
       (.I0(\op_count_reg_n_0_[1] ),
        .I1(\op_count_reg_n_0_[0] ),
        .I2(\op_count_reg_n_0_[2] ),
        .O(data0[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \op_count[3]_i_1 
       (.I0(\op_count_reg_n_0_[2] ),
        .I1(\op_count_reg_n_0_[0] ),
        .I2(\op_count_reg_n_0_[1] ),
        .I3(\op_count_reg_n_0_[3] ),
        .O(data0[3]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \op_count[4]_i_1 
       (.I0(\op_count_reg_n_0_[3] ),
        .I1(\op_count_reg_n_0_[1] ),
        .I2(\op_count_reg_n_0_[0] ),
        .I3(\op_count_reg_n_0_[2] ),
        .I4(\op_count_reg_n_0_[4] ),
        .O(data0[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \op_count[5]_i_1 
       (.I0(\op_count_reg_n_0_[2] ),
        .I1(\op_count_reg_n_0_[0] ),
        .I2(\op_count_reg_n_0_[1] ),
        .I3(\op_count_reg_n_0_[3] ),
        .I4(\op_count_reg_n_0_[4] ),
        .I5(\op_count_reg_n_0_[5] ),
        .O(data0[5]));
  LUT6 #(
    .INIT(64'hFF7FFFFF00800000)) 
    \op_count[6]_i_1 
       (.I0(\op_count_reg_n_0_[5] ),
        .I1(\op_count_reg_n_0_[4] ),
        .I2(\op_count_reg_n_0_[3] ),
        .I3(\op_count[6]_i_2_n_0 ),
        .I4(\op_count_reg_n_0_[2] ),
        .I5(\op_count_reg_n_0_[6] ),
        .O(data0[6]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \op_count[6]_i_2 
       (.I0(\op_count_reg_n_0_[0] ),
        .I1(\op_count_reg_n_0_[1] ),
        .O(\op_count[6]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \op_count[7]_i_1 
       (.I0(\op_count[9]_i_6_n_0 ),
        .I1(\op_count_reg_n_0_[6] ),
        .I2(\op_count_reg_n_0_[7] ),
        .O(data0[7]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hF708)) 
    \op_count[8]_i_1 
       (.I0(\op_count_reg_n_0_[7] ),
        .I1(\op_count_reg_n_0_[6] ),
        .I2(\op_count[9]_i_6_n_0 ),
        .I3(\op_count_reg_n_0_[8] ),
        .O(data0[8]));
  LUT4 #(
    .INIT(16'h0002)) 
    \op_count[9]_i_1 
       (.I0(clk_en_slow),
        .I1(\op_count[9]_i_3_n_0 ),
        .I2(\op_count[9]_i_4_n_0 ),
        .I3(\op_count[9]_i_5_n_0 ),
        .O(\op_count[9]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hDFFF2000)) 
    \op_count[9]_i_2 
       (.I0(\op_count_reg_n_0_[8] ),
        .I1(\op_count[9]_i_6_n_0 ),
        .I2(\op_count_reg_n_0_[6] ),
        .I3(\op_count_reg_n_0_[7] ),
        .I4(\op_count_reg_n_0_[9] ),
        .O(data0[9]));
  LUT6 #(
    .INIT(64'hFFFFFFFF557FFFFF)) 
    \op_count[9]_i_3 
       (.I0(\op_count_reg_n_0_[9] ),
        .I1(\op_count_reg_n_0_[1] ),
        .I2(\op_count_reg_n_0_[0] ),
        .I3(\op_count_reg_n_0_[2] ),
        .I4(\op_count_reg_n_0_[8] ),
        .I5(\op_count_reg_n_0_[7] ),
        .O(\op_count[9]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h5DFFFFFF)) 
    \op_count[9]_i_4 
       (.I0(\op_count_reg_n_0_[8] ),
        .I1(\op_count_reg_n_0_[6] ),
        .I2(\op_count_reg_n_0_[7] ),
        .I3(\op_count_reg_n_0_[4] ),
        .I4(\op_count_reg_n_0_[5] ),
        .O(\op_count[9]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFD5FF)) 
    \op_count[9]_i_5 
       (.I0(\op_count_reg_n_0_[5] ),
        .I1(\op_count_reg_n_0_[3] ),
        .I2(\op_count_reg_n_0_[4] ),
        .I3(\op_count_reg_n_0_[1] ),
        .I4(\op_count_reg_n_0_[2] ),
        .O(\op_count[9]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \op_count[9]_i_6 
       (.I0(\op_count_reg_n_0_[2] ),
        .I1(\op_count_reg_n_0_[0] ),
        .I2(\op_count_reg_n_0_[1] ),
        .I3(\op_count_reg_n_0_[3] ),
        .I4(\op_count_reg_n_0_[4] ),
        .I5(\op_count_reg_n_0_[5] ),
        .O(\op_count[9]_i_6_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \op_count_reg[0] 
       (.C(clk),
        .CE(clk_en_slow),
        .D(\op_count[0]_i_1_n_0 ),
        .Q(\op_count_reg_n_0_[0] ),
        .R(\op_count[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \op_count_reg[1] 
       (.C(clk),
        .CE(clk_en_slow),
        .D(data0[1]),
        .Q(\op_count_reg_n_0_[1] ),
        .R(\op_count[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \op_count_reg[2] 
       (.C(clk),
        .CE(clk_en_slow),
        .D(data0[2]),
        .Q(\op_count_reg_n_0_[2] ),
        .R(\op_count[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \op_count_reg[3] 
       (.C(clk),
        .CE(clk_en_slow),
        .D(data0[3]),
        .Q(\op_count_reg_n_0_[3] ),
        .R(\op_count[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \op_count_reg[4] 
       (.C(clk),
        .CE(clk_en_slow),
        .D(data0[4]),
        .Q(\op_count_reg_n_0_[4] ),
        .R(\op_count[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \op_count_reg[5] 
       (.C(clk),
        .CE(clk_en_slow),
        .D(data0[5]),
        .Q(\op_count_reg_n_0_[5] ),
        .R(\op_count[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \op_count_reg[6] 
       (.C(clk),
        .CE(clk_en_slow),
        .D(data0[6]),
        .Q(\op_count_reg_n_0_[6] ),
        .R(\op_count[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \op_count_reg[7] 
       (.C(clk),
        .CE(clk_en_slow),
        .D(data0[7]),
        .Q(\op_count_reg_n_0_[7] ),
        .R(\op_count[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \op_count_reg[8] 
       (.C(clk),
        .CE(clk_en_slow),
        .D(data0[8]),
        .Q(\op_count_reg_n_0_[8] ),
        .R(\op_count[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \op_count_reg[9] 
       (.C(clk),
        .CE(clk_en_slow),
        .D(data0[9]),
        .Q(\op_count_reg_n_0_[9] ),
        .R(\op_count[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFEFFFEFFFE)) 
    reset_out_INST_0
       (.I0(col_data_capture_INST_0_i_1_n_0),
        .I1(\op_count_reg_n_0_[3] ),
        .I2(\op_count_reg_n_0_[7] ),
        .I3(\op_count_reg_n_0_[6] ),
        .I4(\op_count_reg_n_0_[2] ),
        .I5(\op_count_reg_n_0_[1] ),
        .O(reset_out));
endmodule

