// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: 
// Date        : 
// Host        : 
// Command     : write_verilog 
// Design      : 
// Purpose     : This is a Verilog netlist 
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

	
(* M = "6" *) (* N = "17" *) 
(* keep_hierarchy = "yes" *)
module keypad4X4
   (clk,
    keyb_row, // just connect them to FPGA pins, rows
    keyb_col, // just connect them to FPGA pins, columns
    key_value, //user's output code for detected pressed key: row[1:0]_col[1:0]
    key_valid // user's output valid: if a key is pressed long enough (more than 20~40 ms), key_valid becomes '1' for just one clock cycle.
	);
  
  input clk;
  output [3:0]keyb_row; 
  input [3:0]keyb_col;
  output [3:0]key_value;
  output key_valid;

  wire \<const0> ;
  wire \<const1> ;
  wire \FSM_onehot_row[1]_i_1_n_0 ;
  wire \FSM_onehot_row[4]_i_1_n_0 ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_row_reg_n_0_[0] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_row_reg_n_0_[1] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_row_reg_n_0_[2] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_row_reg_n_0_[3] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_row_reg_n_0_[4] ;
  wire clk;
  wire clk_en;
  wire clk_en2;
  wire clk_en2_i_2_n_0;
  wire clk_en2_i_3_n_0;
  wire clk_en2_i_4_n_0;
  wire clk_en_i_1_n_0;
  wire clk_en_i_2_n_0;
  wire clk_en_i_3_n_0;
  wire clk_en_i_4_n_0;
  wire [3:0]col;
  wire \count[0]_i_2_n_0 ;
  wire count_deb;
  wire \count_deb[5]_i_1_n_0 ;
  wire \count_deb[5]_i_4_n_0 ;
  wire \count_deb[5]_i_5_n_0 ;
  wire [5:0]count_deb_reg__0;
  wire [16:0]count_reg;
  wire \count_reg[0]_i_1_n_0 ;
  wire \count_reg[0]_i_1_n_1 ;
  wire \count_reg[0]_i_1_n_2 ;
  wire \count_reg[0]_i_1_n_3 ;
  wire \count_reg[0]_i_1_n_4 ;
  wire \count_reg[0]_i_1_n_5 ;
  wire \count_reg[0]_i_1_n_6 ;
  wire \count_reg[0]_i_1_n_7 ;
  wire \count_reg[12]_i_1_n_0 ;
  wire \count_reg[12]_i_1_n_1 ;
  wire \count_reg[12]_i_1_n_2 ;
  wire \count_reg[12]_i_1_n_3 ;
  wire \count_reg[12]_i_1_n_4 ;
  wire \count_reg[12]_i_1_n_5 ;
  wire \count_reg[12]_i_1_n_6 ;
  wire \count_reg[12]_i_1_n_7 ;
  wire \count_reg[16]_i_1_n_7 ;
  wire \count_reg[4]_i_1_n_0 ;
  wire \count_reg[4]_i_1_n_1 ;
  wire \count_reg[4]_i_1_n_2 ;
  wire \count_reg[4]_i_1_n_3 ;
  wire \count_reg[4]_i_1_n_4 ;
  wire \count_reg[4]_i_1_n_5 ;
  wire \count_reg[4]_i_1_n_6 ;
  wire \count_reg[4]_i_1_n_7 ;
  wire \count_reg[8]_i_1_n_0 ;
  wire \count_reg[8]_i_1_n_1 ;
  wire \count_reg[8]_i_1_n_2 ;
  wire \count_reg[8]_i_1_n_3 ;
  wire \count_reg[8]_i_1_n_4 ;
  wire \count_reg[8]_i_1_n_5 ;
  wire \count_reg[8]_i_1_n_6 ;
  wire \count_reg[8]_i_1_n_7 ;
  wire finish;
  wire finish_del;
  wire finish_i_1_n_0;
  wire key_valid;
  wire key_valid_pre_i_1_n_0;
  wire [3:0]key_value;
  wire [3:0]keyb_col;
  wire [3:0]keyb_row;
  wire p_0_in;
  wire [5:0]p_0_in__0;
  wire [1:0]p_0_out;
  wire [1:0]row_encoded;
  wire valid_col;
  wire valid_col_reg;
  wire [3:0]value;

  LUT4 #(
    .INIT(16'hAAAB)) 
    \FSM_onehot_row[1]_i_1 
       (.I0(\FSM_onehot_row_reg_n_0_[4] ),
        .I1(\FSM_onehot_row_reg_n_0_[3] ),
        .I2(\FSM_onehot_row_reg_n_0_[1] ),
        .I3(\FSM_onehot_row_reg_n_0_[2] ),
        .O(\FSM_onehot_row[1]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \FSM_onehot_row[4]_i_1 
       (.I0(clk_en),
        .I1(valid_col_reg),
        .O(\FSM_onehot_row[4]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "iSTATE:00010,iSTATE0:00100,iSTATE1:01000,iSTATE2:10000,iSTATE3:00001" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b1)) 
    \FSM_onehot_row_reg[0] 
       (.C(clk),
        .CE(\FSM_onehot_row[4]_i_1_n_0 ),
        .D(\<const0> ),
        .Q(\FSM_onehot_row_reg_n_0_[0] ),
        .R(\<const0> ));
  (* FSM_ENCODED_STATES = "iSTATE:00010,iSTATE0:00100,iSTATE1:01000,iSTATE2:10000,iSTATE3:00001" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_row_reg[1] 
       (.C(clk),
        .CE(\FSM_onehot_row[4]_i_1_n_0 ),
        .D(\FSM_onehot_row[1]_i_1_n_0 ),
        .Q(\FSM_onehot_row_reg_n_0_[1] ),
        .R(\<const0> ));
  (* FSM_ENCODED_STATES = "iSTATE:00010,iSTATE0:00100,iSTATE1:01000,iSTATE2:10000,iSTATE3:00001" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_row_reg[2] 
       (.C(clk),
        .CE(\FSM_onehot_row[4]_i_1_n_0 ),
        .D(\FSM_onehot_row_reg_n_0_[1] ),
        .Q(\FSM_onehot_row_reg_n_0_[2] ),
        .R(\<const0> ));
  (* FSM_ENCODED_STATES = "iSTATE:00010,iSTATE0:00100,iSTATE1:01000,iSTATE2:10000,iSTATE3:00001" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_row_reg[3] 
       (.C(clk),
        .CE(\FSM_onehot_row[4]_i_1_n_0 ),
        .D(\FSM_onehot_row_reg_n_0_[2] ),
        .Q(\FSM_onehot_row_reg_n_0_[3] ),
        .R(\<const0> ));
  (* FSM_ENCODED_STATES = "iSTATE:00010,iSTATE0:00100,iSTATE1:01000,iSTATE2:10000,iSTATE3:00001" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_row_reg[4] 
       (.C(clk),
        .CE(\FSM_onehot_row[4]_i_1_n_0 ),
        .D(\FSM_onehot_row_reg_n_0_[3] ),
        .Q(\FSM_onehot_row_reg_n_0_[4] ),
        .R(\<const0> ));
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  LUT3 #(
    .INIT(8'h80)) 
    clk_en2_i_1
       (.I0(clk_en2_i_2_n_0),
        .I1(clk_en2_i_3_n_0),
        .I2(clk_en2_i_4_n_0),
        .O(p_0_in));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    clk_en2_i_2
       (.I0(count_reg[7]),
        .I1(count_reg[8]),
        .I2(count_reg[5]),
        .I3(count_reg[6]),
        .I4(count_reg[10]),
        .I5(count_reg[9]),
        .O(clk_en2_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    clk_en2_i_3
       (.I0(count_reg[0]),
        .I1(count_reg[1]),
        .I2(count_reg[2]),
        .I3(count_reg[4]),
        .I4(count_reg[3]),
        .O(clk_en2_i_3_n_0));
  LUT6 #(
    .INIT(64'h0000800000000000)) 
    clk_en2_i_4
       (.I0(count_reg[13]),
        .I1(count_reg[14]),
        .I2(count_reg[11]),
        .I3(count_reg[12]),
        .I4(count_reg[16]),
        .I5(count_reg[15]),
        .O(clk_en2_i_4_n_0));
  FDRE #(
    .INIT(1'b0)) 
    clk_en2_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(p_0_in),
        .Q(clk_en2),
        .R(\<const0> ));
  LUT3 #(
    .INIT(8'h80)) 
    clk_en_i_1
       (.I0(clk_en_i_2_n_0),
        .I1(clk_en_i_3_n_0),
        .I2(clk_en_i_4_n_0),
        .O(clk_en_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    clk_en_i_2
       (.I0(count_reg[7]),
        .I1(count_reg[8]),
        .I2(count_reg[5]),
        .I3(count_reg[6]),
        .I4(count_reg[10]),
        .I5(count_reg[9]),
        .O(clk_en_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    clk_en_i_3
       (.I0(count_reg[0]),
        .I1(count_reg[1]),
        .I2(count_reg[2]),
        .I3(count_reg[4]),
        .I4(count_reg[3]),
        .O(clk_en_i_3_n_0));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    clk_en_i_4
       (.I0(count_reg[13]),
        .I1(count_reg[14]),
        .I2(count_reg[11]),
        .I3(count_reg[12]),
        .I4(count_reg[16]),
        .I5(count_reg[15]),
        .O(clk_en_i_4_n_0));
  FDRE #(
    .INIT(1'b0)) 
    clk_en_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(clk_en_i_1_n_0),
        .Q(clk_en),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \col_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(keyb_col[0]),
        .Q(col[0]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \col_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(keyb_col[1]),
        .Q(col[1]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \col_reg[2] 
       (.C(clk),
        .CE(\<const1> ),
        .D(keyb_col[2]),
        .Q(col[2]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \col_reg[3] 
       (.C(clk),
        .CE(\<const1> ),
        .D(keyb_col[3]),
        .Q(col[3]),
        .R(\<const0> ));
  LUT1 #(
    .INIT(2'h1)) 
    \count[0]_i_2 
       (.I0(count_reg[0]),
        .O(\count[0]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \count_deb[0]_i_1 
       (.I0(count_deb_reg__0[0]),
        .O(p_0_in__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \count_deb[1]_i_1 
       (.I0(count_deb_reg__0[0]),
        .I1(count_deb_reg__0[1]),
        .O(p_0_in__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \count_deb[2]_i_1 
       (.I0(count_deb_reg__0[1]),
        .I1(count_deb_reg__0[0]),
        .I2(count_deb_reg__0[2]),
        .O(p_0_in__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \count_deb[3]_i_1 
       (.I0(count_deb_reg__0[2]),
        .I1(count_deb_reg__0[0]),
        .I2(count_deb_reg__0[1]),
        .I3(count_deb_reg__0[3]),
        .O(p_0_in__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_deb[4]_i_1 
       (.I0(count_deb_reg__0[3]),
        .I1(count_deb_reg__0[1]),
        .I2(count_deb_reg__0[0]),
        .I3(count_deb_reg__0[2]),
        .I4(count_deb_reg__0[4]),
        .O(p_0_in__0[4]));
  LUT6 #(
    .INIT(64'hF6FFFFF6F0F0F0F0)) 
    \count_deb[5]_i_1 
       (.I0(key_value[0]),
        .I1(value[0]),
        .I2(\count_deb[5]_i_4_n_0 ),
        .I3(value[1]),
        .I4(key_value[1]),
        .I5(clk_en2),
        .O(\count_deb[5]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \count_deb[5]_i_2 
       (.I0(\count_deb[5]_i_5_n_0 ),
        .I1(clk_en2),
        .O(count_deb));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \count_deb[5]_i_3 
       (.I0(count_deb_reg__0[4]),
        .I1(count_deb_reg__0[2]),
        .I2(count_deb_reg__0[0]),
        .I3(count_deb_reg__0[1]),
        .I4(count_deb_reg__0[3]),
        .I5(count_deb_reg__0[5]),
        .O(p_0_in__0[5]));
  LUT6 #(
    .INIT(64'h7DFFFF7D00000000)) 
    \count_deb[5]_i_4 
       (.I0(valid_col_reg),
        .I1(key_value[3]),
        .I2(value[3]),
        .I3(value[2]),
        .I4(key_value[2]),
        .I5(clk_en2),
        .O(\count_deb[5]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \count_deb[5]_i_5 
       (.I0(count_deb_reg__0[4]),
        .I1(count_deb_reg__0[2]),
        .I2(count_deb_reg__0[0]),
        .I3(count_deb_reg__0[1]),
        .I4(count_deb_reg__0[3]),
        .I5(count_deb_reg__0[5]),
        .O(\count_deb[5]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_deb_reg[0] 
       (.C(clk),
        .CE(count_deb),
        .D(p_0_in__0[0]),
        .Q(count_deb_reg__0[0]),
        .R(\count_deb[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_deb_reg[1] 
       (.C(clk),
        .CE(count_deb),
        .D(p_0_in__0[1]),
        .Q(count_deb_reg__0[1]),
        .R(\count_deb[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_deb_reg[2] 
       (.C(clk),
        .CE(count_deb),
        .D(p_0_in__0[2]),
        .Q(count_deb_reg__0[2]),
        .R(\count_deb[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_deb_reg[3] 
       (.C(clk),
        .CE(count_deb),
        .D(p_0_in__0[3]),
        .Q(count_deb_reg__0[3]),
        .R(\count_deb[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_deb_reg[4] 
       (.C(clk),
        .CE(count_deb),
        .D(p_0_in__0[4]),
        .Q(count_deb_reg__0[4]),
        .R(\count_deb[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_deb_reg[5] 
       (.C(clk),
        .CE(count_deb),
        .D(p_0_in__0[5]),
        .Q(count_deb_reg__0[5]),
        .R(\count_deb[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\count_reg[0]_i_1_n_7 ),
        .Q(count_reg[0]),
        .R(\<const0> ));
  CARRY4 \count_reg[0]_i_1 
       (.CI(\<const0> ),
        .CO({\count_reg[0]_i_1_n_0 ,\count_reg[0]_i_1_n_1 ,\count_reg[0]_i_1_n_2 ,\count_reg[0]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const1> }),
        .O({\count_reg[0]_i_1_n_4 ,\count_reg[0]_i_1_n_5 ,\count_reg[0]_i_1_n_6 ,\count_reg[0]_i_1_n_7 }),
        .S({count_reg[3:1],\count[0]_i_2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[10] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\count_reg[8]_i_1_n_5 ),
        .Q(count_reg[10]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[11] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\count_reg[8]_i_1_n_4 ),
        .Q(count_reg[11]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[12] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\count_reg[12]_i_1_n_7 ),
        .Q(count_reg[12]),
        .R(\<const0> ));
  CARRY4 \count_reg[12]_i_1 
       (.CI(\count_reg[8]_i_1_n_0 ),
        .CO({\count_reg[12]_i_1_n_0 ,\count_reg[12]_i_1_n_1 ,\count_reg[12]_i_1_n_2 ,\count_reg[12]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_reg[12]_i_1_n_4 ,\count_reg[12]_i_1_n_5 ,\count_reg[12]_i_1_n_6 ,\count_reg[12]_i_1_n_7 }),
        .S(count_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[13] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\count_reg[12]_i_1_n_6 ),
        .Q(count_reg[13]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[14] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\count_reg[12]_i_1_n_5 ),
        .Q(count_reg[14]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[15] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\count_reg[12]_i_1_n_4 ),
        .Q(count_reg[15]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[16] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\count_reg[16]_i_1_n_7 ),
        .Q(count_reg[16]),
        .R(\<const0> ));
  CARRY4 \count_reg[16]_i_1 
       (.CI(\count_reg[12]_i_1_n_0 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(\count_reg[16]_i_1_n_7 ),
        .S({\<const0> ,\<const0> ,\<const0> ,count_reg[16]}));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\count_reg[0]_i_1_n_6 ),
        .Q(count_reg[1]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[2] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\count_reg[0]_i_1_n_5 ),
        .Q(count_reg[2]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[3] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\count_reg[0]_i_1_n_4 ),
        .Q(count_reg[3]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[4] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\count_reg[4]_i_1_n_7 ),
        .Q(count_reg[4]),
        .R(\<const0> ));
  CARRY4 \count_reg[4]_i_1 
       (.CI(\count_reg[0]_i_1_n_0 ),
        .CO({\count_reg[4]_i_1_n_0 ,\count_reg[4]_i_1_n_1 ,\count_reg[4]_i_1_n_2 ,\count_reg[4]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_reg[4]_i_1_n_4 ,\count_reg[4]_i_1_n_5 ,\count_reg[4]_i_1_n_6 ,\count_reg[4]_i_1_n_7 }),
        .S(count_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[5] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\count_reg[4]_i_1_n_6 ),
        .Q(count_reg[5]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[6] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\count_reg[4]_i_1_n_5 ),
        .Q(count_reg[6]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[7] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\count_reg[4]_i_1_n_4 ),
        .Q(count_reg[7]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[8] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\count_reg[8]_i_1_n_7 ),
        .Q(count_reg[8]),
        .R(\<const0> ));
  CARRY4 \count_reg[8]_i_1 
       (.CI(\count_reg[4]_i_1_n_0 ),
        .CO({\count_reg[8]_i_1_n_0 ,\count_reg[8]_i_1_n_1 ,\count_reg[8]_i_1_n_2 ,\count_reg[8]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_reg[8]_i_1_n_4 ,\count_reg[8]_i_1_n_5 ,\count_reg[8]_i_1_n_6 ,\count_reg[8]_i_1_n_7 }),
        .S(count_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[9] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\count_reg[8]_i_1_n_6 ),
        .Q(count_reg[9]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    finish_del_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(finish),
        .Q(finish_del),
        .R(\<const0> ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    finish_i_1
       (.I0(count_deb_reg__0[5]),
        .I1(count_deb_reg__0[3]),
        .I2(count_deb_reg__0[1]),
        .I3(count_deb_reg__0[0]),
        .I4(count_deb_reg__0[2]),
        .I5(count_deb_reg__0[4]),
        .O(finish_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    finish_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(finish_i_1_n_0),
        .Q(finish),
        .R(\<const0> ));
  LUT2 #(
    .INIT(4'h2)) 
    key_valid_pre_i_1
       (.I0(finish),
        .I1(finish_del),
        .O(key_valid_pre_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    key_valid_pre_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(key_valid_pre_i_1_n_0),
        .Q(key_valid),
        .R(\<const0> ));
  LUT3 #(
    .INIT(8'hFE)) 
    \keyb_row[0]_INST_0 
       (.I0(\FSM_onehot_row_reg_n_0_[2] ),
        .I1(\FSM_onehot_row_reg_n_0_[1] ),
        .I2(\FSM_onehot_row_reg_n_0_[3] ),
        .O(keyb_row[0]));
  LUT3 #(
    .INIT(8'hFE)) 
    \keyb_row[1]_INST_0 
       (.I0(\FSM_onehot_row_reg_n_0_[2] ),
        .I1(\FSM_onehot_row_reg_n_0_[1] ),
        .I2(\FSM_onehot_row_reg_n_0_[4] ),
        .O(keyb_row[1]));
  LUT3 #(
    .INIT(8'hFE)) 
    \keyb_row[2]_INST_0 
       (.I0(\FSM_onehot_row_reg_n_0_[3] ),
        .I1(\FSM_onehot_row_reg_n_0_[1] ),
        .I2(\FSM_onehot_row_reg_n_0_[4] ),
        .O(keyb_row[2]));
  LUT3 #(
    .INIT(8'hFE)) 
    \keyb_row[3]_INST_0 
       (.I0(\FSM_onehot_row_reg_n_0_[3] ),
        .I1(\FSM_onehot_row_reg_n_0_[2] ),
        .I2(\FSM_onehot_row_reg_n_0_[4] ),
        .O(keyb_row[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    valid_col_reg_i_1
       (.I0(col[3]),
        .I1(col[2]),
        .I2(col[0]),
        .I3(col[1]),
        .O(valid_col));
  FDRE #(
    .INIT(1'b0)) 
    valid_col_reg_reg
       (.C(clk),
        .CE(clk_en2),
        .D(valid_col),
        .Q(valid_col_reg),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h20AA)) 
    \value[0]_i_1 
       (.I0(col[3]),
        .I1(col[0]),
        .I2(col[1]),
        .I3(col[2]),
        .O(p_0_out[0]));
  LUT4 #(
    .INIT(16'h2A00)) 
    \value[1]_i_1 
       (.I0(col[3]),
        .I1(col[0]),
        .I2(col[1]),
        .I3(col[2]),
        .O(p_0_out[1]));
  LUT2 #(
    .INIT(4'hE)) 
    \value[2]_i_1 
       (.I0(\FSM_onehot_row_reg_n_0_[2] ),
        .I1(\FSM_onehot_row_reg_n_0_[4] ),
        .O(row_encoded[0]));
  LUT2 #(
    .INIT(4'hE)) 
    \value[3]_i_1 
       (.I0(\FSM_onehot_row_reg_n_0_[3] ),
        .I1(\FSM_onehot_row_reg_n_0_[4] ),
        .O(row_encoded[1]));
  FDRE #(
    .INIT(1'b0)) 
    \value_del_reg[0] 
       (.C(clk),
        .CE(clk_en2),
        .D(value[0]),
        .Q(key_value[0]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \value_del_reg[1] 
       (.C(clk),
        .CE(clk_en2),
        .D(value[1]),
        .Q(key_value[1]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \value_del_reg[2] 
       (.C(clk),
        .CE(clk_en2),
        .D(value[2]),
        .Q(key_value[2]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \value_del_reg[3] 
       (.C(clk),
        .CE(clk_en2),
        .D(value[3]),
        .Q(key_value[3]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \value_reg[0] 
       (.C(clk),
        .CE(clk_en2),
        .D(p_0_out[0]),
        .Q(value[0]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \value_reg[1] 
       (.C(clk),
        .CE(clk_en2),
        .D(p_0_out[1]),
        .Q(value[1]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \value_reg[2] 
       (.C(clk),
        .CE(clk_en2),
        .D(row_encoded[0]),
        .Q(value[2]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \value_reg[3] 
       (.C(clk),
        .CE(clk_en2),
        .D(row_encoded[1]),
        .Q(value[3]),
        .R(\<const0> ));
endmodule
