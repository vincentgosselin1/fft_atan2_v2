-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 17.1 (Release Build #590)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2017 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from cordic_atan2_v2_CORDIC_0
-- VHDL created on Sun Mar 01 18:14:33 2020


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY altera_lnsim;
USE altera_lnsim.altera_lnsim_components.altera_syncram;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity cordic_atan2_v2_CORDIC_0 is
    port (
        x : in std_logic_vector(15 downto 0);  -- sfix16_en15
        y : in std_logic_vector(15 downto 0);  -- sfix16_en15
        en : in std_logic_vector(0 downto 0);  -- ufix1
        q : out std_logic_vector(15 downto 0);  -- sfix16_en13
        r : out std_logic_vector(14 downto 0);  -- ufix15_en14
        clk : in std_logic;
        areset : in std_logic
    );
end cordic_atan2_v2_CORDIC_0;

architecture normal of cordic_atan2_v2_CORDIC_0 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal constantZero_uid6_vecTranslateTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal signX_uid7_vecTranslateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signY_uid8_vecTranslateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal invSignX_uid9_vecTranslateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal absXE_uid10_vecTranslateTest_a : STD_LOGIC_VECTOR (17 downto 0);
    signal absXE_uid10_vecTranslateTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal absXE_uid10_vecTranslateTest_o : STD_LOGIC_VECTOR (17 downto 0);
    signal absXE_uid10_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal absXE_uid10_vecTranslateTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal invSignY_uid11_vecTranslateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal absYE_uid12_vecTranslateTest_a : STD_LOGIC_VECTOR (17 downto 0);
    signal absYE_uid12_vecTranslateTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal absYE_uid12_vecTranslateTest_o : STD_LOGIC_VECTOR (17 downto 0);
    signal absYE_uid12_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal absYE_uid12_vecTranslateTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal absX_uid13_vecTranslateTest_in : STD_LOGIC_VECTOR (15 downto 0);
    signal absX_uid13_vecTranslateTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal absY_uid14_vecTranslateTest_in : STD_LOGIC_VECTOR (15 downto 0);
    signal absY_uid14_vecTranslateTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal yNotZero_uid15_vecTranslateTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal yNotZero_uid15_vecTranslateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal yZero_uid16_vecTranslateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xNotZero_uid17_vecTranslateTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal xNotZero_uid17_vecTranslateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xZero_uid18_vecTranslateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_1_uid23_vecTranslateTest_a : STD_LOGIC_VECTOR (16 downto 0);
    signal xip1E_1_uid23_vecTranslateTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal xip1E_1_uid23_vecTranslateTest_o : STD_LOGIC_VECTOR (16 downto 0);
    signal xip1E_1_uid23_vecTranslateTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal yip1E_1_uid24_vecTranslateTest_a : STD_LOGIC_VECTOR (16 downto 0);
    signal yip1E_1_uid24_vecTranslateTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal yip1E_1_uid24_vecTranslateTest_o : STD_LOGIC_VECTOR (16 downto 0);
    signal yip1E_1_uid24_vecTranslateTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal xMSB_uid32_vecTranslateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal invSignOfSelectionSignal_uid37_vecTranslateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_2NA_uid39_vecTranslateTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal xip1E_2sumAHighB_uid40_vecTranslateTest_a : STD_LOGIC_VECTOR (20 downto 0);
    signal xip1E_2sumAHighB_uid40_vecTranslateTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal xip1E_2sumAHighB_uid40_vecTranslateTest_o : STD_LOGIC_VECTOR (20 downto 0);
    signal xip1E_2sumAHighB_uid40_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_2sumAHighB_uid40_vecTranslateTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal yip1E_2NA_uid42_vecTranslateTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal yip1E_2sumAHighB_uid43_vecTranslateTest_a : STD_LOGIC_VECTOR (19 downto 0);
    signal yip1E_2sumAHighB_uid43_vecTranslateTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal yip1E_2sumAHighB_uid43_vecTranslateTest_o : STD_LOGIC_VECTOR (19 downto 0);
    signal yip1E_2sumAHighB_uid43_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_2sumAHighB_uid43_vecTranslateTest_q : STD_LOGIC_VECTOR (18 downto 0);
    signal xip1_2_uid48_vecTranslateTest_in : STD_LOGIC_VECTOR (17 downto 0);
    signal xip1_2_uid48_vecTranslateTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal yip1_2_uid49_vecTranslateTest_in : STD_LOGIC_VECTOR (17 downto 0);
    signal yip1_2_uid49_vecTranslateTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal xMSB_uid51_vecTranslateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal invSignOfSelectionSignal_uid56_vecTranslateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_3CostZeroPaddingA_uid57_vecTranslateTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal xip1E_3NA_uid58_vecTranslateTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal xip1E_3sumAHighB_uid59_vecTranslateTest_a : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1E_3sumAHighB_uid59_vecTranslateTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1E_3sumAHighB_uid59_vecTranslateTest_o : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1E_3sumAHighB_uid59_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_3sumAHighB_uid59_vecTranslateTest_q : STD_LOGIC_VECTOR (21 downto 0);
    signal yip1E_3NA_uid61_vecTranslateTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal yip1E_3sumAHighB_uid62_vecTranslateTest_a : STD_LOGIC_VECTOR (21 downto 0);
    signal yip1E_3sumAHighB_uid62_vecTranslateTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal yip1E_3sumAHighB_uid62_vecTranslateTest_o : STD_LOGIC_VECTOR (21 downto 0);
    signal yip1E_3sumAHighB_uid62_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_3sumAHighB_uid62_vecTranslateTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal xip1_3_uid67_vecTranslateTest_in : STD_LOGIC_VECTOR (19 downto 0);
    signal xip1_3_uid67_vecTranslateTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal yip1_3_uid68_vecTranslateTest_in : STD_LOGIC_VECTOR (18 downto 0);
    signal yip1_3_uid68_vecTranslateTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal xMSB_uid70_vecTranslateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal invSignOfSelectionSignal_uid75_vecTranslateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_4CostZeroPaddingA_uid76_vecTranslateTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal xip1E_4NA_uid77_vecTranslateTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1E_4sumAHighB_uid78_vecTranslateTest_a : STD_LOGIC_VECTOR (25 downto 0);
    signal xip1E_4sumAHighB_uid78_vecTranslateTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal xip1E_4sumAHighB_uid78_vecTranslateTest_o : STD_LOGIC_VECTOR (25 downto 0);
    signal xip1E_4sumAHighB_uid78_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_4sumAHighB_uid78_vecTranslateTest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_4NA_uid80_vecTranslateTest_q : STD_LOGIC_VECTOR (21 downto 0);
    signal yip1E_4sumAHighB_uid81_vecTranslateTest_a : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1E_4sumAHighB_uid81_vecTranslateTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1E_4sumAHighB_uid81_vecTranslateTest_o : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1E_4sumAHighB_uid81_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_4sumAHighB_uid81_vecTranslateTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1_4_uid86_vecTranslateTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1_4_uid86_vecTranslateTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1_4_uid87_vecTranslateTest_in : STD_LOGIC_VECTOR (20 downto 0);
    signal yip1_4_uid87_vecTranslateTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal xMSB_uid89_vecTranslateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal invSignOfSelectionSignal_uid94_vecTranslateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_5CostZeroPaddingA_uid95_vecTranslateTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal xip1E_5NA_uid96_vecTranslateTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal xip1E_5sumAHighB_uid97_vecTranslateTest_a : STD_LOGIC_VECTOR (29 downto 0);
    signal xip1E_5sumAHighB_uid97_vecTranslateTest_b : STD_LOGIC_VECTOR (29 downto 0);
    signal xip1E_5sumAHighB_uid97_vecTranslateTest_o : STD_LOGIC_VECTOR (29 downto 0);
    signal xip1E_5sumAHighB_uid97_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_5sumAHighB_uid97_vecTranslateTest_q : STD_LOGIC_VECTOR (28 downto 0);
    signal yip1E_5NA_uid99_vecTranslateTest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_5sumAHighB_uid100_vecTranslateTest_a : STD_LOGIC_VECTOR (26 downto 0);
    signal yip1E_5sumAHighB_uid100_vecTranslateTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal yip1E_5sumAHighB_uid100_vecTranslateTest_o : STD_LOGIC_VECTOR (26 downto 0);
    signal yip1E_5sumAHighB_uid100_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_5sumAHighB_uid100_vecTranslateTest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal xip1_5_uid105_vecTranslateTest_in : STD_LOGIC_VECTOR (26 downto 0);
    signal xip1_5_uid105_vecTranslateTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal yip1_5_uid106_vecTranslateTest_in : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1_5_uid106_vecTranslateTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal xMSB_uid108_vecTranslateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal invSignOfSelectionSignal_uid113_vecTranslateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_6CostZeroPaddingA_uid114_vecTranslateTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal xip1E_6NA_uid115_vecTranslateTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal xip1E_6sumAHighB_uid116_vecTranslateTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_6sumAHighB_uid116_vecTranslateTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_6sumAHighB_uid116_vecTranslateTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_6sumAHighB_uid116_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_6sumAHighB_uid116_vecTranslateTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal yip1E_6NA_uid118_vecTranslateTest_q : STD_LOGIC_VECTOR (28 downto 0);
    signal yip1E_6sumAHighB_uid119_vecTranslateTest_a : STD_LOGIC_VECTOR (30 downto 0);
    signal yip1E_6sumAHighB_uid119_vecTranslateTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal yip1E_6sumAHighB_uid119_vecTranslateTest_o : STD_LOGIC_VECTOR (30 downto 0);
    signal yip1E_6sumAHighB_uid119_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_6sumAHighB_uid119_vecTranslateTest_q : STD_LOGIC_VECTOR (29 downto 0);
    signal xip1_6_uid124_vecTranslateTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal xip1_6_uid124_vecTranslateTest_b : STD_LOGIC_VECTOR (31 downto 0);
    signal yip1_6_uid125_vecTranslateTest_in : STD_LOGIC_VECTOR (27 downto 0);
    signal yip1_6_uid125_vecTranslateTest_b : STD_LOGIC_VECTOR (27 downto 0);
    signal xMSB_uid127_vecTranslateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid131_vecTranslateTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal twoToMiSiYip_uid132_vecTranslateTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal invSignOfSelectionSignal_uid134_vecTranslateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_7NA_uid136_vecTranslateTest_q : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1E_7sumAHighB_uid137_vecTranslateTest_a : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_7sumAHighB_uid137_vecTranslateTest_b : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_7sumAHighB_uid137_vecTranslateTest_o : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_7sumAHighB_uid137_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_7sumAHighB_uid137_vecTranslateTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_7NA_uid139_vecTranslateTest_q : STD_LOGIC_VECTOR (28 downto 0);
    signal yip1E_7sumAHighB_uid140_vecTranslateTest_a : STD_LOGIC_VECTOR (30 downto 0);
    signal yip1E_7sumAHighB_uid140_vecTranslateTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal yip1E_7sumAHighB_uid140_vecTranslateTest_o : STD_LOGIC_VECTOR (30 downto 0);
    signal yip1E_7sumAHighB_uid140_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_7sumAHighB_uid140_vecTranslateTest_q : STD_LOGIC_VECTOR (29 downto 0);
    signal xip1_7_uid145_vecTranslateTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_7_uid145_vecTranslateTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_7_uid146_vecTranslateTest_in : STD_LOGIC_VECTOR (27 downto 0);
    signal yip1_7_uid146_vecTranslateTest_b : STD_LOGIC_VECTOR (27 downto 0);
    signal xMSB_uid148_vecTranslateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid152_vecTranslateTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal twoToMiSiYip_uid153_vecTranslateTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal invSignOfSelectionSignal_uid155_vecTranslateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_8_uid156_vecTranslateTest_a : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_8_uid156_vecTranslateTest_b : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_8_uid156_vecTranslateTest_o : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_8_uid156_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_8_uid156_vecTranslateTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_8_uid157_vecTranslateTest_a : STD_LOGIC_VECTOR (29 downto 0);
    signal yip1E_8_uid157_vecTranslateTest_b : STD_LOGIC_VECTOR (29 downto 0);
    signal yip1E_8_uid157_vecTranslateTest_o : STD_LOGIC_VECTOR (29 downto 0);
    signal yip1E_8_uid157_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_8_uid157_vecTranslateTest_q : STD_LOGIC_VECTOR (28 downto 0);
    signal xip1_8_uid162_vecTranslateTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_8_uid162_vecTranslateTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_8_uid163_vecTranslateTest_in : STD_LOGIC_VECTOR (26 downto 0);
    signal yip1_8_uid163_vecTranslateTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal xMSB_uid165_vecTranslateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid169_vecTranslateTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal twoToMiSiYip_uid170_vecTranslateTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal invSignOfSelectionSignal_uid172_vecTranslateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_9_uid173_vecTranslateTest_a : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_9_uid173_vecTranslateTest_b : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_9_uid173_vecTranslateTest_o : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_9_uid173_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_9_uid173_vecTranslateTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_9_uid174_vecTranslateTest_a : STD_LOGIC_VECTOR (28 downto 0);
    signal yip1E_9_uid174_vecTranslateTest_b : STD_LOGIC_VECTOR (28 downto 0);
    signal yip1E_9_uid174_vecTranslateTest_o : STD_LOGIC_VECTOR (28 downto 0);
    signal yip1E_9_uid174_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_9_uid174_vecTranslateTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal xip1_9_uid179_vecTranslateTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_9_uid179_vecTranslateTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_9_uid180_vecTranslateTest_in : STD_LOGIC_VECTOR (25 downto 0);
    signal yip1_9_uid180_vecTranslateTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal xMSB_uid182_vecTranslateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid186_vecTranslateTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal twoToMiSiYip_uid187_vecTranslateTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal invSignOfSelectionSignal_uid189_vecTranslateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_10_uid190_vecTranslateTest_a : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_10_uid190_vecTranslateTest_b : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_10_uid190_vecTranslateTest_o : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_10_uid190_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_10_uid190_vecTranslateTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_10_uid191_vecTranslateTest_a : STD_LOGIC_VECTOR (27 downto 0);
    signal yip1E_10_uid191_vecTranslateTest_b : STD_LOGIC_VECTOR (27 downto 0);
    signal yip1E_10_uid191_vecTranslateTest_o : STD_LOGIC_VECTOR (27 downto 0);
    signal yip1E_10_uid191_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_10_uid191_vecTranslateTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal xip1_10_uid196_vecTranslateTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_10_uid196_vecTranslateTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_10_uid197_vecTranslateTest_in : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1_10_uid197_vecTranslateTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal xMSB_uid199_vecTranslateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid203_vecTranslateTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal twoToMiSiYip_uid204_vecTranslateTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal invSignOfSelectionSignal_uid206_vecTranslateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_11_uid207_vecTranslateTest_a : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_11_uid207_vecTranslateTest_b : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_11_uid207_vecTranslateTest_o : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_11_uid207_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_11_uid207_vecTranslateTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_11_uid208_vecTranslateTest_a : STD_LOGIC_VECTOR (26 downto 0);
    signal yip1E_11_uid208_vecTranslateTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal yip1E_11_uid208_vecTranslateTest_o : STD_LOGIC_VECTOR (26 downto 0);
    signal yip1E_11_uid208_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_11_uid208_vecTranslateTest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal xip1_11_uid213_vecTranslateTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_11_uid213_vecTranslateTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_11_uid214_vecTranslateTest_in : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1_11_uid214_vecTranslateTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal xMSB_uid216_vecTranslateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid220_vecTranslateTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal twoToMiSiYip_uid221_vecTranslateTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal invSignOfSelectionSignal_uid223_vecTranslateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_12_uid224_vecTranslateTest_a : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_12_uid224_vecTranslateTest_b : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_12_uid224_vecTranslateTest_o : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_12_uid224_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_12_uid224_vecTranslateTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_12_uid225_vecTranslateTest_a : STD_LOGIC_VECTOR (25 downto 0);
    signal yip1E_12_uid225_vecTranslateTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal yip1E_12_uid225_vecTranslateTest_o : STD_LOGIC_VECTOR (25 downto 0);
    signal yip1E_12_uid225_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_12_uid225_vecTranslateTest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1_12_uid230_vecTranslateTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_12_uid230_vecTranslateTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_12_uid231_vecTranslateTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1_12_uid231_vecTranslateTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal xMSB_uid233_vecTranslateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid237_vecTranslateTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal twoToMiSiYip_uid238_vecTranslateTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal invSignOfSelectionSignal_uid240_vecTranslateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_13_uid241_vecTranslateTest_a : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_13_uid241_vecTranslateTest_b : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_13_uid241_vecTranslateTest_o : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_13_uid241_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_13_uid241_vecTranslateTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_13_uid242_vecTranslateTest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_13_uid242_vecTranslateTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_13_uid242_vecTranslateTest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_13_uid242_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_13_uid242_vecTranslateTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal xip1_13_uid247_vecTranslateTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_13_uid247_vecTranslateTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_13_uid248_vecTranslateTest_in : STD_LOGIC_VECTOR (21 downto 0);
    signal yip1_13_uid248_vecTranslateTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal xMSB_uid250_vecTranslateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid254_vecTranslateTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal twoToMiSiYip_uid255_vecTranslateTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal invSignOfSelectionSignal_uid257_vecTranslateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_14_uid258_vecTranslateTest_a : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_14_uid258_vecTranslateTest_b : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_14_uid258_vecTranslateTest_o : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_14_uid258_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_14_uid258_vecTranslateTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_14_uid259_vecTranslateTest_a : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1E_14_uid259_vecTranslateTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1E_14_uid259_vecTranslateTest_o : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1E_14_uid259_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_14_uid259_vecTranslateTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1_14_uid264_vecTranslateTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_14_uid264_vecTranslateTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_14_uid265_vecTranslateTest_in : STD_LOGIC_VECTOR (20 downto 0);
    signal yip1_14_uid265_vecTranslateTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal xMSB_uid267_vecTranslateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid271_vecTranslateTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal twoToMiSiYip_uid272_vecTranslateTest_b : STD_LOGIC_VECTOR (6 downto 0);
    signal invSignOfSelectionSignal_uid274_vecTranslateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_15_uid275_vecTranslateTest_a : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_15_uid275_vecTranslateTest_b : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_15_uid275_vecTranslateTest_o : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_15_uid275_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_15_uid275_vecTranslateTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_15_uid276_vecTranslateTest_a : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1E_15_uid276_vecTranslateTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1E_15_uid276_vecTranslateTest_o : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1E_15_uid276_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_15_uid276_vecTranslateTest_q : STD_LOGIC_VECTOR (21 downto 0);
    signal xip1_15_uid281_vecTranslateTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_15_uid281_vecTranslateTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_15_uid282_vecTranslateTest_in : STD_LOGIC_VECTOR (19 downto 0);
    signal yip1_15_uid282_vecTranslateTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal xMSB_uid284_vecTranslateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiYip_uid289_vecTranslateTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal invSignOfSelectionSignal_uid291_vecTranslateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_16_uid292_vecTranslateTest_a : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_16_uid292_vecTranslateTest_b : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_16_uid292_vecTranslateTest_o : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_16_uid292_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_16_uid292_vecTranslateTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1_16_uid298_vecTranslateTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_16_uid298_vecTranslateTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal concSignVector_uid301_vecTranslateTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal table_l5_uid303_vecTranslateTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal table_l5_uid304_vecTranslateTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal os_uid305_vecTranslateTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal table_l11_uid308_vecTranslateTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal table_l11_uid309_vecTranslateTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal os_uid310_vecTranslateTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal table_l15_uid313_vecTranslateTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal lev1_a0_uid316_vecTranslateTest_a : STD_LOGIC_VECTOR (20 downto 0);
    signal lev1_a0_uid316_vecTranslateTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal lev1_a0_uid316_vecTranslateTest_o : STD_LOGIC_VECTOR (20 downto 0);
    signal lev1_a0_uid316_vecTranslateTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal lev2_a0_uid317_vecTranslateTest_a : STD_LOGIC_VECTOR (21 downto 0);
    signal lev2_a0_uid317_vecTranslateTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal lev2_a0_uid317_vecTranslateTest_o : STD_LOGIC_VECTOR (21 downto 0);
    signal lev2_a0_uid317_vecTranslateTest_q : STD_LOGIC_VECTOR (21 downto 0);
    signal atanRes_uid318_vecTranslateTest_in : STD_LOGIC_VECTOR (19 downto 0);
    signal atanRes_uid318_vecTranslateTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal cstZeroOutFormat_uid319_vecTranslateTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal constPiP2uE_uid320_vecTranslateTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal constPio2P2u_mergedSignalTM_uid323_vecTranslateTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal concXZeroYZero_uid325_vecTranslateTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal atanResPostExc_uid326_vecTranslateTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal atanResPostExc_uid326_vecTranslateTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal concSigns_uid327_vecTranslateTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal constPiP2u_uid328_vecTranslateTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal constPi_uid329_vecTranslateTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal constantZeroOutFormat_uid330_vecTranslateTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal constantZeroOutFormatP2u_uid331_vecTranslateTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal firstOperand_uid333_vecTranslateTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal firstOperand_uid333_vecTranslateTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal secondOperand_uid334_vecTranslateTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal secondOperand_uid334_vecTranslateTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal outResExtended_uid335_vecTranslateTest_a : STD_LOGIC_VECTOR (17 downto 0);
    signal outResExtended_uid335_vecTranslateTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal outResExtended_uid335_vecTranslateTest_o : STD_LOGIC_VECTOR (17 downto 0);
    signal outResExtended_uid335_vecTranslateTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal atanResPostRR_uid336_vecTranslateTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal outMagPreCstMult_uid338_vecTranslateTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal outMagPostRnd_uid343_vecTranslateTest_a : STD_LOGIC_VECTOR (17 downto 0);
    signal outMagPostRnd_uid343_vecTranslateTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal outMagPostRnd_uid343_vecTranslateTest_o : STD_LOGIC_VECTOR (17 downto 0);
    signal outMagPostRnd_uid343_vecTranslateTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal outMag_uid344_vecTranslateTest_in : STD_LOGIC_VECTOR (16 downto 0);
    signal outMag_uid344_vecTranslateTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q : STD_LOGIC_VECTOR (36 downto 0);
    signal p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q : STD_LOGIC_VECTOR (30 downto 0);
    signal p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal lev1_a0sumAHighB_uid354_cstMultOutMag_uid339_vecTranslateTest_a : STD_LOGIC_VECTOR (37 downto 0);
    signal lev1_a0sumAHighB_uid354_cstMultOutMag_uid339_vecTranslateTest_b : STD_LOGIC_VECTOR (37 downto 0);
    signal lev1_a0sumAHighB_uid354_cstMultOutMag_uid339_vecTranslateTest_o : STD_LOGIC_VECTOR (37 downto 0);
    signal lev1_a0sumAHighB_uid354_cstMultOutMag_uid339_vecTranslateTest_q : STD_LOGIC_VECTOR (37 downto 0);
    signal lev1_a0_uid355_cstMultOutMag_uid339_vecTranslateTest_q : STD_LOGIC_VECTOR (38 downto 0);
    signal lev2_a0_uid356_cstMultOutMag_uid339_vecTranslateTest_a : STD_LOGIC_VECTOR (39 downto 0);
    signal lev2_a0_uid356_cstMultOutMag_uid339_vecTranslateTest_b : STD_LOGIC_VECTOR (39 downto 0);
    signal lev2_a0_uid356_cstMultOutMag_uid339_vecTranslateTest_o : STD_LOGIC_VECTOR (39 downto 0);
    signal lev2_a0_uid356_cstMultOutMag_uid339_vecTranslateTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal maxValInOutFormat_uid357_cstMultOutMag_uid339_vecTranslateTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal paddingX_uid359_cstMultOutMag_uid339_vecTranslateTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal updatedX_uid360_cstMultOutMag_uid339_vecTranslateTest_q : STD_LOGIC_VECTOR (36 downto 0);
    signal ovf_uid359_cstMultOutMag_uid339_vecTranslateTest_a : STD_LOGIC_VECTOR (41 downto 0);
    signal ovf_uid359_cstMultOutMag_uid339_vecTranslateTest_b : STD_LOGIC_VECTOR (41 downto 0);
    signal ovf_uid359_cstMultOutMag_uid339_vecTranslateTest_o : STD_LOGIC_VECTOR (41 downto 0);
    signal ovf_uid359_cstMultOutMag_uid339_vecTranslateTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal updatedY_uid363_cstMultOutMag_uid339_vecTranslateTest_q : STD_LOGIC_VECTOR (36 downto 0);
    signal udf_uid362_cstMultOutMag_uid339_vecTranslateTest_a : STD_LOGIC_VECTOR (41 downto 0);
    signal udf_uid362_cstMultOutMag_uid339_vecTranslateTest_b : STD_LOGIC_VECTOR (41 downto 0);
    signal udf_uid362_cstMultOutMag_uid339_vecTranslateTest_o : STD_LOGIC_VECTOR (41 downto 0);
    signal udf_uid362_cstMultOutMag_uid339_vecTranslateTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal ovfudfcond_uid365_cstMultOutMag_uid339_vecTranslateTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal sR_uid366_cstMultOutMag_uid339_vecTranslateTest_in : STD_LOGIC_VECTOR (36 downto 0);
    signal sR_uid366_cstMultOutMag_uid339_vecTranslateTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal sRA0_uid367_cstMultOutMag_uid339_vecTranslateTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal sRA0_uid367_cstMultOutMag_uid339_vecTranslateTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal is0_uid302_vecTranslateTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal is0_uid302_vecTranslateTest_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal is0_uid302_vecTranslateTest_merged_bit_select_d : STD_LOGIC_VECTOR (3 downto 0);
    signal xv0_uid346_cstMultOutMag_uid339_vecTranslateTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal xv0_uid346_cstMultOutMag_uid339_vecTranslateTest_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal xv0_uid346_cstMultOutMag_uid339_vecTranslateTest_merged_bit_select_d : STD_LOGIC_VECTOR (5 downto 0);
    signal lowRangeB_uid352_cstMultOutMag_uid339_vecTranslateTest_merged_bit_select_b : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid352_cstMultOutMag_uid339_vecTranslateTest_merged_bit_select_c : STD_LOGIC_VECTOR (29 downto 0);
    signal redist0_lowRangeB_uid352_cstMultOutMag_uid339_vecTranslateTest_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_xv0_uid346_cstMultOutMag_uid339_vecTranslateTest_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist2_is0_uid302_vecTranslateTest_merged_bit_select_d_1_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist3_sR_uid366_cstMultOutMag_uid339_vecTranslateTest_b_1_q : STD_LOGIC_VECTOR (16 downto 0);
    signal redist4_outMagPreCstMult_uid338_vecTranslateTest_b_1_q : STD_LOGIC_VECTOR (17 downto 0);
    signal redist5_atanResPostRR_uid336_vecTranslateTest_b_2_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist6_atanRes_uid318_vecTranslateTest_b_1_q : STD_LOGIC_VECTOR (16 downto 0);
    signal redist7_twoToMiSiYip_uid289_vecTranslateTest_b_1_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist8_xMSB_uid284_vecTranslateTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_xip1_15_uid281_vecTranslateTest_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist10_xMSB_uid267_vecTranslateTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_yip1_14_uid265_vecTranslateTest_b_1_q : STD_LOGIC_VECTOR (20 downto 0);
    signal redist12_xip1_14_uid264_vecTranslateTest_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist13_xMSB_uid250_vecTranslateTest_b_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_yip1_13_uid248_vecTranslateTest_b_1_q : STD_LOGIC_VECTOR (21 downto 0);
    signal redist15_xip1_13_uid247_vecTranslateTest_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist16_xMSB_uid233_vecTranslateTest_b_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_yip1_12_uid231_vecTranslateTest_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist18_xip1_12_uid230_vecTranslateTest_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist19_xMSB_uid216_vecTranslateTest_b_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_yip1_11_uid214_vecTranslateTest_b_1_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist21_xip1_11_uid213_vecTranslateTest_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist22_xMSB_uid199_vecTranslateTest_b_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_yip1_10_uid197_vecTranslateTest_b_1_q : STD_LOGIC_VECTOR (24 downto 0);
    signal redist24_xip1_10_uid196_vecTranslateTest_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist25_xMSB_uid182_vecTranslateTest_b_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_yip1_9_uid180_vecTranslateTest_b_1_q : STD_LOGIC_VECTOR (25 downto 0);
    signal redist27_xip1_9_uid179_vecTranslateTest_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist28_xMSB_uid165_vecTranslateTest_b_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_yip1_8_uid163_vecTranslateTest_b_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist30_xip1_8_uid162_vecTranslateTest_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist31_xMSB_uid148_vecTranslateTest_b_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_yip1_7_uid146_vecTranslateTest_b_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist33_xip1_7_uid145_vecTranslateTest_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist34_xMSB_uid127_vecTranslateTest_b_9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist35_yip1_6_uid125_vecTranslateTest_b_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist36_xip1_6_uid124_vecTranslateTest_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist37_xMSB_uid108_vecTranslateTest_b_10_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist38_yip1_5_uid106_vecTranslateTest_b_1_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist39_xip1_5_uid105_vecTranslateTest_b_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist40_xMSB_uid89_vecTranslateTest_b_11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist41_yip1_4_uid87_vecTranslateTest_b_1_q : STD_LOGIC_VECTOR (20 downto 0);
    signal redist42_xip1_4_uid86_vecTranslateTest_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist43_xMSB_uid70_vecTranslateTest_b_12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist44_yip1_3_uid68_vecTranslateTest_b_1_q : STD_LOGIC_VECTOR (18 downto 0);
    signal redist45_xip1_3_uid67_vecTranslateTest_b_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal redist46_xMSB_uid51_vecTranslateTest_b_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist47_yip1_2_uid49_vecTranslateTest_b_1_q : STD_LOGIC_VECTOR (17 downto 0);
    signal redist48_xip1_2_uid48_vecTranslateTest_b_1_q : STD_LOGIC_VECTOR (17 downto 0);
    signal redist49_xMSB_uid32_vecTranslateTest_b_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist50_xNotZero_uid17_vecTranslateTest_q_19_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist51_yNotZero_uid15_vecTranslateTest_q_19_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist52_absY_uid14_vecTranslateTest_b_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist53_absX_uid13_vecTranslateTest_b_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist54_signY_uid8_vecTranslateTest_b_19_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist55_signX_uid7_vecTranslateTest_b_19_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- maxValInOutFormat_uid357_cstMultOutMag_uid339_vecTranslateTest(CONSTANT,356)
    maxValInOutFormat_uid357_cstMultOutMag_uid339_vecTranslateTest_q <= "11111111111111111";

    -- constantZeroOutFormat_uid330_vecTranslateTest(CONSTANT,329)
    constantZeroOutFormat_uid330_vecTranslateTest_q <= "00000000000000000";

    -- xMSB_uid267_vecTranslateTest(BITSELECT,266)@15
    xMSB_uid267_vecTranslateTest_b <= STD_LOGIC_VECTOR(redist11_yip1_14_uid265_vecTranslateTest_b_1_q(20 downto 20));

    -- xMSB_uid233_vecTranslateTest(BITSELECT,232)@13
    xMSB_uid233_vecTranslateTest_b <= STD_LOGIC_VECTOR(redist17_yip1_12_uid231_vecTranslateTest_b_1_q(22 downto 22));

    -- xMSB_uid199_vecTranslateTest(BITSELECT,198)@11
    xMSB_uid199_vecTranslateTest_b <= STD_LOGIC_VECTOR(redist23_yip1_10_uid197_vecTranslateTest_b_1_q(24 downto 24));

    -- xMSB_uid165_vecTranslateTest(BITSELECT,164)@9
    xMSB_uid165_vecTranslateTest_b <= STD_LOGIC_VECTOR(redist29_yip1_8_uid163_vecTranslateTest_b_1_q(26 downto 26));

    -- signX_uid7_vecTranslateTest(BITSELECT,6)@0
    signX_uid7_vecTranslateTest_b <= STD_LOGIC_VECTOR(x(15 downto 15));

    -- invSignX_uid9_vecTranslateTest(LOGICAL,8)@0
    invSignX_uid9_vecTranslateTest_q <= not (signX_uid7_vecTranslateTest_b);

    -- constantZero_uid6_vecTranslateTest(CONSTANT,5)
    constantZero_uid6_vecTranslateTest_q <= "0000000000000000";

    -- absXE_uid10_vecTranslateTest(ADDSUB,9)@0
    absXE_uid10_vecTranslateTest_s <= invSignX_uid9_vecTranslateTest_q;
    absXE_uid10_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 16 => constantZero_uid6_vecTranslateTest_q(15)) & constantZero_uid6_vecTranslateTest_q));
    absXE_uid10_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 16 => x(15)) & x));
    absXE_uid10_vecTranslateTest_combproc: PROCESS (absXE_uid10_vecTranslateTest_a, absXE_uid10_vecTranslateTest_b, absXE_uid10_vecTranslateTest_s)
    BEGIN
        IF (absXE_uid10_vecTranslateTest_s = "1") THEN
            absXE_uid10_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(absXE_uid10_vecTranslateTest_a) + SIGNED(absXE_uid10_vecTranslateTest_b));
        ELSE
            absXE_uid10_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(absXE_uid10_vecTranslateTest_a) - SIGNED(absXE_uid10_vecTranslateTest_b));
        END IF;
    END PROCESS;
    absXE_uid10_vecTranslateTest_q <= absXE_uid10_vecTranslateTest_o(16 downto 0);

    -- absX_uid13_vecTranslateTest(BITSELECT,12)@0
    absX_uid13_vecTranslateTest_in <= absXE_uid10_vecTranslateTest_q(15 downto 0);
    absX_uid13_vecTranslateTest_b <= absX_uid13_vecTranslateTest_in(15 downto 0);

    -- redist53_absX_uid13_vecTranslateTest_b_1(DELAY,455)
    redist53_absX_uid13_vecTranslateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => absX_uid13_vecTranslateTest_b, xout => redist53_absX_uid13_vecTranslateTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- signY_uid8_vecTranslateTest(BITSELECT,7)@0
    signY_uid8_vecTranslateTest_b <= STD_LOGIC_VECTOR(y(15 downto 15));

    -- invSignY_uid11_vecTranslateTest(LOGICAL,10)@0
    invSignY_uid11_vecTranslateTest_q <= not (signY_uid8_vecTranslateTest_b);

    -- absYE_uid12_vecTranslateTest(ADDSUB,11)@0
    absYE_uid12_vecTranslateTest_s <= invSignY_uid11_vecTranslateTest_q;
    absYE_uid12_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 16 => constantZero_uid6_vecTranslateTest_q(15)) & constantZero_uid6_vecTranslateTest_q));
    absYE_uid12_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 16 => y(15)) & y));
    absYE_uid12_vecTranslateTest_combproc: PROCESS (absYE_uid12_vecTranslateTest_a, absYE_uid12_vecTranslateTest_b, absYE_uid12_vecTranslateTest_s)
    BEGIN
        IF (absYE_uid12_vecTranslateTest_s = "1") THEN
            absYE_uid12_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(absYE_uid12_vecTranslateTest_a) + SIGNED(absYE_uid12_vecTranslateTest_b));
        ELSE
            absYE_uid12_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(absYE_uid12_vecTranslateTest_a) - SIGNED(absYE_uid12_vecTranslateTest_b));
        END IF;
    END PROCESS;
    absYE_uid12_vecTranslateTest_q <= absYE_uid12_vecTranslateTest_o(16 downto 0);

    -- absY_uid14_vecTranslateTest(BITSELECT,13)@0
    absY_uid14_vecTranslateTest_in <= absYE_uid12_vecTranslateTest_q(15 downto 0);
    absY_uid14_vecTranslateTest_b <= absY_uid14_vecTranslateTest_in(15 downto 0);

    -- redist52_absY_uid14_vecTranslateTest_b_1(DELAY,454)
    redist52_absY_uid14_vecTranslateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => absY_uid14_vecTranslateTest_b, xout => redist52_absY_uid14_vecTranslateTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- yip1E_1_uid24_vecTranslateTest(SUB,23)@1 + 1
    yip1E_1_uid24_vecTranslateTest_a <= STD_LOGIC_VECTOR("0" & redist52_absY_uid14_vecTranslateTest_b_1_q);
    yip1E_1_uid24_vecTranslateTest_b <= STD_LOGIC_VECTOR("0" & redist53_absX_uid13_vecTranslateTest_b_1_q);
    yip1E_1_uid24_vecTranslateTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            yip1E_1_uid24_vecTranslateTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                yip1E_1_uid24_vecTranslateTest_o <= STD_LOGIC_VECTOR(UNSIGNED(yip1E_1_uid24_vecTranslateTest_a) - UNSIGNED(yip1E_1_uid24_vecTranslateTest_b));
            END IF;
        END IF;
    END PROCESS;
    yip1E_1_uid24_vecTranslateTest_q <= yip1E_1_uid24_vecTranslateTest_o(16 downto 0);

    -- xMSB_uid32_vecTranslateTest(BITSELECT,31)@2
    xMSB_uid32_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1E_1_uid24_vecTranslateTest_q(16 downto 16));

    -- xip1E_1_uid23_vecTranslateTest(ADD,22)@1 + 1
    xip1E_1_uid23_vecTranslateTest_a <= STD_LOGIC_VECTOR("0" & redist53_absX_uid13_vecTranslateTest_b_1_q);
    xip1E_1_uid23_vecTranslateTest_b <= STD_LOGIC_VECTOR("0" & redist52_absY_uid14_vecTranslateTest_b_1_q);
    xip1E_1_uid23_vecTranslateTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            xip1E_1_uid23_vecTranslateTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                xip1E_1_uid23_vecTranslateTest_o <= STD_LOGIC_VECTOR(UNSIGNED(xip1E_1_uid23_vecTranslateTest_a) + UNSIGNED(xip1E_1_uid23_vecTranslateTest_b));
            END IF;
        END IF;
    END PROCESS;
    xip1E_1_uid23_vecTranslateTest_q <= xip1E_1_uid23_vecTranslateTest_o(16 downto 0);

    -- yip1E_2NA_uid42_vecTranslateTest(BITJOIN,41)@2
    yip1E_2NA_uid42_vecTranslateTest_q <= yip1E_1_uid24_vecTranslateTest_q & GND_q;

    -- yip1E_2sumAHighB_uid43_vecTranslateTest(ADDSUB,42)@2
    yip1E_2sumAHighB_uid43_vecTranslateTest_s <= xMSB_uid32_vecTranslateTest_b;
    yip1E_2sumAHighB_uid43_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 18 => yip1E_2NA_uid42_vecTranslateTest_q(17)) & yip1E_2NA_uid42_vecTranslateTest_q));
    yip1E_2sumAHighB_uid43_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & xip1E_1_uid23_vecTranslateTest_q));
    yip1E_2sumAHighB_uid43_vecTranslateTest_combproc: PROCESS (yip1E_2sumAHighB_uid43_vecTranslateTest_a, yip1E_2sumAHighB_uid43_vecTranslateTest_b, yip1E_2sumAHighB_uid43_vecTranslateTest_s)
    BEGIN
        IF (yip1E_2sumAHighB_uid43_vecTranslateTest_s = "1") THEN
            yip1E_2sumAHighB_uid43_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_2sumAHighB_uid43_vecTranslateTest_a) + SIGNED(yip1E_2sumAHighB_uid43_vecTranslateTest_b));
        ELSE
            yip1E_2sumAHighB_uid43_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_2sumAHighB_uid43_vecTranslateTest_a) - SIGNED(yip1E_2sumAHighB_uid43_vecTranslateTest_b));
        END IF;
    END PROCESS;
    yip1E_2sumAHighB_uid43_vecTranslateTest_q <= yip1E_2sumAHighB_uid43_vecTranslateTest_o(18 downto 0);

    -- yip1_2_uid49_vecTranslateTest(BITSELECT,48)@2
    yip1_2_uid49_vecTranslateTest_in <= STD_LOGIC_VECTOR(yip1E_2sumAHighB_uid43_vecTranslateTest_q(17 downto 0));
    yip1_2_uid49_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1_2_uid49_vecTranslateTest_in(17 downto 0));

    -- redist47_yip1_2_uid49_vecTranslateTest_b_1(DELAY,449)
    redist47_yip1_2_uid49_vecTranslateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 18, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_2_uid49_vecTranslateTest_b, xout => redist47_yip1_2_uid49_vecTranslateTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- xMSB_uid51_vecTranslateTest(BITSELECT,50)@3
    xMSB_uid51_vecTranslateTest_b <= STD_LOGIC_VECTOR(redist47_yip1_2_uid49_vecTranslateTest_b_1_q(17 downto 17));

    -- invSignOfSelectionSignal_uid37_vecTranslateTest(LOGICAL,36)@2
    invSignOfSelectionSignal_uid37_vecTranslateTest_q <= not (xMSB_uid32_vecTranslateTest_b);

    -- xip1E_2NA_uid39_vecTranslateTest(BITJOIN,38)@2
    xip1E_2NA_uid39_vecTranslateTest_q <= xip1E_1_uid23_vecTranslateTest_q & GND_q;

    -- xip1E_2sumAHighB_uid40_vecTranslateTest(ADDSUB,39)@2
    xip1E_2sumAHighB_uid40_vecTranslateTest_s <= invSignOfSelectionSignal_uid37_vecTranslateTest_q;
    xip1E_2sumAHighB_uid40_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & xip1E_2NA_uid39_vecTranslateTest_q));
    xip1E_2sumAHighB_uid40_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 17 => yip1E_1_uid24_vecTranslateTest_q(16)) & yip1E_1_uid24_vecTranslateTest_q));
    xip1E_2sumAHighB_uid40_vecTranslateTest_combproc: PROCESS (xip1E_2sumAHighB_uid40_vecTranslateTest_a, xip1E_2sumAHighB_uid40_vecTranslateTest_b, xip1E_2sumAHighB_uid40_vecTranslateTest_s)
    BEGIN
        IF (xip1E_2sumAHighB_uid40_vecTranslateTest_s = "1") THEN
            xip1E_2sumAHighB_uid40_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_2sumAHighB_uid40_vecTranslateTest_a) + SIGNED(xip1E_2sumAHighB_uid40_vecTranslateTest_b));
        ELSE
            xip1E_2sumAHighB_uid40_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_2sumAHighB_uid40_vecTranslateTest_a) - SIGNED(xip1E_2sumAHighB_uid40_vecTranslateTest_b));
        END IF;
    END PROCESS;
    xip1E_2sumAHighB_uid40_vecTranslateTest_q <= xip1E_2sumAHighB_uid40_vecTranslateTest_o(19 downto 0);

    -- xip1_2_uid48_vecTranslateTest(BITSELECT,47)@2
    xip1_2_uid48_vecTranslateTest_in <= xip1E_2sumAHighB_uid40_vecTranslateTest_q(17 downto 0);
    xip1_2_uid48_vecTranslateTest_b <= xip1_2_uid48_vecTranslateTest_in(17 downto 0);

    -- redist48_xip1_2_uid48_vecTranslateTest_b_1(DELAY,450)
    redist48_xip1_2_uid48_vecTranslateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 18, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_2_uid48_vecTranslateTest_b, xout => redist48_xip1_2_uid48_vecTranslateTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- xip1E_3CostZeroPaddingA_uid57_vecTranslateTest(CONSTANT,56)
    xip1E_3CostZeroPaddingA_uid57_vecTranslateTest_q <= "00";

    -- yip1E_3NA_uid61_vecTranslateTest(BITJOIN,60)@3
    yip1E_3NA_uid61_vecTranslateTest_q <= redist47_yip1_2_uid49_vecTranslateTest_b_1_q & xip1E_3CostZeroPaddingA_uid57_vecTranslateTest_q;

    -- yip1E_3sumAHighB_uid62_vecTranslateTest(ADDSUB,61)@3
    yip1E_3sumAHighB_uid62_vecTranslateTest_s <= xMSB_uid51_vecTranslateTest_b;
    yip1E_3sumAHighB_uid62_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 20 => yip1E_3NA_uid61_vecTranslateTest_q(19)) & yip1E_3NA_uid61_vecTranslateTest_q));
    yip1E_3sumAHighB_uid62_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000" & redist48_xip1_2_uid48_vecTranslateTest_b_1_q));
    yip1E_3sumAHighB_uid62_vecTranslateTest_combproc: PROCESS (yip1E_3sumAHighB_uid62_vecTranslateTest_a, yip1E_3sumAHighB_uid62_vecTranslateTest_b, yip1E_3sumAHighB_uid62_vecTranslateTest_s)
    BEGIN
        IF (yip1E_3sumAHighB_uid62_vecTranslateTest_s = "1") THEN
            yip1E_3sumAHighB_uid62_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_3sumAHighB_uid62_vecTranslateTest_a) + SIGNED(yip1E_3sumAHighB_uid62_vecTranslateTest_b));
        ELSE
            yip1E_3sumAHighB_uid62_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_3sumAHighB_uid62_vecTranslateTest_a) - SIGNED(yip1E_3sumAHighB_uid62_vecTranslateTest_b));
        END IF;
    END PROCESS;
    yip1E_3sumAHighB_uid62_vecTranslateTest_q <= yip1E_3sumAHighB_uid62_vecTranslateTest_o(20 downto 0);

    -- yip1_3_uid68_vecTranslateTest(BITSELECT,67)@3
    yip1_3_uid68_vecTranslateTest_in <= STD_LOGIC_VECTOR(yip1E_3sumAHighB_uid62_vecTranslateTest_q(18 downto 0));
    yip1_3_uid68_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1_3_uid68_vecTranslateTest_in(18 downto 0));

    -- redist44_yip1_3_uid68_vecTranslateTest_b_1(DELAY,446)
    redist44_yip1_3_uid68_vecTranslateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 19, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_3_uid68_vecTranslateTest_b, xout => redist44_yip1_3_uid68_vecTranslateTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- xMSB_uid70_vecTranslateTest(BITSELECT,69)@4
    xMSB_uid70_vecTranslateTest_b <= STD_LOGIC_VECTOR(redist44_yip1_3_uid68_vecTranslateTest_b_1_q(18 downto 18));

    -- invSignOfSelectionSignal_uid56_vecTranslateTest(LOGICAL,55)@3
    invSignOfSelectionSignal_uid56_vecTranslateTest_q <= not (xMSB_uid51_vecTranslateTest_b);

    -- xip1E_3NA_uid58_vecTranslateTest(BITJOIN,57)@3
    xip1E_3NA_uid58_vecTranslateTest_q <= redist48_xip1_2_uid48_vecTranslateTest_b_1_q & xip1E_3CostZeroPaddingA_uid57_vecTranslateTest_q;

    -- xip1E_3sumAHighB_uid59_vecTranslateTest(ADDSUB,58)@3
    xip1E_3sumAHighB_uid59_vecTranslateTest_s <= invSignOfSelectionSignal_uid56_vecTranslateTest_q;
    xip1E_3sumAHighB_uid59_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & xip1E_3NA_uid58_vecTranslateTest_q));
    xip1E_3sumAHighB_uid59_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 18 => redist47_yip1_2_uid49_vecTranslateTest_b_1_q(17)) & redist47_yip1_2_uid49_vecTranslateTest_b_1_q));
    xip1E_3sumAHighB_uid59_vecTranslateTest_combproc: PROCESS (xip1E_3sumAHighB_uid59_vecTranslateTest_a, xip1E_3sumAHighB_uid59_vecTranslateTest_b, xip1E_3sumAHighB_uid59_vecTranslateTest_s)
    BEGIN
        IF (xip1E_3sumAHighB_uid59_vecTranslateTest_s = "1") THEN
            xip1E_3sumAHighB_uid59_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_3sumAHighB_uid59_vecTranslateTest_a) + SIGNED(xip1E_3sumAHighB_uid59_vecTranslateTest_b));
        ELSE
            xip1E_3sumAHighB_uid59_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_3sumAHighB_uid59_vecTranslateTest_a) - SIGNED(xip1E_3sumAHighB_uid59_vecTranslateTest_b));
        END IF;
    END PROCESS;
    xip1E_3sumAHighB_uid59_vecTranslateTest_q <= xip1E_3sumAHighB_uid59_vecTranslateTest_o(21 downto 0);

    -- xip1_3_uid67_vecTranslateTest(BITSELECT,66)@3
    xip1_3_uid67_vecTranslateTest_in <= xip1E_3sumAHighB_uid59_vecTranslateTest_q(19 downto 0);
    xip1_3_uid67_vecTranslateTest_b <= xip1_3_uid67_vecTranslateTest_in(19 downto 0);

    -- redist45_xip1_3_uid67_vecTranslateTest_b_1(DELAY,447)
    redist45_xip1_3_uid67_vecTranslateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 20, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_3_uid67_vecTranslateTest_b, xout => redist45_xip1_3_uid67_vecTranslateTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- xip1E_4CostZeroPaddingA_uid76_vecTranslateTest(CONSTANT,75)
    xip1E_4CostZeroPaddingA_uid76_vecTranslateTest_q <= "000";

    -- yip1E_4NA_uid80_vecTranslateTest(BITJOIN,79)@4
    yip1E_4NA_uid80_vecTranslateTest_q <= redist44_yip1_3_uid68_vecTranslateTest_b_1_q & xip1E_4CostZeroPaddingA_uid76_vecTranslateTest_q;

    -- yip1E_4sumAHighB_uid81_vecTranslateTest(ADDSUB,80)@4
    yip1E_4sumAHighB_uid81_vecTranslateTest_s <= xMSB_uid70_vecTranslateTest_b;
    yip1E_4sumAHighB_uid81_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 22 => yip1E_4NA_uid80_vecTranslateTest_q(21)) & yip1E_4NA_uid80_vecTranslateTest_q));
    yip1E_4sumAHighB_uid81_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000" & redist45_xip1_3_uid67_vecTranslateTest_b_1_q));
    yip1E_4sumAHighB_uid81_vecTranslateTest_combproc: PROCESS (yip1E_4sumAHighB_uid81_vecTranslateTest_a, yip1E_4sumAHighB_uid81_vecTranslateTest_b, yip1E_4sumAHighB_uid81_vecTranslateTest_s)
    BEGIN
        IF (yip1E_4sumAHighB_uid81_vecTranslateTest_s = "1") THEN
            yip1E_4sumAHighB_uid81_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_4sumAHighB_uid81_vecTranslateTest_a) + SIGNED(yip1E_4sumAHighB_uid81_vecTranslateTest_b));
        ELSE
            yip1E_4sumAHighB_uid81_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_4sumAHighB_uid81_vecTranslateTest_a) - SIGNED(yip1E_4sumAHighB_uid81_vecTranslateTest_b));
        END IF;
    END PROCESS;
    yip1E_4sumAHighB_uid81_vecTranslateTest_q <= yip1E_4sumAHighB_uid81_vecTranslateTest_o(22 downto 0);

    -- yip1_4_uid87_vecTranslateTest(BITSELECT,86)@4
    yip1_4_uid87_vecTranslateTest_in <= STD_LOGIC_VECTOR(yip1E_4sumAHighB_uid81_vecTranslateTest_q(20 downto 0));
    yip1_4_uid87_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1_4_uid87_vecTranslateTest_in(20 downto 0));

    -- redist41_yip1_4_uid87_vecTranslateTest_b_1(DELAY,443)
    redist41_yip1_4_uid87_vecTranslateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 21, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_4_uid87_vecTranslateTest_b, xout => redist41_yip1_4_uid87_vecTranslateTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- xMSB_uid89_vecTranslateTest(BITSELECT,88)@5
    xMSB_uid89_vecTranslateTest_b <= STD_LOGIC_VECTOR(redist41_yip1_4_uid87_vecTranslateTest_b_1_q(20 downto 20));

    -- invSignOfSelectionSignal_uid75_vecTranslateTest(LOGICAL,74)@4
    invSignOfSelectionSignal_uid75_vecTranslateTest_q <= not (xMSB_uid70_vecTranslateTest_b);

    -- xip1E_4NA_uid77_vecTranslateTest(BITJOIN,76)@4
    xip1E_4NA_uid77_vecTranslateTest_q <= redist45_xip1_3_uid67_vecTranslateTest_b_1_q & xip1E_4CostZeroPaddingA_uid76_vecTranslateTest_q;

    -- xip1E_4sumAHighB_uid78_vecTranslateTest(ADDSUB,77)@4
    xip1E_4sumAHighB_uid78_vecTranslateTest_s <= invSignOfSelectionSignal_uid75_vecTranslateTest_q;
    xip1E_4sumAHighB_uid78_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & xip1E_4NA_uid77_vecTranslateTest_q));
    xip1E_4sumAHighB_uid78_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 19 => redist44_yip1_3_uid68_vecTranslateTest_b_1_q(18)) & redist44_yip1_3_uid68_vecTranslateTest_b_1_q));
    xip1E_4sumAHighB_uid78_vecTranslateTest_combproc: PROCESS (xip1E_4sumAHighB_uid78_vecTranslateTest_a, xip1E_4sumAHighB_uid78_vecTranslateTest_b, xip1E_4sumAHighB_uid78_vecTranslateTest_s)
    BEGIN
        IF (xip1E_4sumAHighB_uid78_vecTranslateTest_s = "1") THEN
            xip1E_4sumAHighB_uid78_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_4sumAHighB_uid78_vecTranslateTest_a) + SIGNED(xip1E_4sumAHighB_uid78_vecTranslateTest_b));
        ELSE
            xip1E_4sumAHighB_uid78_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_4sumAHighB_uid78_vecTranslateTest_a) - SIGNED(xip1E_4sumAHighB_uid78_vecTranslateTest_b));
        END IF;
    END PROCESS;
    xip1E_4sumAHighB_uid78_vecTranslateTest_q <= xip1E_4sumAHighB_uid78_vecTranslateTest_o(24 downto 0);

    -- xip1_4_uid86_vecTranslateTest(BITSELECT,85)@4
    xip1_4_uid86_vecTranslateTest_in <= xip1E_4sumAHighB_uid78_vecTranslateTest_q(22 downto 0);
    xip1_4_uid86_vecTranslateTest_b <= xip1_4_uid86_vecTranslateTest_in(22 downto 0);

    -- redist42_xip1_4_uid86_vecTranslateTest_b_1(DELAY,444)
    redist42_xip1_4_uid86_vecTranslateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_4_uid86_vecTranslateTest_b, xout => redist42_xip1_4_uid86_vecTranslateTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- xip1E_5CostZeroPaddingA_uid95_vecTranslateTest(CONSTANT,94)
    xip1E_5CostZeroPaddingA_uid95_vecTranslateTest_q <= "0000";

    -- yip1E_5NA_uid99_vecTranslateTest(BITJOIN,98)@5
    yip1E_5NA_uid99_vecTranslateTest_q <= redist41_yip1_4_uid87_vecTranslateTest_b_1_q & xip1E_5CostZeroPaddingA_uid95_vecTranslateTest_q;

    -- yip1E_5sumAHighB_uid100_vecTranslateTest(ADDSUB,99)@5
    yip1E_5sumAHighB_uid100_vecTranslateTest_s <= xMSB_uid89_vecTranslateTest_b;
    yip1E_5sumAHighB_uid100_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 25 => yip1E_5NA_uid99_vecTranslateTest_q(24)) & yip1E_5NA_uid99_vecTranslateTest_q));
    yip1E_5sumAHighB_uid100_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000" & redist42_xip1_4_uid86_vecTranslateTest_b_1_q));
    yip1E_5sumAHighB_uid100_vecTranslateTest_combproc: PROCESS (yip1E_5sumAHighB_uid100_vecTranslateTest_a, yip1E_5sumAHighB_uid100_vecTranslateTest_b, yip1E_5sumAHighB_uid100_vecTranslateTest_s)
    BEGIN
        IF (yip1E_5sumAHighB_uid100_vecTranslateTest_s = "1") THEN
            yip1E_5sumAHighB_uid100_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_5sumAHighB_uid100_vecTranslateTest_a) + SIGNED(yip1E_5sumAHighB_uid100_vecTranslateTest_b));
        ELSE
            yip1E_5sumAHighB_uid100_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_5sumAHighB_uid100_vecTranslateTest_a) - SIGNED(yip1E_5sumAHighB_uid100_vecTranslateTest_b));
        END IF;
    END PROCESS;
    yip1E_5sumAHighB_uid100_vecTranslateTest_q <= yip1E_5sumAHighB_uid100_vecTranslateTest_o(25 downto 0);

    -- yip1_5_uid106_vecTranslateTest(BITSELECT,105)@5
    yip1_5_uid106_vecTranslateTest_in <= STD_LOGIC_VECTOR(yip1E_5sumAHighB_uid100_vecTranslateTest_q(23 downto 0));
    yip1_5_uid106_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1_5_uid106_vecTranslateTest_in(23 downto 0));

    -- redist38_yip1_5_uid106_vecTranslateTest_b_1(DELAY,440)
    redist38_yip1_5_uid106_vecTranslateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_5_uid106_vecTranslateTest_b, xout => redist38_yip1_5_uid106_vecTranslateTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- xMSB_uid108_vecTranslateTest(BITSELECT,107)@6
    xMSB_uid108_vecTranslateTest_b <= STD_LOGIC_VECTOR(redist38_yip1_5_uid106_vecTranslateTest_b_1_q(23 downto 23));

    -- invSignOfSelectionSignal_uid94_vecTranslateTest(LOGICAL,93)@5
    invSignOfSelectionSignal_uid94_vecTranslateTest_q <= not (xMSB_uid89_vecTranslateTest_b);

    -- xip1E_5NA_uid96_vecTranslateTest(BITJOIN,95)@5
    xip1E_5NA_uid96_vecTranslateTest_q <= redist42_xip1_4_uid86_vecTranslateTest_b_1_q & xip1E_5CostZeroPaddingA_uid95_vecTranslateTest_q;

    -- xip1E_5sumAHighB_uid97_vecTranslateTest(ADDSUB,96)@5
    xip1E_5sumAHighB_uid97_vecTranslateTest_s <= invSignOfSelectionSignal_uid94_vecTranslateTest_q;
    xip1E_5sumAHighB_uid97_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & xip1E_5NA_uid96_vecTranslateTest_q));
    xip1E_5sumAHighB_uid97_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 21 => redist41_yip1_4_uid87_vecTranslateTest_b_1_q(20)) & redist41_yip1_4_uid87_vecTranslateTest_b_1_q));
    xip1E_5sumAHighB_uid97_vecTranslateTest_combproc: PROCESS (xip1E_5sumAHighB_uid97_vecTranslateTest_a, xip1E_5sumAHighB_uid97_vecTranslateTest_b, xip1E_5sumAHighB_uid97_vecTranslateTest_s)
    BEGIN
        IF (xip1E_5sumAHighB_uid97_vecTranslateTest_s = "1") THEN
            xip1E_5sumAHighB_uid97_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_5sumAHighB_uid97_vecTranslateTest_a) + SIGNED(xip1E_5sumAHighB_uid97_vecTranslateTest_b));
        ELSE
            xip1E_5sumAHighB_uid97_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_5sumAHighB_uid97_vecTranslateTest_a) - SIGNED(xip1E_5sumAHighB_uid97_vecTranslateTest_b));
        END IF;
    END PROCESS;
    xip1E_5sumAHighB_uid97_vecTranslateTest_q <= xip1E_5sumAHighB_uid97_vecTranslateTest_o(28 downto 0);

    -- xip1_5_uid105_vecTranslateTest(BITSELECT,104)@5
    xip1_5_uid105_vecTranslateTest_in <= xip1E_5sumAHighB_uid97_vecTranslateTest_q(26 downto 0);
    xip1_5_uid105_vecTranslateTest_b <= xip1_5_uid105_vecTranslateTest_in(26 downto 0);

    -- redist39_xip1_5_uid105_vecTranslateTest_b_1(DELAY,441)
    redist39_xip1_5_uid105_vecTranslateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 27, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_5_uid105_vecTranslateTest_b, xout => redist39_xip1_5_uid105_vecTranslateTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- xip1E_6CostZeroPaddingA_uid114_vecTranslateTest(CONSTANT,113)
    xip1E_6CostZeroPaddingA_uid114_vecTranslateTest_q <= "00000";

    -- yip1E_6NA_uid118_vecTranslateTest(BITJOIN,117)@6
    yip1E_6NA_uid118_vecTranslateTest_q <= redist38_yip1_5_uid106_vecTranslateTest_b_1_q & xip1E_6CostZeroPaddingA_uid114_vecTranslateTest_q;

    -- yip1E_6sumAHighB_uid119_vecTranslateTest(ADDSUB,118)@6
    yip1E_6sumAHighB_uid119_vecTranslateTest_s <= xMSB_uid108_vecTranslateTest_b;
    yip1E_6sumAHighB_uid119_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 29 => yip1E_6NA_uid118_vecTranslateTest_q(28)) & yip1E_6NA_uid118_vecTranslateTest_q));
    yip1E_6sumAHighB_uid119_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000" & redist39_xip1_5_uid105_vecTranslateTest_b_1_q));
    yip1E_6sumAHighB_uid119_vecTranslateTest_combproc: PROCESS (yip1E_6sumAHighB_uid119_vecTranslateTest_a, yip1E_6sumAHighB_uid119_vecTranslateTest_b, yip1E_6sumAHighB_uid119_vecTranslateTest_s)
    BEGIN
        IF (yip1E_6sumAHighB_uid119_vecTranslateTest_s = "1") THEN
            yip1E_6sumAHighB_uid119_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_6sumAHighB_uid119_vecTranslateTest_a) + SIGNED(yip1E_6sumAHighB_uid119_vecTranslateTest_b));
        ELSE
            yip1E_6sumAHighB_uid119_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_6sumAHighB_uid119_vecTranslateTest_a) - SIGNED(yip1E_6sumAHighB_uid119_vecTranslateTest_b));
        END IF;
    END PROCESS;
    yip1E_6sumAHighB_uid119_vecTranslateTest_q <= yip1E_6sumAHighB_uid119_vecTranslateTest_o(29 downto 0);

    -- yip1_6_uid125_vecTranslateTest(BITSELECT,124)@6
    yip1_6_uid125_vecTranslateTest_in <= STD_LOGIC_VECTOR(yip1E_6sumAHighB_uid119_vecTranslateTest_q(27 downto 0));
    yip1_6_uid125_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1_6_uid125_vecTranslateTest_in(27 downto 0));

    -- redist35_yip1_6_uid125_vecTranslateTest_b_1(DELAY,437)
    redist35_yip1_6_uid125_vecTranslateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_6_uid125_vecTranslateTest_b, xout => redist35_yip1_6_uid125_vecTranslateTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- xMSB_uid127_vecTranslateTest(BITSELECT,126)@7
    xMSB_uid127_vecTranslateTest_b <= STD_LOGIC_VECTOR(redist35_yip1_6_uid125_vecTranslateTest_b_1_q(27 downto 27));

    -- invSignOfSelectionSignal_uid113_vecTranslateTest(LOGICAL,112)@6
    invSignOfSelectionSignal_uid113_vecTranslateTest_q <= not (xMSB_uid108_vecTranslateTest_b);

    -- xip1E_6NA_uid115_vecTranslateTest(BITJOIN,114)@6
    xip1E_6NA_uid115_vecTranslateTest_q <= redist39_xip1_5_uid105_vecTranslateTest_b_1_q & xip1E_6CostZeroPaddingA_uid114_vecTranslateTest_q;

    -- xip1E_6sumAHighB_uid116_vecTranslateTest(ADDSUB,115)@6
    xip1E_6sumAHighB_uid116_vecTranslateTest_s <= invSignOfSelectionSignal_uid113_vecTranslateTest_q;
    xip1E_6sumAHighB_uid116_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & xip1E_6NA_uid115_vecTranslateTest_q));
    xip1E_6sumAHighB_uid116_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 24 => redist38_yip1_5_uid106_vecTranslateTest_b_1_q(23)) & redist38_yip1_5_uid106_vecTranslateTest_b_1_q));
    xip1E_6sumAHighB_uid116_vecTranslateTest_combproc: PROCESS (xip1E_6sumAHighB_uid116_vecTranslateTest_a, xip1E_6sumAHighB_uid116_vecTranslateTest_b, xip1E_6sumAHighB_uid116_vecTranslateTest_s)
    BEGIN
        IF (xip1E_6sumAHighB_uid116_vecTranslateTest_s = "1") THEN
            xip1E_6sumAHighB_uid116_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_6sumAHighB_uid116_vecTranslateTest_a) + SIGNED(xip1E_6sumAHighB_uid116_vecTranslateTest_b));
        ELSE
            xip1E_6sumAHighB_uid116_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_6sumAHighB_uid116_vecTranslateTest_a) - SIGNED(xip1E_6sumAHighB_uid116_vecTranslateTest_b));
        END IF;
    END PROCESS;
    xip1E_6sumAHighB_uid116_vecTranslateTest_q <= xip1E_6sumAHighB_uid116_vecTranslateTest_o(33 downto 0);

    -- xip1_6_uid124_vecTranslateTest(BITSELECT,123)@6
    xip1_6_uid124_vecTranslateTest_in <= xip1E_6sumAHighB_uid116_vecTranslateTest_q(31 downto 0);
    xip1_6_uid124_vecTranslateTest_b <= xip1_6_uid124_vecTranslateTest_in(31 downto 0);

    -- redist36_xip1_6_uid124_vecTranslateTest_b_1(DELAY,438)
    redist36_xip1_6_uid124_vecTranslateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_6_uid124_vecTranslateTest_b, xout => redist36_xip1_6_uid124_vecTranslateTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- twoToMiSiXip_uid131_vecTranslateTest(BITSELECT,130)@7
    twoToMiSiXip_uid131_vecTranslateTest_b <= redist36_xip1_6_uid124_vecTranslateTest_b_1_q(31 downto 5);

    -- yip1E_7NA_uid139_vecTranslateTest(BITJOIN,138)@7
    yip1E_7NA_uid139_vecTranslateTest_q <= redist35_yip1_6_uid125_vecTranslateTest_b_1_q & GND_q;

    -- yip1E_7sumAHighB_uid140_vecTranslateTest(ADDSUB,139)@7
    yip1E_7sumAHighB_uid140_vecTranslateTest_s <= xMSB_uid127_vecTranslateTest_b;
    yip1E_7sumAHighB_uid140_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 29 => yip1E_7NA_uid139_vecTranslateTest_q(28)) & yip1E_7NA_uid139_vecTranslateTest_q));
    yip1E_7sumAHighB_uid140_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000" & twoToMiSiXip_uid131_vecTranslateTest_b));
    yip1E_7sumAHighB_uid140_vecTranslateTest_combproc: PROCESS (yip1E_7sumAHighB_uid140_vecTranslateTest_a, yip1E_7sumAHighB_uid140_vecTranslateTest_b, yip1E_7sumAHighB_uid140_vecTranslateTest_s)
    BEGIN
        IF (yip1E_7sumAHighB_uid140_vecTranslateTest_s = "1") THEN
            yip1E_7sumAHighB_uid140_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_7sumAHighB_uid140_vecTranslateTest_a) + SIGNED(yip1E_7sumAHighB_uid140_vecTranslateTest_b));
        ELSE
            yip1E_7sumAHighB_uid140_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_7sumAHighB_uid140_vecTranslateTest_a) - SIGNED(yip1E_7sumAHighB_uid140_vecTranslateTest_b));
        END IF;
    END PROCESS;
    yip1E_7sumAHighB_uid140_vecTranslateTest_q <= yip1E_7sumAHighB_uid140_vecTranslateTest_o(29 downto 0);

    -- yip1_7_uid146_vecTranslateTest(BITSELECT,145)@7
    yip1_7_uid146_vecTranslateTest_in <= STD_LOGIC_VECTOR(yip1E_7sumAHighB_uid140_vecTranslateTest_q(27 downto 0));
    yip1_7_uid146_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1_7_uid146_vecTranslateTest_in(27 downto 0));

    -- redist32_yip1_7_uid146_vecTranslateTest_b_1(DELAY,434)
    redist32_yip1_7_uid146_vecTranslateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_7_uid146_vecTranslateTest_b, xout => redist32_yip1_7_uid146_vecTranslateTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- xMSB_uid148_vecTranslateTest(BITSELECT,147)@8
    xMSB_uid148_vecTranslateTest_b <= STD_LOGIC_VECTOR(redist32_yip1_7_uid146_vecTranslateTest_b_1_q(27 downto 27));

    -- invSignOfSelectionSignal_uid155_vecTranslateTest(LOGICAL,154)@8
    invSignOfSelectionSignal_uid155_vecTranslateTest_q <= not (xMSB_uid148_vecTranslateTest_b);

    -- twoToMiSiYip_uid153_vecTranslateTest(BITSELECT,152)@8
    twoToMiSiYip_uid153_vecTranslateTest_b <= STD_LOGIC_VECTOR(redist32_yip1_7_uid146_vecTranslateTest_b_1_q(27 downto 7));

    -- invSignOfSelectionSignal_uid134_vecTranslateTest(LOGICAL,133)@7
    invSignOfSelectionSignal_uid134_vecTranslateTest_q <= not (xMSB_uid127_vecTranslateTest_b);

    -- twoToMiSiYip_uid132_vecTranslateTest(BITSELECT,131)@7
    twoToMiSiYip_uid132_vecTranslateTest_b <= STD_LOGIC_VECTOR(redist35_yip1_6_uid125_vecTranslateTest_b_1_q(27 downto 5));

    -- xip1E_7NA_uid136_vecTranslateTest(BITJOIN,135)@7
    xip1E_7NA_uid136_vecTranslateTest_q <= redist36_xip1_6_uid124_vecTranslateTest_b_1_q & GND_q;

    -- xip1E_7sumAHighB_uid137_vecTranslateTest(ADDSUB,136)@7
    xip1E_7sumAHighB_uid137_vecTranslateTest_s <= invSignOfSelectionSignal_uid134_vecTranslateTest_q;
    xip1E_7sumAHighB_uid137_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & xip1E_7NA_uid136_vecTranslateTest_q));
    xip1E_7sumAHighB_uid137_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 23 => twoToMiSiYip_uid132_vecTranslateTest_b(22)) & twoToMiSiYip_uid132_vecTranslateTest_b));
    xip1E_7sumAHighB_uid137_vecTranslateTest_combproc: PROCESS (xip1E_7sumAHighB_uid137_vecTranslateTest_a, xip1E_7sumAHighB_uid137_vecTranslateTest_b, xip1E_7sumAHighB_uid137_vecTranslateTest_s)
    BEGIN
        IF (xip1E_7sumAHighB_uid137_vecTranslateTest_s = "1") THEN
            xip1E_7sumAHighB_uid137_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_7sumAHighB_uid137_vecTranslateTest_a) + SIGNED(xip1E_7sumAHighB_uid137_vecTranslateTest_b));
        ELSE
            xip1E_7sumAHighB_uid137_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_7sumAHighB_uid137_vecTranslateTest_a) - SIGNED(xip1E_7sumAHighB_uid137_vecTranslateTest_b));
        END IF;
    END PROCESS;
    xip1E_7sumAHighB_uid137_vecTranslateTest_q <= xip1E_7sumAHighB_uid137_vecTranslateTest_o(34 downto 0);

    -- xip1_7_uid145_vecTranslateTest(BITSELECT,144)@7
    xip1_7_uid145_vecTranslateTest_in <= xip1E_7sumAHighB_uid137_vecTranslateTest_q(32 downto 0);
    xip1_7_uid145_vecTranslateTest_b <= xip1_7_uid145_vecTranslateTest_in(32 downto 0);

    -- redist33_xip1_7_uid145_vecTranslateTest_b_1(DELAY,435)
    redist33_xip1_7_uid145_vecTranslateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_7_uid145_vecTranslateTest_b, xout => redist33_xip1_7_uid145_vecTranslateTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- xip1E_8_uid156_vecTranslateTest(ADDSUB,155)@8
    xip1E_8_uid156_vecTranslateTest_s <= invSignOfSelectionSignal_uid155_vecTranslateTest_q;
    xip1E_8_uid156_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & redist33_xip1_7_uid145_vecTranslateTest_b_1_q));
    xip1E_8_uid156_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 21 => twoToMiSiYip_uid153_vecTranslateTest_b(20)) & twoToMiSiYip_uid153_vecTranslateTest_b));
    xip1E_8_uid156_vecTranslateTest_combproc: PROCESS (xip1E_8_uid156_vecTranslateTest_a, xip1E_8_uid156_vecTranslateTest_b, xip1E_8_uid156_vecTranslateTest_s)
    BEGIN
        IF (xip1E_8_uid156_vecTranslateTest_s = "1") THEN
            xip1E_8_uid156_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_8_uid156_vecTranslateTest_a) + SIGNED(xip1E_8_uid156_vecTranslateTest_b));
        ELSE
            xip1E_8_uid156_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_8_uid156_vecTranslateTest_a) - SIGNED(xip1E_8_uid156_vecTranslateTest_b));
        END IF;
    END PROCESS;
    xip1E_8_uid156_vecTranslateTest_q <= xip1E_8_uid156_vecTranslateTest_o(34 downto 0);

    -- xip1_8_uid162_vecTranslateTest(BITSELECT,161)@8
    xip1_8_uid162_vecTranslateTest_in <= xip1E_8_uid156_vecTranslateTest_q(32 downto 0);
    xip1_8_uid162_vecTranslateTest_b <= xip1_8_uid162_vecTranslateTest_in(32 downto 0);

    -- redist30_xip1_8_uid162_vecTranslateTest_b_1(DELAY,432)
    redist30_xip1_8_uid162_vecTranslateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_8_uid162_vecTranslateTest_b, xout => redist30_xip1_8_uid162_vecTranslateTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- twoToMiSiXip_uid169_vecTranslateTest(BITSELECT,168)@9
    twoToMiSiXip_uid169_vecTranslateTest_b <= redist30_xip1_8_uid162_vecTranslateTest_b_1_q(32 downto 8);

    -- twoToMiSiXip_uid152_vecTranslateTest(BITSELECT,151)@8
    twoToMiSiXip_uid152_vecTranslateTest_b <= redist33_xip1_7_uid145_vecTranslateTest_b_1_q(32 downto 7);

    -- yip1E_8_uid157_vecTranslateTest(ADDSUB,156)@8
    yip1E_8_uid157_vecTranslateTest_s <= xMSB_uid148_vecTranslateTest_b;
    yip1E_8_uid157_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 28 => redist32_yip1_7_uid146_vecTranslateTest_b_1_q(27)) & redist32_yip1_7_uid146_vecTranslateTest_b_1_q));
    yip1E_8_uid157_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000" & twoToMiSiXip_uid152_vecTranslateTest_b));
    yip1E_8_uid157_vecTranslateTest_combproc: PROCESS (yip1E_8_uid157_vecTranslateTest_a, yip1E_8_uid157_vecTranslateTest_b, yip1E_8_uid157_vecTranslateTest_s)
    BEGIN
        IF (yip1E_8_uid157_vecTranslateTest_s = "1") THEN
            yip1E_8_uid157_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_8_uid157_vecTranslateTest_a) + SIGNED(yip1E_8_uid157_vecTranslateTest_b));
        ELSE
            yip1E_8_uid157_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_8_uid157_vecTranslateTest_a) - SIGNED(yip1E_8_uid157_vecTranslateTest_b));
        END IF;
    END PROCESS;
    yip1E_8_uid157_vecTranslateTest_q <= yip1E_8_uid157_vecTranslateTest_o(28 downto 0);

    -- yip1_8_uid163_vecTranslateTest(BITSELECT,162)@8
    yip1_8_uid163_vecTranslateTest_in <= STD_LOGIC_VECTOR(yip1E_8_uid157_vecTranslateTest_q(26 downto 0));
    yip1_8_uid163_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1_8_uid163_vecTranslateTest_in(26 downto 0));

    -- redist29_yip1_8_uid163_vecTranslateTest_b_1(DELAY,431)
    redist29_yip1_8_uid163_vecTranslateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 27, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_8_uid163_vecTranslateTest_b, xout => redist29_yip1_8_uid163_vecTranslateTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- yip1E_9_uid174_vecTranslateTest(ADDSUB,173)@9
    yip1E_9_uid174_vecTranslateTest_s <= xMSB_uid165_vecTranslateTest_b;
    yip1E_9_uid174_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 27 => redist29_yip1_8_uid163_vecTranslateTest_b_1_q(26)) & redist29_yip1_8_uid163_vecTranslateTest_b_1_q));
    yip1E_9_uid174_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000" & twoToMiSiXip_uid169_vecTranslateTest_b));
    yip1E_9_uid174_vecTranslateTest_combproc: PROCESS (yip1E_9_uid174_vecTranslateTest_a, yip1E_9_uid174_vecTranslateTest_b, yip1E_9_uid174_vecTranslateTest_s)
    BEGIN
        IF (yip1E_9_uid174_vecTranslateTest_s = "1") THEN
            yip1E_9_uid174_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_9_uid174_vecTranslateTest_a) + SIGNED(yip1E_9_uid174_vecTranslateTest_b));
        ELSE
            yip1E_9_uid174_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_9_uid174_vecTranslateTest_a) - SIGNED(yip1E_9_uid174_vecTranslateTest_b));
        END IF;
    END PROCESS;
    yip1E_9_uid174_vecTranslateTest_q <= yip1E_9_uid174_vecTranslateTest_o(27 downto 0);

    -- yip1_9_uid180_vecTranslateTest(BITSELECT,179)@9
    yip1_9_uid180_vecTranslateTest_in <= STD_LOGIC_VECTOR(yip1E_9_uid174_vecTranslateTest_q(25 downto 0));
    yip1_9_uid180_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1_9_uid180_vecTranslateTest_in(25 downto 0));

    -- redist26_yip1_9_uid180_vecTranslateTest_b_1(DELAY,428)
    redist26_yip1_9_uid180_vecTranslateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 26, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_9_uid180_vecTranslateTest_b, xout => redist26_yip1_9_uid180_vecTranslateTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- xMSB_uid182_vecTranslateTest(BITSELECT,181)@10
    xMSB_uid182_vecTranslateTest_b <= STD_LOGIC_VECTOR(redist26_yip1_9_uid180_vecTranslateTest_b_1_q(25 downto 25));

    -- invSignOfSelectionSignal_uid189_vecTranslateTest(LOGICAL,188)@10
    invSignOfSelectionSignal_uid189_vecTranslateTest_q <= not (xMSB_uid182_vecTranslateTest_b);

    -- twoToMiSiYip_uid187_vecTranslateTest(BITSELECT,186)@10
    twoToMiSiYip_uid187_vecTranslateTest_b <= STD_LOGIC_VECTOR(redist26_yip1_9_uid180_vecTranslateTest_b_1_q(25 downto 9));

    -- invSignOfSelectionSignal_uid172_vecTranslateTest(LOGICAL,171)@9
    invSignOfSelectionSignal_uid172_vecTranslateTest_q <= not (xMSB_uid165_vecTranslateTest_b);

    -- twoToMiSiYip_uid170_vecTranslateTest(BITSELECT,169)@9
    twoToMiSiYip_uid170_vecTranslateTest_b <= STD_LOGIC_VECTOR(redist29_yip1_8_uid163_vecTranslateTest_b_1_q(26 downto 8));

    -- xip1E_9_uid173_vecTranslateTest(ADDSUB,172)@9
    xip1E_9_uid173_vecTranslateTest_s <= invSignOfSelectionSignal_uid172_vecTranslateTest_q;
    xip1E_9_uid173_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & redist30_xip1_8_uid162_vecTranslateTest_b_1_q));
    xip1E_9_uid173_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 19 => twoToMiSiYip_uid170_vecTranslateTest_b(18)) & twoToMiSiYip_uid170_vecTranslateTest_b));
    xip1E_9_uid173_vecTranslateTest_combproc: PROCESS (xip1E_9_uid173_vecTranslateTest_a, xip1E_9_uid173_vecTranslateTest_b, xip1E_9_uid173_vecTranslateTest_s)
    BEGIN
        IF (xip1E_9_uid173_vecTranslateTest_s = "1") THEN
            xip1E_9_uid173_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_9_uid173_vecTranslateTest_a) + SIGNED(xip1E_9_uid173_vecTranslateTest_b));
        ELSE
            xip1E_9_uid173_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_9_uid173_vecTranslateTest_a) - SIGNED(xip1E_9_uid173_vecTranslateTest_b));
        END IF;
    END PROCESS;
    xip1E_9_uid173_vecTranslateTest_q <= xip1E_9_uid173_vecTranslateTest_o(34 downto 0);

    -- xip1_9_uid179_vecTranslateTest(BITSELECT,178)@9
    xip1_9_uid179_vecTranslateTest_in <= xip1E_9_uid173_vecTranslateTest_q(32 downto 0);
    xip1_9_uid179_vecTranslateTest_b <= xip1_9_uid179_vecTranslateTest_in(32 downto 0);

    -- redist27_xip1_9_uid179_vecTranslateTest_b_1(DELAY,429)
    redist27_xip1_9_uid179_vecTranslateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_9_uid179_vecTranslateTest_b, xout => redist27_xip1_9_uid179_vecTranslateTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- xip1E_10_uid190_vecTranslateTest(ADDSUB,189)@10
    xip1E_10_uid190_vecTranslateTest_s <= invSignOfSelectionSignal_uid189_vecTranslateTest_q;
    xip1E_10_uid190_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & redist27_xip1_9_uid179_vecTranslateTest_b_1_q));
    xip1E_10_uid190_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 17 => twoToMiSiYip_uid187_vecTranslateTest_b(16)) & twoToMiSiYip_uid187_vecTranslateTest_b));
    xip1E_10_uid190_vecTranslateTest_combproc: PROCESS (xip1E_10_uid190_vecTranslateTest_a, xip1E_10_uid190_vecTranslateTest_b, xip1E_10_uid190_vecTranslateTest_s)
    BEGIN
        IF (xip1E_10_uid190_vecTranslateTest_s = "1") THEN
            xip1E_10_uid190_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_10_uid190_vecTranslateTest_a) + SIGNED(xip1E_10_uid190_vecTranslateTest_b));
        ELSE
            xip1E_10_uid190_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_10_uid190_vecTranslateTest_a) - SIGNED(xip1E_10_uid190_vecTranslateTest_b));
        END IF;
    END PROCESS;
    xip1E_10_uid190_vecTranslateTest_q <= xip1E_10_uid190_vecTranslateTest_o(34 downto 0);

    -- xip1_10_uid196_vecTranslateTest(BITSELECT,195)@10
    xip1_10_uid196_vecTranslateTest_in <= xip1E_10_uid190_vecTranslateTest_q(32 downto 0);
    xip1_10_uid196_vecTranslateTest_b <= xip1_10_uid196_vecTranslateTest_in(32 downto 0);

    -- redist24_xip1_10_uid196_vecTranslateTest_b_1(DELAY,426)
    redist24_xip1_10_uid196_vecTranslateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_10_uid196_vecTranslateTest_b, xout => redist24_xip1_10_uid196_vecTranslateTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- twoToMiSiXip_uid203_vecTranslateTest(BITSELECT,202)@11
    twoToMiSiXip_uid203_vecTranslateTest_b <= redist24_xip1_10_uid196_vecTranslateTest_b_1_q(32 downto 10);

    -- twoToMiSiXip_uid186_vecTranslateTest(BITSELECT,185)@10
    twoToMiSiXip_uid186_vecTranslateTest_b <= redist27_xip1_9_uid179_vecTranslateTest_b_1_q(32 downto 9);

    -- yip1E_10_uid191_vecTranslateTest(ADDSUB,190)@10
    yip1E_10_uid191_vecTranslateTest_s <= xMSB_uid182_vecTranslateTest_b;
    yip1E_10_uid191_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 26 => redist26_yip1_9_uid180_vecTranslateTest_b_1_q(25)) & redist26_yip1_9_uid180_vecTranslateTest_b_1_q));
    yip1E_10_uid191_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000" & twoToMiSiXip_uid186_vecTranslateTest_b));
    yip1E_10_uid191_vecTranslateTest_combproc: PROCESS (yip1E_10_uid191_vecTranslateTest_a, yip1E_10_uid191_vecTranslateTest_b, yip1E_10_uid191_vecTranslateTest_s)
    BEGIN
        IF (yip1E_10_uid191_vecTranslateTest_s = "1") THEN
            yip1E_10_uid191_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_10_uid191_vecTranslateTest_a) + SIGNED(yip1E_10_uid191_vecTranslateTest_b));
        ELSE
            yip1E_10_uid191_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_10_uid191_vecTranslateTest_a) - SIGNED(yip1E_10_uid191_vecTranslateTest_b));
        END IF;
    END PROCESS;
    yip1E_10_uid191_vecTranslateTest_q <= yip1E_10_uid191_vecTranslateTest_o(26 downto 0);

    -- yip1_10_uid197_vecTranslateTest(BITSELECT,196)@10
    yip1_10_uid197_vecTranslateTest_in <= STD_LOGIC_VECTOR(yip1E_10_uid191_vecTranslateTest_q(24 downto 0));
    yip1_10_uid197_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1_10_uid197_vecTranslateTest_in(24 downto 0));

    -- redist23_yip1_10_uid197_vecTranslateTest_b_1(DELAY,425)
    redist23_yip1_10_uid197_vecTranslateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 25, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_10_uid197_vecTranslateTest_b, xout => redist23_yip1_10_uid197_vecTranslateTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- yip1E_11_uid208_vecTranslateTest(ADDSUB,207)@11
    yip1E_11_uid208_vecTranslateTest_s <= xMSB_uid199_vecTranslateTest_b;
    yip1E_11_uid208_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 25 => redist23_yip1_10_uid197_vecTranslateTest_b_1_q(24)) & redist23_yip1_10_uid197_vecTranslateTest_b_1_q));
    yip1E_11_uid208_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000" & twoToMiSiXip_uid203_vecTranslateTest_b));
    yip1E_11_uid208_vecTranslateTest_combproc: PROCESS (yip1E_11_uid208_vecTranslateTest_a, yip1E_11_uid208_vecTranslateTest_b, yip1E_11_uid208_vecTranslateTest_s)
    BEGIN
        IF (yip1E_11_uid208_vecTranslateTest_s = "1") THEN
            yip1E_11_uid208_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_11_uid208_vecTranslateTest_a) + SIGNED(yip1E_11_uid208_vecTranslateTest_b));
        ELSE
            yip1E_11_uid208_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_11_uid208_vecTranslateTest_a) - SIGNED(yip1E_11_uid208_vecTranslateTest_b));
        END IF;
    END PROCESS;
    yip1E_11_uid208_vecTranslateTest_q <= yip1E_11_uid208_vecTranslateTest_o(25 downto 0);

    -- yip1_11_uid214_vecTranslateTest(BITSELECT,213)@11
    yip1_11_uid214_vecTranslateTest_in <= STD_LOGIC_VECTOR(yip1E_11_uid208_vecTranslateTest_q(23 downto 0));
    yip1_11_uid214_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1_11_uid214_vecTranslateTest_in(23 downto 0));

    -- redist20_yip1_11_uid214_vecTranslateTest_b_1(DELAY,422)
    redist20_yip1_11_uid214_vecTranslateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_11_uid214_vecTranslateTest_b, xout => redist20_yip1_11_uid214_vecTranslateTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- xMSB_uid216_vecTranslateTest(BITSELECT,215)@12
    xMSB_uid216_vecTranslateTest_b <= STD_LOGIC_VECTOR(redist20_yip1_11_uid214_vecTranslateTest_b_1_q(23 downto 23));

    -- invSignOfSelectionSignal_uid223_vecTranslateTest(LOGICAL,222)@12
    invSignOfSelectionSignal_uid223_vecTranslateTest_q <= not (xMSB_uid216_vecTranslateTest_b);

    -- twoToMiSiYip_uid221_vecTranslateTest(BITSELECT,220)@12
    twoToMiSiYip_uid221_vecTranslateTest_b <= STD_LOGIC_VECTOR(redist20_yip1_11_uid214_vecTranslateTest_b_1_q(23 downto 11));

    -- invSignOfSelectionSignal_uid206_vecTranslateTest(LOGICAL,205)@11
    invSignOfSelectionSignal_uid206_vecTranslateTest_q <= not (xMSB_uid199_vecTranslateTest_b);

    -- twoToMiSiYip_uid204_vecTranslateTest(BITSELECT,203)@11
    twoToMiSiYip_uid204_vecTranslateTest_b <= STD_LOGIC_VECTOR(redist23_yip1_10_uid197_vecTranslateTest_b_1_q(24 downto 10));

    -- xip1E_11_uid207_vecTranslateTest(ADDSUB,206)@11
    xip1E_11_uid207_vecTranslateTest_s <= invSignOfSelectionSignal_uid206_vecTranslateTest_q;
    xip1E_11_uid207_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & redist24_xip1_10_uid196_vecTranslateTest_b_1_q));
    xip1E_11_uid207_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 15 => twoToMiSiYip_uid204_vecTranslateTest_b(14)) & twoToMiSiYip_uid204_vecTranslateTest_b));
    xip1E_11_uid207_vecTranslateTest_combproc: PROCESS (xip1E_11_uid207_vecTranslateTest_a, xip1E_11_uid207_vecTranslateTest_b, xip1E_11_uid207_vecTranslateTest_s)
    BEGIN
        IF (xip1E_11_uid207_vecTranslateTest_s = "1") THEN
            xip1E_11_uid207_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_11_uid207_vecTranslateTest_a) + SIGNED(xip1E_11_uid207_vecTranslateTest_b));
        ELSE
            xip1E_11_uid207_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_11_uid207_vecTranslateTest_a) - SIGNED(xip1E_11_uid207_vecTranslateTest_b));
        END IF;
    END PROCESS;
    xip1E_11_uid207_vecTranslateTest_q <= xip1E_11_uid207_vecTranslateTest_o(34 downto 0);

    -- xip1_11_uid213_vecTranslateTest(BITSELECT,212)@11
    xip1_11_uid213_vecTranslateTest_in <= xip1E_11_uid207_vecTranslateTest_q(32 downto 0);
    xip1_11_uid213_vecTranslateTest_b <= xip1_11_uid213_vecTranslateTest_in(32 downto 0);

    -- redist21_xip1_11_uid213_vecTranslateTest_b_1(DELAY,423)
    redist21_xip1_11_uid213_vecTranslateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_11_uid213_vecTranslateTest_b, xout => redist21_xip1_11_uid213_vecTranslateTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- xip1E_12_uid224_vecTranslateTest(ADDSUB,223)@12
    xip1E_12_uid224_vecTranslateTest_s <= invSignOfSelectionSignal_uid223_vecTranslateTest_q;
    xip1E_12_uid224_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & redist21_xip1_11_uid213_vecTranslateTest_b_1_q));
    xip1E_12_uid224_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 13 => twoToMiSiYip_uid221_vecTranslateTest_b(12)) & twoToMiSiYip_uid221_vecTranslateTest_b));
    xip1E_12_uid224_vecTranslateTest_combproc: PROCESS (xip1E_12_uid224_vecTranslateTest_a, xip1E_12_uid224_vecTranslateTest_b, xip1E_12_uid224_vecTranslateTest_s)
    BEGIN
        IF (xip1E_12_uid224_vecTranslateTest_s = "1") THEN
            xip1E_12_uid224_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_12_uid224_vecTranslateTest_a) + SIGNED(xip1E_12_uid224_vecTranslateTest_b));
        ELSE
            xip1E_12_uid224_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_12_uid224_vecTranslateTest_a) - SIGNED(xip1E_12_uid224_vecTranslateTest_b));
        END IF;
    END PROCESS;
    xip1E_12_uid224_vecTranslateTest_q <= xip1E_12_uid224_vecTranslateTest_o(34 downto 0);

    -- xip1_12_uid230_vecTranslateTest(BITSELECT,229)@12
    xip1_12_uid230_vecTranslateTest_in <= xip1E_12_uid224_vecTranslateTest_q(32 downto 0);
    xip1_12_uid230_vecTranslateTest_b <= xip1_12_uid230_vecTranslateTest_in(32 downto 0);

    -- redist18_xip1_12_uid230_vecTranslateTest_b_1(DELAY,420)
    redist18_xip1_12_uid230_vecTranslateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_12_uid230_vecTranslateTest_b, xout => redist18_xip1_12_uid230_vecTranslateTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- twoToMiSiXip_uid237_vecTranslateTest(BITSELECT,236)@13
    twoToMiSiXip_uid237_vecTranslateTest_b <= redist18_xip1_12_uid230_vecTranslateTest_b_1_q(32 downto 12);

    -- twoToMiSiXip_uid220_vecTranslateTest(BITSELECT,219)@12
    twoToMiSiXip_uid220_vecTranslateTest_b <= redist21_xip1_11_uid213_vecTranslateTest_b_1_q(32 downto 11);

    -- yip1E_12_uid225_vecTranslateTest(ADDSUB,224)@12
    yip1E_12_uid225_vecTranslateTest_s <= xMSB_uid216_vecTranslateTest_b;
    yip1E_12_uid225_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 24 => redist20_yip1_11_uid214_vecTranslateTest_b_1_q(23)) & redist20_yip1_11_uid214_vecTranslateTest_b_1_q));
    yip1E_12_uid225_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000" & twoToMiSiXip_uid220_vecTranslateTest_b));
    yip1E_12_uid225_vecTranslateTest_combproc: PROCESS (yip1E_12_uid225_vecTranslateTest_a, yip1E_12_uid225_vecTranslateTest_b, yip1E_12_uid225_vecTranslateTest_s)
    BEGIN
        IF (yip1E_12_uid225_vecTranslateTest_s = "1") THEN
            yip1E_12_uid225_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_12_uid225_vecTranslateTest_a) + SIGNED(yip1E_12_uid225_vecTranslateTest_b));
        ELSE
            yip1E_12_uid225_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_12_uid225_vecTranslateTest_a) - SIGNED(yip1E_12_uid225_vecTranslateTest_b));
        END IF;
    END PROCESS;
    yip1E_12_uid225_vecTranslateTest_q <= yip1E_12_uid225_vecTranslateTest_o(24 downto 0);

    -- yip1_12_uid231_vecTranslateTest(BITSELECT,230)@12
    yip1_12_uid231_vecTranslateTest_in <= STD_LOGIC_VECTOR(yip1E_12_uid225_vecTranslateTest_q(22 downto 0));
    yip1_12_uid231_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1_12_uid231_vecTranslateTest_in(22 downto 0));

    -- redist17_yip1_12_uid231_vecTranslateTest_b_1(DELAY,419)
    redist17_yip1_12_uid231_vecTranslateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_12_uid231_vecTranslateTest_b, xout => redist17_yip1_12_uid231_vecTranslateTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- yip1E_13_uid242_vecTranslateTest(ADDSUB,241)@13
    yip1E_13_uid242_vecTranslateTest_s <= xMSB_uid233_vecTranslateTest_b;
    yip1E_13_uid242_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => redist17_yip1_12_uid231_vecTranslateTest_b_1_q(22)) & redist17_yip1_12_uid231_vecTranslateTest_b_1_q));
    yip1E_13_uid242_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000" & twoToMiSiXip_uid237_vecTranslateTest_b));
    yip1E_13_uid242_vecTranslateTest_combproc: PROCESS (yip1E_13_uid242_vecTranslateTest_a, yip1E_13_uid242_vecTranslateTest_b, yip1E_13_uid242_vecTranslateTest_s)
    BEGIN
        IF (yip1E_13_uid242_vecTranslateTest_s = "1") THEN
            yip1E_13_uid242_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_13_uid242_vecTranslateTest_a) + SIGNED(yip1E_13_uid242_vecTranslateTest_b));
        ELSE
            yip1E_13_uid242_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_13_uid242_vecTranslateTest_a) - SIGNED(yip1E_13_uid242_vecTranslateTest_b));
        END IF;
    END PROCESS;
    yip1E_13_uid242_vecTranslateTest_q <= yip1E_13_uid242_vecTranslateTest_o(23 downto 0);

    -- yip1_13_uid248_vecTranslateTest(BITSELECT,247)@13
    yip1_13_uid248_vecTranslateTest_in <= STD_LOGIC_VECTOR(yip1E_13_uid242_vecTranslateTest_q(21 downto 0));
    yip1_13_uid248_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1_13_uid248_vecTranslateTest_in(21 downto 0));

    -- redist14_yip1_13_uid248_vecTranslateTest_b_1(DELAY,416)
    redist14_yip1_13_uid248_vecTranslateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 22, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_13_uid248_vecTranslateTest_b, xout => redist14_yip1_13_uid248_vecTranslateTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- xMSB_uid250_vecTranslateTest(BITSELECT,249)@14
    xMSB_uid250_vecTranslateTest_b <= STD_LOGIC_VECTOR(redist14_yip1_13_uid248_vecTranslateTest_b_1_q(21 downto 21));

    -- invSignOfSelectionSignal_uid257_vecTranslateTest(LOGICAL,256)@14
    invSignOfSelectionSignal_uid257_vecTranslateTest_q <= not (xMSB_uid250_vecTranslateTest_b);

    -- twoToMiSiYip_uid255_vecTranslateTest(BITSELECT,254)@14
    twoToMiSiYip_uid255_vecTranslateTest_b <= STD_LOGIC_VECTOR(redist14_yip1_13_uid248_vecTranslateTest_b_1_q(21 downto 13));

    -- invSignOfSelectionSignal_uid240_vecTranslateTest(LOGICAL,239)@13
    invSignOfSelectionSignal_uid240_vecTranslateTest_q <= not (xMSB_uid233_vecTranslateTest_b);

    -- twoToMiSiYip_uid238_vecTranslateTest(BITSELECT,237)@13
    twoToMiSiYip_uid238_vecTranslateTest_b <= STD_LOGIC_VECTOR(redist17_yip1_12_uid231_vecTranslateTest_b_1_q(22 downto 12));

    -- xip1E_13_uid241_vecTranslateTest(ADDSUB,240)@13
    xip1E_13_uid241_vecTranslateTest_s <= invSignOfSelectionSignal_uid240_vecTranslateTest_q;
    xip1E_13_uid241_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & redist18_xip1_12_uid230_vecTranslateTest_b_1_q));
    xip1E_13_uid241_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 11 => twoToMiSiYip_uid238_vecTranslateTest_b(10)) & twoToMiSiYip_uid238_vecTranslateTest_b));
    xip1E_13_uid241_vecTranslateTest_combproc: PROCESS (xip1E_13_uid241_vecTranslateTest_a, xip1E_13_uid241_vecTranslateTest_b, xip1E_13_uid241_vecTranslateTest_s)
    BEGIN
        IF (xip1E_13_uid241_vecTranslateTest_s = "1") THEN
            xip1E_13_uid241_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_13_uid241_vecTranslateTest_a) + SIGNED(xip1E_13_uid241_vecTranslateTest_b));
        ELSE
            xip1E_13_uid241_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_13_uid241_vecTranslateTest_a) - SIGNED(xip1E_13_uid241_vecTranslateTest_b));
        END IF;
    END PROCESS;
    xip1E_13_uid241_vecTranslateTest_q <= xip1E_13_uid241_vecTranslateTest_o(34 downto 0);

    -- xip1_13_uid247_vecTranslateTest(BITSELECT,246)@13
    xip1_13_uid247_vecTranslateTest_in <= xip1E_13_uid241_vecTranslateTest_q(32 downto 0);
    xip1_13_uid247_vecTranslateTest_b <= xip1_13_uid247_vecTranslateTest_in(32 downto 0);

    -- redist15_xip1_13_uid247_vecTranslateTest_b_1(DELAY,417)
    redist15_xip1_13_uid247_vecTranslateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_13_uid247_vecTranslateTest_b, xout => redist15_xip1_13_uid247_vecTranslateTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- xip1E_14_uid258_vecTranslateTest(ADDSUB,257)@14
    xip1E_14_uid258_vecTranslateTest_s <= invSignOfSelectionSignal_uid257_vecTranslateTest_q;
    xip1E_14_uid258_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & redist15_xip1_13_uid247_vecTranslateTest_b_1_q));
    xip1E_14_uid258_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 9 => twoToMiSiYip_uid255_vecTranslateTest_b(8)) & twoToMiSiYip_uid255_vecTranslateTest_b));
    xip1E_14_uid258_vecTranslateTest_combproc: PROCESS (xip1E_14_uid258_vecTranslateTest_a, xip1E_14_uid258_vecTranslateTest_b, xip1E_14_uid258_vecTranslateTest_s)
    BEGIN
        IF (xip1E_14_uid258_vecTranslateTest_s = "1") THEN
            xip1E_14_uid258_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_14_uid258_vecTranslateTest_a) + SIGNED(xip1E_14_uid258_vecTranslateTest_b));
        ELSE
            xip1E_14_uid258_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_14_uid258_vecTranslateTest_a) - SIGNED(xip1E_14_uid258_vecTranslateTest_b));
        END IF;
    END PROCESS;
    xip1E_14_uid258_vecTranslateTest_q <= xip1E_14_uid258_vecTranslateTest_o(34 downto 0);

    -- xip1_14_uid264_vecTranslateTest(BITSELECT,263)@14
    xip1_14_uid264_vecTranslateTest_in <= xip1E_14_uid258_vecTranslateTest_q(32 downto 0);
    xip1_14_uid264_vecTranslateTest_b <= xip1_14_uid264_vecTranslateTest_in(32 downto 0);

    -- redist12_xip1_14_uid264_vecTranslateTest_b_1(DELAY,414)
    redist12_xip1_14_uid264_vecTranslateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_14_uid264_vecTranslateTest_b, xout => redist12_xip1_14_uid264_vecTranslateTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- twoToMiSiXip_uid271_vecTranslateTest(BITSELECT,270)@15
    twoToMiSiXip_uid271_vecTranslateTest_b <= redist12_xip1_14_uid264_vecTranslateTest_b_1_q(32 downto 14);

    -- twoToMiSiXip_uid254_vecTranslateTest(BITSELECT,253)@14
    twoToMiSiXip_uid254_vecTranslateTest_b <= redist15_xip1_13_uid247_vecTranslateTest_b_1_q(32 downto 13);

    -- yip1E_14_uid259_vecTranslateTest(ADDSUB,258)@14
    yip1E_14_uid259_vecTranslateTest_s <= xMSB_uid250_vecTranslateTest_b;
    yip1E_14_uid259_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 22 => redist14_yip1_13_uid248_vecTranslateTest_b_1_q(21)) & redist14_yip1_13_uid248_vecTranslateTest_b_1_q));
    yip1E_14_uid259_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000" & twoToMiSiXip_uid254_vecTranslateTest_b));
    yip1E_14_uid259_vecTranslateTest_combproc: PROCESS (yip1E_14_uid259_vecTranslateTest_a, yip1E_14_uid259_vecTranslateTest_b, yip1E_14_uid259_vecTranslateTest_s)
    BEGIN
        IF (yip1E_14_uid259_vecTranslateTest_s = "1") THEN
            yip1E_14_uid259_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_14_uid259_vecTranslateTest_a) + SIGNED(yip1E_14_uid259_vecTranslateTest_b));
        ELSE
            yip1E_14_uid259_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_14_uid259_vecTranslateTest_a) - SIGNED(yip1E_14_uid259_vecTranslateTest_b));
        END IF;
    END PROCESS;
    yip1E_14_uid259_vecTranslateTest_q <= yip1E_14_uid259_vecTranslateTest_o(22 downto 0);

    -- yip1_14_uid265_vecTranslateTest(BITSELECT,264)@14
    yip1_14_uid265_vecTranslateTest_in <= STD_LOGIC_VECTOR(yip1E_14_uid259_vecTranslateTest_q(20 downto 0));
    yip1_14_uid265_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1_14_uid265_vecTranslateTest_in(20 downto 0));

    -- redist11_yip1_14_uid265_vecTranslateTest_b_1(DELAY,413)
    redist11_yip1_14_uid265_vecTranslateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 21, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_14_uid265_vecTranslateTest_b, xout => redist11_yip1_14_uid265_vecTranslateTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- yip1E_15_uid276_vecTranslateTest(ADDSUB,275)@15
    yip1E_15_uid276_vecTranslateTest_s <= xMSB_uid267_vecTranslateTest_b;
    yip1E_15_uid276_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 21 => redist11_yip1_14_uid265_vecTranslateTest_b_1_q(20)) & redist11_yip1_14_uid265_vecTranslateTest_b_1_q));
    yip1E_15_uid276_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000" & twoToMiSiXip_uid271_vecTranslateTest_b));
    yip1E_15_uid276_vecTranslateTest_combproc: PROCESS (yip1E_15_uid276_vecTranslateTest_a, yip1E_15_uid276_vecTranslateTest_b, yip1E_15_uid276_vecTranslateTest_s)
    BEGIN
        IF (yip1E_15_uid276_vecTranslateTest_s = "1") THEN
            yip1E_15_uid276_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_15_uid276_vecTranslateTest_a) + SIGNED(yip1E_15_uid276_vecTranslateTest_b));
        ELSE
            yip1E_15_uid276_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_15_uid276_vecTranslateTest_a) - SIGNED(yip1E_15_uid276_vecTranslateTest_b));
        END IF;
    END PROCESS;
    yip1E_15_uid276_vecTranslateTest_q <= yip1E_15_uid276_vecTranslateTest_o(21 downto 0);

    -- yip1_15_uid282_vecTranslateTest(BITSELECT,281)@15
    yip1_15_uid282_vecTranslateTest_in <= STD_LOGIC_VECTOR(yip1E_15_uid276_vecTranslateTest_q(19 downto 0));
    yip1_15_uid282_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1_15_uid282_vecTranslateTest_in(19 downto 0));

    -- xMSB_uid284_vecTranslateTest(BITSELECT,283)@15
    xMSB_uid284_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1_15_uid282_vecTranslateTest_b(19 downto 19));

    -- redist8_xMSB_uid284_vecTranslateTest_b_1(DELAY,410)
    redist8_xMSB_uid284_vecTranslateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid284_vecTranslateTest_b, xout => redist8_xMSB_uid284_vecTranslateTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- invSignOfSelectionSignal_uid291_vecTranslateTest(LOGICAL,290)@16
    invSignOfSelectionSignal_uid291_vecTranslateTest_q <= not (redist8_xMSB_uid284_vecTranslateTest_b_1_q);

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- twoToMiSiYip_uid289_vecTranslateTest(BITSELECT,288)@15
    twoToMiSiYip_uid289_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1_15_uid282_vecTranslateTest_b(19 downto 15));

    -- redist7_twoToMiSiYip_uid289_vecTranslateTest_b_1(DELAY,409)
    redist7_twoToMiSiYip_uid289_vecTranslateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 5, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => twoToMiSiYip_uid289_vecTranslateTest_b, xout => redist7_twoToMiSiYip_uid289_vecTranslateTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- invSignOfSelectionSignal_uid274_vecTranslateTest(LOGICAL,273)@15
    invSignOfSelectionSignal_uid274_vecTranslateTest_q <= not (xMSB_uid267_vecTranslateTest_b);

    -- twoToMiSiYip_uid272_vecTranslateTest(BITSELECT,271)@15
    twoToMiSiYip_uid272_vecTranslateTest_b <= STD_LOGIC_VECTOR(redist11_yip1_14_uid265_vecTranslateTest_b_1_q(20 downto 14));

    -- xip1E_15_uid275_vecTranslateTest(ADDSUB,274)@15
    xip1E_15_uid275_vecTranslateTest_s <= invSignOfSelectionSignal_uid274_vecTranslateTest_q;
    xip1E_15_uid275_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & redist12_xip1_14_uid264_vecTranslateTest_b_1_q));
    xip1E_15_uid275_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 7 => twoToMiSiYip_uid272_vecTranslateTest_b(6)) & twoToMiSiYip_uid272_vecTranslateTest_b));
    xip1E_15_uid275_vecTranslateTest_combproc: PROCESS (xip1E_15_uid275_vecTranslateTest_a, xip1E_15_uid275_vecTranslateTest_b, xip1E_15_uid275_vecTranslateTest_s)
    BEGIN
        IF (xip1E_15_uid275_vecTranslateTest_s = "1") THEN
            xip1E_15_uid275_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_15_uid275_vecTranslateTest_a) + SIGNED(xip1E_15_uid275_vecTranslateTest_b));
        ELSE
            xip1E_15_uid275_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_15_uid275_vecTranslateTest_a) - SIGNED(xip1E_15_uid275_vecTranslateTest_b));
        END IF;
    END PROCESS;
    xip1E_15_uid275_vecTranslateTest_q <= xip1E_15_uid275_vecTranslateTest_o(34 downto 0);

    -- xip1_15_uid281_vecTranslateTest(BITSELECT,280)@15
    xip1_15_uid281_vecTranslateTest_in <= xip1E_15_uid275_vecTranslateTest_q(32 downto 0);
    xip1_15_uid281_vecTranslateTest_b <= xip1_15_uid281_vecTranslateTest_in(32 downto 0);

    -- redist9_xip1_15_uid281_vecTranslateTest_b_1(DELAY,411)
    redist9_xip1_15_uid281_vecTranslateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_15_uid281_vecTranslateTest_b, xout => redist9_xip1_15_uid281_vecTranslateTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- xip1E_16_uid292_vecTranslateTest(ADDSUB,291)@16
    xip1E_16_uid292_vecTranslateTest_s <= invSignOfSelectionSignal_uid291_vecTranslateTest_q;
    xip1E_16_uid292_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & redist9_xip1_15_uid281_vecTranslateTest_b_1_q));
    xip1E_16_uid292_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 5 => redist7_twoToMiSiYip_uid289_vecTranslateTest_b_1_q(4)) & redist7_twoToMiSiYip_uid289_vecTranslateTest_b_1_q));
    xip1E_16_uid292_vecTranslateTest_combproc: PROCESS (xip1E_16_uid292_vecTranslateTest_a, xip1E_16_uid292_vecTranslateTest_b, xip1E_16_uid292_vecTranslateTest_s)
    BEGIN
        IF (xip1E_16_uid292_vecTranslateTest_s = "1") THEN
            xip1E_16_uid292_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_16_uid292_vecTranslateTest_a) + SIGNED(xip1E_16_uid292_vecTranslateTest_b));
        ELSE
            xip1E_16_uid292_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_16_uid292_vecTranslateTest_a) - SIGNED(xip1E_16_uid292_vecTranslateTest_b));
        END IF;
    END PROCESS;
    xip1E_16_uid292_vecTranslateTest_q <= xip1E_16_uid292_vecTranslateTest_o(34 downto 0);

    -- xip1_16_uid298_vecTranslateTest(BITSELECT,297)@16
    xip1_16_uid298_vecTranslateTest_in <= xip1E_16_uid292_vecTranslateTest_q(32 downto 0);
    xip1_16_uid298_vecTranslateTest_b <= xip1_16_uid298_vecTranslateTest_in(32 downto 0);

    -- outMagPreCstMult_uid338_vecTranslateTest(BITSELECT,337)@16
    outMagPreCstMult_uid338_vecTranslateTest_b <= xip1_16_uid298_vecTranslateTest_b(32 downto 15);

    -- redist4_outMagPreCstMult_uid338_vecTranslateTest_b_1(DELAY,406)
    redist4_outMagPreCstMult_uid338_vecTranslateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 18, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => outMagPreCstMult_uid338_vecTranslateTest_b, xout => redist4_outMagPreCstMult_uid338_vecTranslateTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- xv0_uid346_cstMultOutMag_uid339_vecTranslateTest_merged_bit_select(BITSELECT,400)@17
    xv0_uid346_cstMultOutMag_uid339_vecTranslateTest_merged_bit_select_b <= redist4_outMagPreCstMult_uid338_vecTranslateTest_b_1_q(5 downto 0);
    xv0_uid346_cstMultOutMag_uid339_vecTranslateTest_merged_bit_select_c <= redist4_outMagPreCstMult_uid338_vecTranslateTest_b_1_q(11 downto 6);
    xv0_uid346_cstMultOutMag_uid339_vecTranslateTest_merged_bit_select_d <= redist4_outMagPreCstMult_uid338_vecTranslateTest_b_1_q(17 downto 12);

    -- redist1_xv0_uid346_cstMultOutMag_uid339_vecTranslateTest_merged_bit_select_b_1(DELAY,403)
    redist1_xv0_uid346_cstMultOutMag_uid339_vecTranslateTest_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xv0_uid346_cstMultOutMag_uid339_vecTranslateTest_merged_bit_select_b, xout => redist1_xv0_uid346_cstMultOutMag_uid339_vecTranslateTest_merged_bit_select_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- p0_uid351_cstMultOutMag_uid339_vecTranslateTest(LOOKUP,350)@18 + 1
    p0_uid351_cstMultOutMag_uid339_vecTranslateTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0000000000000000000000000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE (redist1_xv0_uid346_cstMultOutMag_uid339_vecTranslateTest_merged_bit_select_b_1_q) IS
                    WHEN "000000" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0000000000000000000000000";
                    WHEN "000001" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0000001001101101110101000";
                    WHEN "000010" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0000010011011011101010000";
                    WHEN "000011" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0000011101001001011111000";
                    WHEN "000100" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0000100110110111010100000";
                    WHEN "000101" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0000110000100101001001000";
                    WHEN "000110" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0000111010010010111110000";
                    WHEN "000111" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0001000100000000110011000";
                    WHEN "001000" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0001001101101110101000000";
                    WHEN "001001" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0001010111011100011101000";
                    WHEN "001010" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0001100001001010010010000";
                    WHEN "001011" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0001101010111000000111000";
                    WHEN "001100" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0001110100100101111100000";
                    WHEN "001101" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0001111110010011110001000";
                    WHEN "001110" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0010001000000001100110000";
                    WHEN "001111" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0010010001101111011011000";
                    WHEN "010000" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0010011011011101010000000";
                    WHEN "010001" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0010100101001011000101000";
                    WHEN "010010" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0010101110111000111010000";
                    WHEN "010011" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0010111000100110101111000";
                    WHEN "010100" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0011000010010100100100000";
                    WHEN "010101" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0011001100000010011001000";
                    WHEN "010110" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0011010101110000001110000";
                    WHEN "010111" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0011011111011110000011000";
                    WHEN "011000" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0011101001001011111000000";
                    WHEN "011001" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0011110010111001101101000";
                    WHEN "011010" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0011111100100111100010000";
                    WHEN "011011" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0100000110010101010111000";
                    WHEN "011100" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0100010000000011001100000";
                    WHEN "011101" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0100011001110001000001000";
                    WHEN "011110" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0100100011011110110110000";
                    WHEN "011111" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0100101101001100101011000";
                    WHEN "100000" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0100110110111010100000000";
                    WHEN "100001" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0101000000101000010101000";
                    WHEN "100010" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0101001010010110001010000";
                    WHEN "100011" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0101010100000011111111000";
                    WHEN "100100" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0101011101110001110100000";
                    WHEN "100101" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0101100111011111101001000";
                    WHEN "100110" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0101110001001101011110000";
                    WHEN "100111" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0101111010111011010011000";
                    WHEN "101000" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0110000100101001001000000";
                    WHEN "101001" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0110001110010110111101000";
                    WHEN "101010" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0110011000000100110010000";
                    WHEN "101011" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0110100001110010100111000";
                    WHEN "101100" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0110101011100000011100000";
                    WHEN "101101" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0110110101001110010001000";
                    WHEN "101110" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0110111110111100000110000";
                    WHEN "101111" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0111001000101001111011000";
                    WHEN "110000" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0111010010010111110000000";
                    WHEN "110001" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0111011100000101100101000";
                    WHEN "110010" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0111100101110011011010000";
                    WHEN "110011" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0111101111100001001111000";
                    WHEN "110100" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "0111111001001111000100000";
                    WHEN "110101" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "1000000010111100111001000";
                    WHEN "110110" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "1000001100101010101110000";
                    WHEN "110111" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "1000010110011000100011000";
                    WHEN "111000" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "1000100000000110011000000";
                    WHEN "111001" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "1000101001110100001101000";
                    WHEN "111010" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "1000110011100010000010000";
                    WHEN "111011" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "1000111101001111110111000";
                    WHEN "111100" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "1001000110111101101100000";
                    WHEN "111101" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "1001010000101011100001000";
                    WHEN "111110" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "1001011010011001010110000";
                    WHEN "111111" => p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= "1001100100000111001011000";
                    WHEN OTHERS => -- unreachable
                                   p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q <= (others => '-');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- p1_uid350_cstMultOutMag_uid339_vecTranslateTest(LOOKUP,349)@17 + 1
    p1_uid350_cstMultOutMag_uid339_vecTranslateTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0000000000000000000000000000000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE (xv0_uid346_cstMultOutMag_uid339_vecTranslateTest_merged_bit_select_c) IS
                    WHEN "000000" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0000000000000000000000000000000";
                    WHEN "000001" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0000001001101101110101000000000";
                    WHEN "000010" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0000010011011011101010000000000";
                    WHEN "000011" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0000011101001001011111000000000";
                    WHEN "000100" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0000100110110111010100000000000";
                    WHEN "000101" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0000110000100101001001000000000";
                    WHEN "000110" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0000111010010010111110000000000";
                    WHEN "000111" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0001000100000000110011000000000";
                    WHEN "001000" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0001001101101110101000000000000";
                    WHEN "001001" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0001010111011100011101000000000";
                    WHEN "001010" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0001100001001010010010000000000";
                    WHEN "001011" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0001101010111000000111000000000";
                    WHEN "001100" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0001110100100101111100000000000";
                    WHEN "001101" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0001111110010011110001000000000";
                    WHEN "001110" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0010001000000001100110000000000";
                    WHEN "001111" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0010010001101111011011000000000";
                    WHEN "010000" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0010011011011101010000000000000";
                    WHEN "010001" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0010100101001011000101000000000";
                    WHEN "010010" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0010101110111000111010000000000";
                    WHEN "010011" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0010111000100110101111000000000";
                    WHEN "010100" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0011000010010100100100000000000";
                    WHEN "010101" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0011001100000010011001000000000";
                    WHEN "010110" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0011010101110000001110000000000";
                    WHEN "010111" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0011011111011110000011000000000";
                    WHEN "011000" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0011101001001011111000000000000";
                    WHEN "011001" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0011110010111001101101000000000";
                    WHEN "011010" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0011111100100111100010000000000";
                    WHEN "011011" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0100000110010101010111000000000";
                    WHEN "011100" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0100010000000011001100000000000";
                    WHEN "011101" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0100011001110001000001000000000";
                    WHEN "011110" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0100100011011110110110000000000";
                    WHEN "011111" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0100101101001100101011000000000";
                    WHEN "100000" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0100110110111010100000000000000";
                    WHEN "100001" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0101000000101000010101000000000";
                    WHEN "100010" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0101001010010110001010000000000";
                    WHEN "100011" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0101010100000011111111000000000";
                    WHEN "100100" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0101011101110001110100000000000";
                    WHEN "100101" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0101100111011111101001000000000";
                    WHEN "100110" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0101110001001101011110000000000";
                    WHEN "100111" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0101111010111011010011000000000";
                    WHEN "101000" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0110000100101001001000000000000";
                    WHEN "101001" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0110001110010110111101000000000";
                    WHEN "101010" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0110011000000100110010000000000";
                    WHEN "101011" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0110100001110010100111000000000";
                    WHEN "101100" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0110101011100000011100000000000";
                    WHEN "101101" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0110110101001110010001000000000";
                    WHEN "101110" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0110111110111100000110000000000";
                    WHEN "101111" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0111001000101001111011000000000";
                    WHEN "110000" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0111010010010111110000000000000";
                    WHEN "110001" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0111011100000101100101000000000";
                    WHEN "110010" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0111100101110011011010000000000";
                    WHEN "110011" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0111101111100001001111000000000";
                    WHEN "110100" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "0111111001001111000100000000000";
                    WHEN "110101" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "1000000010111100111001000000000";
                    WHEN "110110" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "1000001100101010101110000000000";
                    WHEN "110111" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "1000010110011000100011000000000";
                    WHEN "111000" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "1000100000000110011000000000000";
                    WHEN "111001" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "1000101001110100001101000000000";
                    WHEN "111010" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "1000110011100010000010000000000";
                    WHEN "111011" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "1000111101001111110111000000000";
                    WHEN "111100" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "1001000110111101101100000000000";
                    WHEN "111101" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "1001010000101011100001000000000";
                    WHEN "111110" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "1001011010011001010110000000000";
                    WHEN "111111" => p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= "1001100100000111001011000000000";
                    WHEN OTHERS => -- unreachable
                                   p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q <= (others => '-');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- lowRangeB_uid352_cstMultOutMag_uid339_vecTranslateTest_merged_bit_select(BITSELECT,401)@18
    lowRangeB_uid352_cstMultOutMag_uid339_vecTranslateTest_merged_bit_select_b <= p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q(0 downto 0);
    lowRangeB_uid352_cstMultOutMag_uid339_vecTranslateTest_merged_bit_select_c <= p1_uid350_cstMultOutMag_uid339_vecTranslateTest_q(30 downto 1);

    -- p2_uid349_cstMultOutMag_uid339_vecTranslateTest(LOOKUP,348)@17 + 1
    p2_uid349_cstMultOutMag_uid339_vecTranslateTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0000000000000000001000000000000000000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE (xv0_uid346_cstMultOutMag_uid339_vecTranslateTest_merged_bit_select_d) IS
                    WHEN "000000" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0000000000000000001000000000000000000";
                    WHEN "000001" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0000000100110111000010100000000000000";
                    WHEN "000010" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0000001001101101111101000000000000000";
                    WHEN "000011" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0000001110100100110111100000000000000";
                    WHEN "000100" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0000010011011011110010000000000000000";
                    WHEN "000101" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0000011000010010101100100000000000000";
                    WHEN "000110" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0000011101001001100111000000000000000";
                    WHEN "000111" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0000100010000000100001100000000000000";
                    WHEN "001000" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0000100110110111011100000000000000000";
                    WHEN "001001" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0000101011101110010110100000000000000";
                    WHEN "001010" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0000110000100101010001000000000000000";
                    WHEN "001011" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0000110101011100001011100000000000000";
                    WHEN "001100" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0000111010010011000110000000000000000";
                    WHEN "001101" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0000111111001010000000100000000000000";
                    WHEN "001110" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0001000100000000111011000000000000000";
                    WHEN "001111" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0001001000110111110101100000000000000";
                    WHEN "010000" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0001001101101110110000000000000000000";
                    WHEN "010001" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0001010010100101101010100000000000000";
                    WHEN "010010" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0001010111011100100101000000000000000";
                    WHEN "010011" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0001011100010011011111100000000000000";
                    WHEN "010100" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0001100001001010011010000000000000000";
                    WHEN "010101" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0001100110000001010100100000000000000";
                    WHEN "010110" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0001101010111000001111000000000000000";
                    WHEN "010111" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0001101111101111001001100000000000000";
                    WHEN "011000" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0001110100100110000100000000000000000";
                    WHEN "011001" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0001111001011100111110100000000000000";
                    WHEN "011010" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0001111110010011111001000000000000000";
                    WHEN "011011" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0010000011001010110011100000000000000";
                    WHEN "011100" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0010001000000001101110000000000000000";
                    WHEN "011101" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0010001100111000101000100000000000000";
                    WHEN "011110" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0010010001101111100011000000000000000";
                    WHEN "011111" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0010010110100110011101100000000000000";
                    WHEN "100000" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0010011011011101011000000000000000000";
                    WHEN "100001" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0010100000010100010010100000000000000";
                    WHEN "100010" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0010100101001011001101000000000000000";
                    WHEN "100011" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0010101010000010000111100000000000000";
                    WHEN "100100" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0010101110111001000010000000000000000";
                    WHEN "100101" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0010110011101111111100100000000000000";
                    WHEN "100110" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0010111000100110110111000000000000000";
                    WHEN "100111" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0010111101011101110001100000000000000";
                    WHEN "101000" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0011000010010100101100000000000000000";
                    WHEN "101001" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0011000111001011100110100000000000000";
                    WHEN "101010" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0011001100000010100001000000000000000";
                    WHEN "101011" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0011010000111001011011100000000000000";
                    WHEN "101100" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0011010101110000010110000000000000000";
                    WHEN "101101" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0011011010100111010000100000000000000";
                    WHEN "101110" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0011011111011110001011000000000000000";
                    WHEN "101111" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0011100100010101000101100000000000000";
                    WHEN "110000" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0011101001001100000000000000000000000";
                    WHEN "110001" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0011101110000010111010100000000000000";
                    WHEN "110010" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0011110010111001110101000000000000000";
                    WHEN "110011" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0011110111110000101111100000000000000";
                    WHEN "110100" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0011111100100111101010000000000000000";
                    WHEN "110101" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0100000001011110100100100000000000000";
                    WHEN "110110" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0100000110010101011111000000000000000";
                    WHEN "110111" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0100001011001100011001100000000000000";
                    WHEN "111000" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0100010000000011010100000000000000000";
                    WHEN "111001" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0100010100111010001110100000000000000";
                    WHEN "111010" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0100011001110001001001000000000000000";
                    WHEN "111011" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0100011110101000000011100000000000000";
                    WHEN "111100" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0100100011011110111110000000000000000";
                    WHEN "111101" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0100101000010101111000100000000000000";
                    WHEN "111110" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0100101101001100110011000000000000000";
                    WHEN "111111" => p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= "0100110010000011101101100000000000000";
                    WHEN OTHERS => -- unreachable
                                   p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q <= (others => '-');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- lev1_a0sumAHighB_uid354_cstMultOutMag_uid339_vecTranslateTest(ADD,353)@18 + 1
    lev1_a0sumAHighB_uid354_cstMultOutMag_uid339_vecTranslateTest_a <= STD_LOGIC_VECTOR("0" & p2_uid349_cstMultOutMag_uid339_vecTranslateTest_q);
    lev1_a0sumAHighB_uid354_cstMultOutMag_uid339_vecTranslateTest_b <= STD_LOGIC_VECTOR("00000000" & lowRangeB_uid352_cstMultOutMag_uid339_vecTranslateTest_merged_bit_select_c);
    lev1_a0sumAHighB_uid354_cstMultOutMag_uid339_vecTranslateTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            lev1_a0sumAHighB_uid354_cstMultOutMag_uid339_vecTranslateTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                lev1_a0sumAHighB_uid354_cstMultOutMag_uid339_vecTranslateTest_o <= STD_LOGIC_VECTOR(UNSIGNED(lev1_a0sumAHighB_uid354_cstMultOutMag_uid339_vecTranslateTest_a) + UNSIGNED(lev1_a0sumAHighB_uid354_cstMultOutMag_uid339_vecTranslateTest_b));
            END IF;
        END IF;
    END PROCESS;
    lev1_a0sumAHighB_uid354_cstMultOutMag_uid339_vecTranslateTest_q <= lev1_a0sumAHighB_uid354_cstMultOutMag_uid339_vecTranslateTest_o(37 downto 0);

    -- redist0_lowRangeB_uid352_cstMultOutMag_uid339_vecTranslateTest_merged_bit_select_b_1(DELAY,402)
    redist0_lowRangeB_uid352_cstMultOutMag_uid339_vecTranslateTest_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => lowRangeB_uid352_cstMultOutMag_uid339_vecTranslateTest_merged_bit_select_b, xout => redist0_lowRangeB_uid352_cstMultOutMag_uid339_vecTranslateTest_merged_bit_select_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- lev1_a0_uid355_cstMultOutMag_uid339_vecTranslateTest(BITJOIN,354)@19
    lev1_a0_uid355_cstMultOutMag_uid339_vecTranslateTest_q <= lev1_a0sumAHighB_uid354_cstMultOutMag_uid339_vecTranslateTest_q & redist0_lowRangeB_uid352_cstMultOutMag_uid339_vecTranslateTest_merged_bit_select_b_1_q;

    -- lev2_a0_uid356_cstMultOutMag_uid339_vecTranslateTest(ADD,355)@19 + 1
    lev2_a0_uid356_cstMultOutMag_uid339_vecTranslateTest_a <= STD_LOGIC_VECTOR("0" & lev1_a0_uid355_cstMultOutMag_uid339_vecTranslateTest_q);
    lev2_a0_uid356_cstMultOutMag_uid339_vecTranslateTest_b <= STD_LOGIC_VECTOR("000000000000000" & p0_uid351_cstMultOutMag_uid339_vecTranslateTest_q);
    lev2_a0_uid356_cstMultOutMag_uid339_vecTranslateTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            lev2_a0_uid356_cstMultOutMag_uid339_vecTranslateTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                lev2_a0_uid356_cstMultOutMag_uid339_vecTranslateTest_o <= STD_LOGIC_VECTOR(UNSIGNED(lev2_a0_uid356_cstMultOutMag_uid339_vecTranslateTest_a) + UNSIGNED(lev2_a0_uid356_cstMultOutMag_uid339_vecTranslateTest_b));
            END IF;
        END IF;
    END PROCESS;
    lev2_a0_uid356_cstMultOutMag_uid339_vecTranslateTest_q <= lev2_a0_uid356_cstMultOutMag_uid339_vecTranslateTest_o(39 downto 0);

    -- sR_uid366_cstMultOutMag_uid339_vecTranslateTest(BITSELECT,365)@20
    sR_uid366_cstMultOutMag_uid339_vecTranslateTest_in <= lev2_a0_uid356_cstMultOutMag_uid339_vecTranslateTest_q(36 downto 0);
    sR_uid366_cstMultOutMag_uid339_vecTranslateTest_b <= sR_uid366_cstMultOutMag_uid339_vecTranslateTest_in(36 downto 20);

    -- redist3_sR_uid366_cstMultOutMag_uid339_vecTranslateTest_b_1(DELAY,405)
    redist3_sR_uid366_cstMultOutMag_uid339_vecTranslateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sR_uid366_cstMultOutMag_uid339_vecTranslateTest_b, xout => redist3_sR_uid366_cstMultOutMag_uid339_vecTranslateTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- paddingX_uid359_cstMultOutMag_uid339_vecTranslateTest(CONSTANT,358)
    paddingX_uid359_cstMultOutMag_uid339_vecTranslateTest_q <= "00000000000000000000";

    -- updatedX_uid360_cstMultOutMag_uid339_vecTranslateTest(BITJOIN,359)@20
    updatedX_uid360_cstMultOutMag_uid339_vecTranslateTest_q <= maxValInOutFormat_uid357_cstMultOutMag_uid339_vecTranslateTest_q & paddingX_uid359_cstMultOutMag_uid339_vecTranslateTest_q;

    -- ovf_uid359_cstMultOutMag_uid339_vecTranslateTest(COMPARE,360)@20 + 1
    ovf_uid359_cstMultOutMag_uid339_vecTranslateTest_a <= STD_LOGIC_VECTOR("00000" & updatedX_uid360_cstMultOutMag_uid339_vecTranslateTest_q);
    ovf_uid359_cstMultOutMag_uid339_vecTranslateTest_b <= STD_LOGIC_VECTOR("00" & lev2_a0_uid356_cstMultOutMag_uid339_vecTranslateTest_q);
    ovf_uid359_cstMultOutMag_uid339_vecTranslateTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ovf_uid359_cstMultOutMag_uid339_vecTranslateTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                ovf_uid359_cstMultOutMag_uid339_vecTranslateTest_o <= STD_LOGIC_VECTOR(UNSIGNED(ovf_uid359_cstMultOutMag_uid339_vecTranslateTest_a) - UNSIGNED(ovf_uid359_cstMultOutMag_uid339_vecTranslateTest_b));
            END IF;
        END IF;
    END PROCESS;
    ovf_uid359_cstMultOutMag_uid339_vecTranslateTest_c(0) <= ovf_uid359_cstMultOutMag_uid339_vecTranslateTest_o(41);

    -- updatedY_uid363_cstMultOutMag_uid339_vecTranslateTest(BITJOIN,362)@20
    updatedY_uid363_cstMultOutMag_uid339_vecTranslateTest_q <= constantZeroOutFormat_uid330_vecTranslateTest_q & paddingX_uid359_cstMultOutMag_uid339_vecTranslateTest_q;

    -- udf_uid362_cstMultOutMag_uid339_vecTranslateTest(COMPARE,363)@20 + 1
    udf_uid362_cstMultOutMag_uid339_vecTranslateTest_a <= STD_LOGIC_VECTOR("00" & lev2_a0_uid356_cstMultOutMag_uid339_vecTranslateTest_q);
    udf_uid362_cstMultOutMag_uid339_vecTranslateTest_b <= STD_LOGIC_VECTOR("00000" & updatedY_uid363_cstMultOutMag_uid339_vecTranslateTest_q);
    udf_uid362_cstMultOutMag_uid339_vecTranslateTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            udf_uid362_cstMultOutMag_uid339_vecTranslateTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                udf_uid362_cstMultOutMag_uid339_vecTranslateTest_o <= STD_LOGIC_VECTOR(UNSIGNED(udf_uid362_cstMultOutMag_uid339_vecTranslateTest_a) - UNSIGNED(udf_uid362_cstMultOutMag_uid339_vecTranslateTest_b));
            END IF;
        END IF;
    END PROCESS;
    udf_uid362_cstMultOutMag_uid339_vecTranslateTest_c(0) <= udf_uid362_cstMultOutMag_uid339_vecTranslateTest_o(41);

    -- ovfudfcond_uid365_cstMultOutMag_uid339_vecTranslateTest(BITJOIN,364)@21
    ovfudfcond_uid365_cstMultOutMag_uid339_vecTranslateTest_q <= ovf_uid359_cstMultOutMag_uid339_vecTranslateTest_c & udf_uid362_cstMultOutMag_uid339_vecTranslateTest_c;

    -- sRA0_uid367_cstMultOutMag_uid339_vecTranslateTest(MUX,366)@21 + 1
    sRA0_uid367_cstMultOutMag_uid339_vecTranslateTest_s <= ovfudfcond_uid365_cstMultOutMag_uid339_vecTranslateTest_q;
    sRA0_uid367_cstMultOutMag_uid339_vecTranslateTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sRA0_uid367_cstMultOutMag_uid339_vecTranslateTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE (sRA0_uid367_cstMultOutMag_uid339_vecTranslateTest_s) IS
                    WHEN "00" => sRA0_uid367_cstMultOutMag_uid339_vecTranslateTest_q <= redist3_sR_uid366_cstMultOutMag_uid339_vecTranslateTest_b_1_q;
                    WHEN "01" => sRA0_uid367_cstMultOutMag_uid339_vecTranslateTest_q <= constantZeroOutFormat_uid330_vecTranslateTest_q;
                    WHEN "10" => sRA0_uid367_cstMultOutMag_uid339_vecTranslateTest_q <= maxValInOutFormat_uid357_cstMultOutMag_uid339_vecTranslateTest_q;
                    WHEN "11" => sRA0_uid367_cstMultOutMag_uid339_vecTranslateTest_q <= maxValInOutFormat_uid357_cstMultOutMag_uid339_vecTranslateTest_q;
                    WHEN OTHERS => sRA0_uid367_cstMultOutMag_uid339_vecTranslateTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- outMagPostRnd_uid343_vecTranslateTest(ADD,342)@22
    outMagPostRnd_uid343_vecTranslateTest_a <= STD_LOGIC_VECTOR("0" & sRA0_uid367_cstMultOutMag_uid339_vecTranslateTest_q);
    outMagPostRnd_uid343_vecTranslateTest_b <= STD_LOGIC_VECTOR("00000000000000000" & VCC_q);
    outMagPostRnd_uid343_vecTranslateTest_o <= STD_LOGIC_VECTOR(UNSIGNED(outMagPostRnd_uid343_vecTranslateTest_a) + UNSIGNED(outMagPostRnd_uid343_vecTranslateTest_b));
    outMagPostRnd_uid343_vecTranslateTest_q <= outMagPostRnd_uid343_vecTranslateTest_o(17 downto 0);

    -- outMag_uid344_vecTranslateTest(BITSELECT,343)@22
    outMag_uid344_vecTranslateTest_in <= outMagPostRnd_uid343_vecTranslateTest_q(16 downto 0);
    outMag_uid344_vecTranslateTest_b <= outMag_uid344_vecTranslateTest_in(16 downto 1);

    -- constPi_uid329_vecTranslateTest(CONSTANT,328)
    constPi_uid329_vecTranslateTest_q <= "11001001000100000";

    -- constPiP2uE_uid320_vecTranslateTest(CONSTANT,319)
    constPiP2uE_uid320_vecTranslateTest_q <= "1100100100010010";

    -- constPio2P2u_mergedSignalTM_uid323_vecTranslateTest(BITJOIN,322)@19
    constPio2P2u_mergedSignalTM_uid323_vecTranslateTest_q <= GND_q & constPiP2uE_uid320_vecTranslateTest_q;

    -- cstZeroOutFormat_uid319_vecTranslateTest(CONSTANT,318)
    cstZeroOutFormat_uid319_vecTranslateTest_q <= "00000000000000010";

    -- redist49_xMSB_uid32_vecTranslateTest_b_14(DELAY,451)
    redist49_xMSB_uid32_vecTranslateTest_b_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 14, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid32_vecTranslateTest_b, xout => redist49_xMSB_uid32_vecTranslateTest_b_14_q, ena => en(0), clk => clk, aclr => areset );

    -- redist46_xMSB_uid51_vecTranslateTest_b_13(DELAY,448)
    redist46_xMSB_uid51_vecTranslateTest_b_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 13, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid51_vecTranslateTest_b, xout => redist46_xMSB_uid51_vecTranslateTest_b_13_q, ena => en(0), clk => clk, aclr => areset );

    -- redist43_xMSB_uid70_vecTranslateTest_b_12(DELAY,445)
    redist43_xMSB_uid70_vecTranslateTest_b_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 12, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid70_vecTranslateTest_b, xout => redist43_xMSB_uid70_vecTranslateTest_b_12_q, ena => en(0), clk => clk, aclr => areset );

    -- redist40_xMSB_uid89_vecTranslateTest_b_11(DELAY,442)
    redist40_xMSB_uid89_vecTranslateTest_b_11 : dspba_delay
    GENERIC MAP ( width => 1, depth => 11, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid89_vecTranslateTest_b, xout => redist40_xMSB_uid89_vecTranslateTest_b_11_q, ena => en(0), clk => clk, aclr => areset );

    -- redist37_xMSB_uid108_vecTranslateTest_b_10(DELAY,439)
    redist37_xMSB_uid108_vecTranslateTest_b_10 : dspba_delay
    GENERIC MAP ( width => 1, depth => 10, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid108_vecTranslateTest_b, xout => redist37_xMSB_uid108_vecTranslateTest_b_10_q, ena => en(0), clk => clk, aclr => areset );

    -- redist34_xMSB_uid127_vecTranslateTest_b_9(DELAY,436)
    redist34_xMSB_uid127_vecTranslateTest_b_9 : dspba_delay
    GENERIC MAP ( width => 1, depth => 9, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid127_vecTranslateTest_b, xout => redist34_xMSB_uid127_vecTranslateTest_b_9_q, ena => en(0), clk => clk, aclr => areset );

    -- redist31_xMSB_uid148_vecTranslateTest_b_8(DELAY,433)
    redist31_xMSB_uid148_vecTranslateTest_b_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid148_vecTranslateTest_b, xout => redist31_xMSB_uid148_vecTranslateTest_b_8_q, ena => en(0), clk => clk, aclr => areset );

    -- redist28_xMSB_uid165_vecTranslateTest_b_7(DELAY,430)
    redist28_xMSB_uid165_vecTranslateTest_b_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 7, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid165_vecTranslateTest_b, xout => redist28_xMSB_uid165_vecTranslateTest_b_7_q, ena => en(0), clk => clk, aclr => areset );

    -- redist25_xMSB_uid182_vecTranslateTest_b_6(DELAY,427)
    redist25_xMSB_uid182_vecTranslateTest_b_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid182_vecTranslateTest_b, xout => redist25_xMSB_uid182_vecTranslateTest_b_6_q, ena => en(0), clk => clk, aclr => areset );

    -- redist22_xMSB_uid199_vecTranslateTest_b_5(DELAY,424)
    redist22_xMSB_uid199_vecTranslateTest_b_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid199_vecTranslateTest_b, xout => redist22_xMSB_uid199_vecTranslateTest_b_5_q, ena => en(0), clk => clk, aclr => areset );

    -- redist19_xMSB_uid216_vecTranslateTest_b_4(DELAY,421)
    redist19_xMSB_uid216_vecTranslateTest_b_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid216_vecTranslateTest_b, xout => redist19_xMSB_uid216_vecTranslateTest_b_4_q, ena => en(0), clk => clk, aclr => areset );

    -- redist16_xMSB_uid233_vecTranslateTest_b_3(DELAY,418)
    redist16_xMSB_uid233_vecTranslateTest_b_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid233_vecTranslateTest_b, xout => redist16_xMSB_uid233_vecTranslateTest_b_3_q, ena => en(0), clk => clk, aclr => areset );

    -- redist13_xMSB_uid250_vecTranslateTest_b_2(DELAY,415)
    redist13_xMSB_uid250_vecTranslateTest_b_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid250_vecTranslateTest_b, xout => redist13_xMSB_uid250_vecTranslateTest_b_2_q, ena => en(0), clk => clk, aclr => areset );

    -- redist10_xMSB_uid267_vecTranslateTest_b_1(DELAY,412)
    redist10_xMSB_uid267_vecTranslateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid267_vecTranslateTest_b, xout => redist10_xMSB_uid267_vecTranslateTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- concSignVector_uid301_vecTranslateTest(BITJOIN,300)@16
    concSignVector_uid301_vecTranslateTest_q <= GND_q & redist49_xMSB_uid32_vecTranslateTest_b_14_q & redist46_xMSB_uid51_vecTranslateTest_b_13_q & redist43_xMSB_uid70_vecTranslateTest_b_12_q & redist40_xMSB_uid89_vecTranslateTest_b_11_q & redist37_xMSB_uid108_vecTranslateTest_b_10_q & redist34_xMSB_uid127_vecTranslateTest_b_9_q & redist31_xMSB_uid148_vecTranslateTest_b_8_q & redist28_xMSB_uid165_vecTranslateTest_b_7_q & redist25_xMSB_uid182_vecTranslateTest_b_6_q & redist22_xMSB_uid199_vecTranslateTest_b_5_q & redist19_xMSB_uid216_vecTranslateTest_b_4_q & redist16_xMSB_uid233_vecTranslateTest_b_3_q & redist13_xMSB_uid250_vecTranslateTest_b_2_q & redist10_xMSB_uid267_vecTranslateTest_b_1_q & redist8_xMSB_uid284_vecTranslateTest_b_1_q;

    -- is0_uid302_vecTranslateTest_merged_bit_select(BITSELECT,399)@16
    is0_uid302_vecTranslateTest_merged_bit_select_b <= concSignVector_uid301_vecTranslateTest_q(15 downto 10);
    is0_uid302_vecTranslateTest_merged_bit_select_c <= concSignVector_uid301_vecTranslateTest_q(9 downto 4);
    is0_uid302_vecTranslateTest_merged_bit_select_d <= concSignVector_uid301_vecTranslateTest_q(3 downto 0);

    -- redist2_is0_uid302_vecTranslateTest_merged_bit_select_d_1(DELAY,404)
    redist2_is0_uid302_vecTranslateTest_merged_bit_select_d_1 : dspba_delay
    GENERIC MAP ( width => 4, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => is0_uid302_vecTranslateTest_merged_bit_select_d, xout => redist2_is0_uid302_vecTranslateTest_merged_bit_select_d_1_q, ena => en(0), clk => clk, aclr => areset );

    -- table_l15_uid313_vecTranslateTest(LOOKUP,312)@17 + 1
    table_l15_uid313_vecTranslateTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            table_l15_uid313_vecTranslateTest_q <= "01111000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE (redist2_is0_uid302_vecTranslateTest_merged_bit_select_d_1_q) IS
                    WHEN "0000" => table_l15_uid313_vecTranslateTest_q <= "01111000";
                    WHEN "0001" => table_l15_uid313_vecTranslateTest_q <= "01101000";
                    WHEN "0010" => table_l15_uid313_vecTranslateTest_q <= "01011000";
                    WHEN "0011" => table_l15_uid313_vecTranslateTest_q <= "01001000";
                    WHEN "0100" => table_l15_uid313_vecTranslateTest_q <= "00111000";
                    WHEN "0101" => table_l15_uid313_vecTranslateTest_q <= "00101000";
                    WHEN "0110" => table_l15_uid313_vecTranslateTest_q <= "00011000";
                    WHEN "0111" => table_l15_uid313_vecTranslateTest_q <= "00001000";
                    WHEN "1000" => table_l15_uid313_vecTranslateTest_q <= "11111000";
                    WHEN "1001" => table_l15_uid313_vecTranslateTest_q <= "11101000";
                    WHEN "1010" => table_l15_uid313_vecTranslateTest_q <= "11011000";
                    WHEN "1011" => table_l15_uid313_vecTranslateTest_q <= "11001000";
                    WHEN "1100" => table_l15_uid313_vecTranslateTest_q <= "10111000";
                    WHEN "1101" => table_l15_uid313_vecTranslateTest_q <= "10101000";
                    WHEN "1110" => table_l15_uid313_vecTranslateTest_q <= "10011000";
                    WHEN "1111" => table_l15_uid313_vecTranslateTest_q <= "10001000";
                    WHEN OTHERS => -- unreachable
                                   table_l15_uid313_vecTranslateTest_q <= (others => '-');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- table_l11_uid309_vecTranslateTest(LOOKUP,308)@16 + 1
    table_l11_uid309_vecTranslateTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            table_l11_uid309_vecTranslateTest_q <= "0111";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE (is0_uid302_vecTranslateTest_merged_bit_select_c) IS
                    WHEN "000000" => table_l11_uid309_vecTranslateTest_q <= "0111";
                    WHEN "000001" => table_l11_uid309_vecTranslateTest_q <= "0111";
                    WHEN "000010" => table_l11_uid309_vecTranslateTest_q <= "0111";
                    WHEN "000011" => table_l11_uid309_vecTranslateTest_q <= "0111";
                    WHEN "000100" => table_l11_uid309_vecTranslateTest_q <= "0110";
                    WHEN "000101" => table_l11_uid309_vecTranslateTest_q <= "0110";
                    WHEN "000110" => table_l11_uid309_vecTranslateTest_q <= "0110";
                    WHEN "000111" => table_l11_uid309_vecTranslateTest_q <= "0110";
                    WHEN "001000" => table_l11_uid309_vecTranslateTest_q <= "0101";
                    WHEN "001001" => table_l11_uid309_vecTranslateTest_q <= "0101";
                    WHEN "001010" => table_l11_uid309_vecTranslateTest_q <= "0101";
                    WHEN "001011" => table_l11_uid309_vecTranslateTest_q <= "0101";
                    WHEN "001100" => table_l11_uid309_vecTranslateTest_q <= "0100";
                    WHEN "001101" => table_l11_uid309_vecTranslateTest_q <= "0100";
                    WHEN "001110" => table_l11_uid309_vecTranslateTest_q <= "0100";
                    WHEN "001111" => table_l11_uid309_vecTranslateTest_q <= "0100";
                    WHEN "010000" => table_l11_uid309_vecTranslateTest_q <= "0011";
                    WHEN "010001" => table_l11_uid309_vecTranslateTest_q <= "0011";
                    WHEN "010010" => table_l11_uid309_vecTranslateTest_q <= "0011";
                    WHEN "010011" => table_l11_uid309_vecTranslateTest_q <= "0011";
                    WHEN "010100" => table_l11_uid309_vecTranslateTest_q <= "0010";
                    WHEN "010101" => table_l11_uid309_vecTranslateTest_q <= "0010";
                    WHEN "010110" => table_l11_uid309_vecTranslateTest_q <= "0010";
                    WHEN "010111" => table_l11_uid309_vecTranslateTest_q <= "0010";
                    WHEN "011000" => table_l11_uid309_vecTranslateTest_q <= "0001";
                    WHEN "011001" => table_l11_uid309_vecTranslateTest_q <= "0001";
                    WHEN "011010" => table_l11_uid309_vecTranslateTest_q <= "0001";
                    WHEN "011011" => table_l11_uid309_vecTranslateTest_q <= "0001";
                    WHEN "011100" => table_l11_uid309_vecTranslateTest_q <= "0000";
                    WHEN "011101" => table_l11_uid309_vecTranslateTest_q <= "0000";
                    WHEN "011110" => table_l11_uid309_vecTranslateTest_q <= "0000";
                    WHEN "011111" => table_l11_uid309_vecTranslateTest_q <= "0000";
                    WHEN "100000" => table_l11_uid309_vecTranslateTest_q <= "1111";
                    WHEN "100001" => table_l11_uid309_vecTranslateTest_q <= "1111";
                    WHEN "100010" => table_l11_uid309_vecTranslateTest_q <= "1111";
                    WHEN "100011" => table_l11_uid309_vecTranslateTest_q <= "1111";
                    WHEN "100100" => table_l11_uid309_vecTranslateTest_q <= "1110";
                    WHEN "100101" => table_l11_uid309_vecTranslateTest_q <= "1110";
                    WHEN "100110" => table_l11_uid309_vecTranslateTest_q <= "1110";
                    WHEN "100111" => table_l11_uid309_vecTranslateTest_q <= "1110";
                    WHEN "101000" => table_l11_uid309_vecTranslateTest_q <= "1101";
                    WHEN "101001" => table_l11_uid309_vecTranslateTest_q <= "1101";
                    WHEN "101010" => table_l11_uid309_vecTranslateTest_q <= "1101";
                    WHEN "101011" => table_l11_uid309_vecTranslateTest_q <= "1101";
                    WHEN "101100" => table_l11_uid309_vecTranslateTest_q <= "1100";
                    WHEN "101101" => table_l11_uid309_vecTranslateTest_q <= "1100";
                    WHEN "101110" => table_l11_uid309_vecTranslateTest_q <= "1100";
                    WHEN "101111" => table_l11_uid309_vecTranslateTest_q <= "1100";
                    WHEN "110000" => table_l11_uid309_vecTranslateTest_q <= "1011";
                    WHEN "110001" => table_l11_uid309_vecTranslateTest_q <= "1011";
                    WHEN "110010" => table_l11_uid309_vecTranslateTest_q <= "1011";
                    WHEN "110011" => table_l11_uid309_vecTranslateTest_q <= "1011";
                    WHEN "110100" => table_l11_uid309_vecTranslateTest_q <= "1010";
                    WHEN "110101" => table_l11_uid309_vecTranslateTest_q <= "1010";
                    WHEN "110110" => table_l11_uid309_vecTranslateTest_q <= "1010";
                    WHEN "110111" => table_l11_uid309_vecTranslateTest_q <= "1010";
                    WHEN "111000" => table_l11_uid309_vecTranslateTest_q <= "1001";
                    WHEN "111001" => table_l11_uid309_vecTranslateTest_q <= "1001";
                    WHEN "111010" => table_l11_uid309_vecTranslateTest_q <= "1001";
                    WHEN "111011" => table_l11_uid309_vecTranslateTest_q <= "1001";
                    WHEN "111100" => table_l11_uid309_vecTranslateTest_q <= "1000";
                    WHEN "111101" => table_l11_uid309_vecTranslateTest_q <= "1000";
                    WHEN "111110" => table_l11_uid309_vecTranslateTest_q <= "1000";
                    WHEN "111111" => table_l11_uid309_vecTranslateTest_q <= "1000";
                    WHEN OTHERS => -- unreachable
                                   table_l11_uid309_vecTranslateTest_q <= (others => '-');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- table_l11_uid308_vecTranslateTest(LOOKUP,307)@16 + 1
    table_l11_uid308_vecTranslateTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            table_l11_uid308_vecTranslateTest_q <= "1110000000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE (is0_uid302_vecTranslateTest_merged_bit_select_c) IS
                    WHEN "000000" => table_l11_uid308_vecTranslateTest_q <= "1110000000";
                    WHEN "000001" => table_l11_uid308_vecTranslateTest_q <= "1010000000";
                    WHEN "000010" => table_l11_uid308_vecTranslateTest_q <= "0110000000";
                    WHEN "000011" => table_l11_uid308_vecTranslateTest_q <= "0010000000";
                    WHEN "000100" => table_l11_uid308_vecTranslateTest_q <= "1110000000";
                    WHEN "000101" => table_l11_uid308_vecTranslateTest_q <= "1010000000";
                    WHEN "000110" => table_l11_uid308_vecTranslateTest_q <= "0110000000";
                    WHEN "000111" => table_l11_uid308_vecTranslateTest_q <= "0010000000";
                    WHEN "001000" => table_l11_uid308_vecTranslateTest_q <= "1110000000";
                    WHEN "001001" => table_l11_uid308_vecTranslateTest_q <= "1010000000";
                    WHEN "001010" => table_l11_uid308_vecTranslateTest_q <= "0110000000";
                    WHEN "001011" => table_l11_uid308_vecTranslateTest_q <= "0010000000";
                    WHEN "001100" => table_l11_uid308_vecTranslateTest_q <= "1110000000";
                    WHEN "001101" => table_l11_uid308_vecTranslateTest_q <= "1010000000";
                    WHEN "001110" => table_l11_uid308_vecTranslateTest_q <= "0110000000";
                    WHEN "001111" => table_l11_uid308_vecTranslateTest_q <= "0010000000";
                    WHEN "010000" => table_l11_uid308_vecTranslateTest_q <= "1110000000";
                    WHEN "010001" => table_l11_uid308_vecTranslateTest_q <= "1010000000";
                    WHEN "010010" => table_l11_uid308_vecTranslateTest_q <= "0110000000";
                    WHEN "010011" => table_l11_uid308_vecTranslateTest_q <= "0010000000";
                    WHEN "010100" => table_l11_uid308_vecTranslateTest_q <= "1110000000";
                    WHEN "010101" => table_l11_uid308_vecTranslateTest_q <= "1010000000";
                    WHEN "010110" => table_l11_uid308_vecTranslateTest_q <= "0110000000";
                    WHEN "010111" => table_l11_uid308_vecTranslateTest_q <= "0010000000";
                    WHEN "011000" => table_l11_uid308_vecTranslateTest_q <= "1110000000";
                    WHEN "011001" => table_l11_uid308_vecTranslateTest_q <= "1010000000";
                    WHEN "011010" => table_l11_uid308_vecTranslateTest_q <= "0110000000";
                    WHEN "011011" => table_l11_uid308_vecTranslateTest_q <= "0010000000";
                    WHEN "011100" => table_l11_uid308_vecTranslateTest_q <= "1110000000";
                    WHEN "011101" => table_l11_uid308_vecTranslateTest_q <= "1010000000";
                    WHEN "011110" => table_l11_uid308_vecTranslateTest_q <= "0110000000";
                    WHEN "011111" => table_l11_uid308_vecTranslateTest_q <= "0010000000";
                    WHEN "100000" => table_l11_uid308_vecTranslateTest_q <= "1110000000";
                    WHEN "100001" => table_l11_uid308_vecTranslateTest_q <= "1010000000";
                    WHEN "100010" => table_l11_uid308_vecTranslateTest_q <= "0110000000";
                    WHEN "100011" => table_l11_uid308_vecTranslateTest_q <= "0010000000";
                    WHEN "100100" => table_l11_uid308_vecTranslateTest_q <= "1110000000";
                    WHEN "100101" => table_l11_uid308_vecTranslateTest_q <= "1010000000";
                    WHEN "100110" => table_l11_uid308_vecTranslateTest_q <= "0110000000";
                    WHEN "100111" => table_l11_uid308_vecTranslateTest_q <= "0010000000";
                    WHEN "101000" => table_l11_uid308_vecTranslateTest_q <= "1110000000";
                    WHEN "101001" => table_l11_uid308_vecTranslateTest_q <= "1010000000";
                    WHEN "101010" => table_l11_uid308_vecTranslateTest_q <= "0110000000";
                    WHEN "101011" => table_l11_uid308_vecTranslateTest_q <= "0010000000";
                    WHEN "101100" => table_l11_uid308_vecTranslateTest_q <= "1110000000";
                    WHEN "101101" => table_l11_uid308_vecTranslateTest_q <= "1010000000";
                    WHEN "101110" => table_l11_uid308_vecTranslateTest_q <= "0110000000";
                    WHEN "101111" => table_l11_uid308_vecTranslateTest_q <= "0010000000";
                    WHEN "110000" => table_l11_uid308_vecTranslateTest_q <= "1110000000";
                    WHEN "110001" => table_l11_uid308_vecTranslateTest_q <= "1010000000";
                    WHEN "110010" => table_l11_uid308_vecTranslateTest_q <= "0110000000";
                    WHEN "110011" => table_l11_uid308_vecTranslateTest_q <= "0010000000";
                    WHEN "110100" => table_l11_uid308_vecTranslateTest_q <= "1110000000";
                    WHEN "110101" => table_l11_uid308_vecTranslateTest_q <= "1010000000";
                    WHEN "110110" => table_l11_uid308_vecTranslateTest_q <= "0110000000";
                    WHEN "110111" => table_l11_uid308_vecTranslateTest_q <= "0010000000";
                    WHEN "111000" => table_l11_uid308_vecTranslateTest_q <= "1110000000";
                    WHEN "111001" => table_l11_uid308_vecTranslateTest_q <= "1010000000";
                    WHEN "111010" => table_l11_uid308_vecTranslateTest_q <= "0110000000";
                    WHEN "111011" => table_l11_uid308_vecTranslateTest_q <= "0010000000";
                    WHEN "111100" => table_l11_uid308_vecTranslateTest_q <= "1110000000";
                    WHEN "111101" => table_l11_uid308_vecTranslateTest_q <= "1010000000";
                    WHEN "111110" => table_l11_uid308_vecTranslateTest_q <= "0110000000";
                    WHEN "111111" => table_l11_uid308_vecTranslateTest_q <= "0010000000";
                    WHEN OTHERS => -- unreachable
                                   table_l11_uid308_vecTranslateTest_q <= (others => '-');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- os_uid310_vecTranslateTest(BITJOIN,309)@17
    os_uid310_vecTranslateTest_q <= table_l11_uid309_vecTranslateTest_q & table_l11_uid308_vecTranslateTest_q;

    -- table_l5_uid304_vecTranslateTest(LOOKUP,303)@16 + 1
    table_l5_uid304_vecTranslateTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            table_l5_uid304_vecTranslateTest_q <= "0110110110";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE (is0_uid302_vecTranslateTest_merged_bit_select_b) IS
                    WHEN "000000" => table_l5_uid304_vecTranslateTest_q <= "0110110110";
                    WHEN "000001" => table_l5_uid304_vecTranslateTest_q <= "0110100110";
                    WHEN "000010" => table_l5_uid304_vecTranslateTest_q <= "0110010110";
                    WHEN "000011" => table_l5_uid304_vecTranslateTest_q <= "0110000110";
                    WHEN "000100" => table_l5_uid304_vecTranslateTest_q <= "0101110110";
                    WHEN "000101" => table_l5_uid304_vecTranslateTest_q <= "0101100110";
                    WHEN "000110" => table_l5_uid304_vecTranslateTest_q <= "0101010110";
                    WHEN "000111" => table_l5_uid304_vecTranslateTest_q <= "0101000110";
                    WHEN "001000" => table_l5_uid304_vecTranslateTest_q <= "0100111000";
                    WHEN "001001" => table_l5_uid304_vecTranslateTest_q <= "0100101000";
                    WHEN "001010" => table_l5_uid304_vecTranslateTest_q <= "0100011000";
                    WHEN "001011" => table_l5_uid304_vecTranslateTest_q <= "0100001000";
                    WHEN "001100" => table_l5_uid304_vecTranslateTest_q <= "0011111001";
                    WHEN "001101" => table_l5_uid304_vecTranslateTest_q <= "0011101001";
                    WHEN "001110" => table_l5_uid304_vecTranslateTest_q <= "0011011001";
                    WHEN "001111" => table_l5_uid304_vecTranslateTest_q <= "0011001001";
                    WHEN "010000" => table_l5_uid304_vecTranslateTest_q <= "0011001000";
                    WHEN "010001" => table_l5_uid304_vecTranslateTest_q <= "0010111000";
                    WHEN "010010" => table_l5_uid304_vecTranslateTest_q <= "0010101000";
                    WHEN "010011" => table_l5_uid304_vecTranslateTest_q <= "0010011000";
                    WHEN "010100" => table_l5_uid304_vecTranslateTest_q <= "0010001001";
                    WHEN "010101" => table_l5_uid304_vecTranslateTest_q <= "0001111001";
                    WHEN "010110" => table_l5_uid304_vecTranslateTest_q <= "0001101001";
                    WHEN "010111" => table_l5_uid304_vecTranslateTest_q <= "0001011001";
                    WHEN "011000" => table_l5_uid304_vecTranslateTest_q <= "0001001011";
                    WHEN "011001" => table_l5_uid304_vecTranslateTest_q <= "0000111011";
                    WHEN "011010" => table_l5_uid304_vecTranslateTest_q <= "0000101011";
                    WHEN "011011" => table_l5_uid304_vecTranslateTest_q <= "0000011011";
                    WHEN "011100" => table_l5_uid304_vecTranslateTest_q <= "0000001011";
                    WHEN "011101" => table_l5_uid304_vecTranslateTest_q <= "1111111011";
                    WHEN "011110" => table_l5_uid304_vecTranslateTest_q <= "1111101011";
                    WHEN "011111" => table_l5_uid304_vecTranslateTest_q <= "1111011011";
                    WHEN "100000" => table_l5_uid304_vecTranslateTest_q <= "0000100100";
                    WHEN "100001" => table_l5_uid304_vecTranslateTest_q <= "0000010100";
                    WHEN "100010" => table_l5_uid304_vecTranslateTest_q <= "0000000100";
                    WHEN "100011" => table_l5_uid304_vecTranslateTest_q <= "1111110100";
                    WHEN "100100" => table_l5_uid304_vecTranslateTest_q <= "1111100100";
                    WHEN "100101" => table_l5_uid304_vecTranslateTest_q <= "1111010100";
                    WHEN "100110" => table_l5_uid304_vecTranslateTest_q <= "1111000100";
                    WHEN "100111" => table_l5_uid304_vecTranslateTest_q <= "1110110100";
                    WHEN "101000" => table_l5_uid304_vecTranslateTest_q <= "1110100110";
                    WHEN "101001" => table_l5_uid304_vecTranslateTest_q <= "1110010110";
                    WHEN "101010" => table_l5_uid304_vecTranslateTest_q <= "1110000110";
                    WHEN "101011" => table_l5_uid304_vecTranslateTest_q <= "1101110110";
                    WHEN "101100" => table_l5_uid304_vecTranslateTest_q <= "1101100111";
                    WHEN "101101" => table_l5_uid304_vecTranslateTest_q <= "1101010111";
                    WHEN "101110" => table_l5_uid304_vecTranslateTest_q <= "1101000111";
                    WHEN "101111" => table_l5_uid304_vecTranslateTest_q <= "1100110111";
                    WHEN "110000" => table_l5_uid304_vecTranslateTest_q <= "1100110110";
                    WHEN "110001" => table_l5_uid304_vecTranslateTest_q <= "1100100110";
                    WHEN "110010" => table_l5_uid304_vecTranslateTest_q <= "1100010110";
                    WHEN "110011" => table_l5_uid304_vecTranslateTest_q <= "1100000110";
                    WHEN "110100" => table_l5_uid304_vecTranslateTest_q <= "1011110111";
                    WHEN "110101" => table_l5_uid304_vecTranslateTest_q <= "1011100111";
                    WHEN "110110" => table_l5_uid304_vecTranslateTest_q <= "1011010111";
                    WHEN "110111" => table_l5_uid304_vecTranslateTest_q <= "1011000111";
                    WHEN "111000" => table_l5_uid304_vecTranslateTest_q <= "1010111001";
                    WHEN "111001" => table_l5_uid304_vecTranslateTest_q <= "1010101001";
                    WHEN "111010" => table_l5_uid304_vecTranslateTest_q <= "1010011001";
                    WHEN "111011" => table_l5_uid304_vecTranslateTest_q <= "1010001001";
                    WHEN "111100" => table_l5_uid304_vecTranslateTest_q <= "1001111001";
                    WHEN "111101" => table_l5_uid304_vecTranslateTest_q <= "1001101001";
                    WHEN "111110" => table_l5_uid304_vecTranslateTest_q <= "1001011001";
                    WHEN "111111" => table_l5_uid304_vecTranslateTest_q <= "1001001001";
                    WHEN OTHERS => -- unreachable
                                   table_l5_uid304_vecTranslateTest_q <= (others => '-');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- table_l5_uid303_vecTranslateTest(LOOKUP,302)@16 + 1
    table_l5_uid303_vecTranslateTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            table_l5_uid303_vecTranslateTest_q <= "0100110001";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE (is0_uid302_vecTranslateTest_merged_bit_select_b) IS
                    WHEN "000000" => table_l5_uid303_vecTranslateTest_q <= "0100110001";
                    WHEN "000001" => table_l5_uid303_vecTranslateTest_q <= "0100110110";
                    WHEN "000010" => table_l5_uid303_vecTranslateTest_q <= "0101011011";
                    WHEN "000011" => table_l5_uid303_vecTranslateTest_q <= "0101100000";
                    WHEN "000100" => table_l5_uid303_vecTranslateTest_q <= "1010000011";
                    WHEN "000101" => table_l5_uid303_vecTranslateTest_q <= "1010001000";
                    WHEN "000110" => table_l5_uid303_vecTranslateTest_q <= "1010101101";
                    WHEN "000111" => table_l5_uid303_vecTranslateTest_q <= "1010110011";
                    WHEN "001000" => table_l5_uid303_vecTranslateTest_q <= "1101111001";
                    WHEN "001001" => table_l5_uid303_vecTranslateTest_q <= "1101111110";
                    WHEN "001010" => table_l5_uid303_vecTranslateTest_q <= "1110100100";
                    WHEN "001011" => table_l5_uid303_vecTranslateTest_q <= "1110101001";
                    WHEN "001100" => table_l5_uid303_vecTranslateTest_q <= "0011001011";
                    WHEN "001101" => table_l5_uid303_vecTranslateTest_q <= "0011010001";
                    WHEN "001110" => table_l5_uid303_vecTranslateTest_q <= "0011110110";
                    WHEN "001111" => table_l5_uid303_vecTranslateTest_q <= "0011111011";
                    WHEN "010000" => table_l5_uid303_vecTranslateTest_q <= "1110100100";
                    WHEN "010001" => table_l5_uid303_vecTranslateTest_q <= "1110101001";
                    WHEN "010010" => table_l5_uid303_vecTranslateTest_q <= "1111001110";
                    WHEN "010011" => table_l5_uid303_vecTranslateTest_q <= "1111010100";
                    WHEN "010100" => table_l5_uid303_vecTranslateTest_q <= "0011110110";
                    WHEN "010101" => table_l5_uid303_vecTranslateTest_q <= "0011111011";
                    WHEN "010110" => table_l5_uid303_vecTranslateTest_q <= "0100100000";
                    WHEN "010111" => table_l5_uid303_vecTranslateTest_q <= "0100100110";
                    WHEN "011000" => table_l5_uid303_vecTranslateTest_q <= "0111101100";
                    WHEN "011001" => table_l5_uid303_vecTranslateTest_q <= "0111110010";
                    WHEN "011010" => table_l5_uid303_vecTranslateTest_q <= "1000010111";
                    WHEN "011011" => table_l5_uid303_vecTranslateTest_q <= "1000011100";
                    WHEN "011100" => table_l5_uid303_vecTranslateTest_q <= "1100111110";
                    WHEN "011101" => table_l5_uid303_vecTranslateTest_q <= "1101000100";
                    WHEN "011110" => table_l5_uid303_vecTranslateTest_q <= "1101101001";
                    WHEN "011111" => table_l5_uid303_vecTranslateTest_q <= "1101101110";
                    WHEN "100000" => table_l5_uid303_vecTranslateTest_q <= "0010110010";
                    WHEN "100001" => table_l5_uid303_vecTranslateTest_q <= "0010110111";
                    WHEN "100010" => table_l5_uid303_vecTranslateTest_q <= "0011011100";
                    WHEN "100011" => table_l5_uid303_vecTranslateTest_q <= "0011100010";
                    WHEN "100100" => table_l5_uid303_vecTranslateTest_q <= "1000000100";
                    WHEN "100101" => table_l5_uid303_vecTranslateTest_q <= "1000001001";
                    WHEN "100110" => table_l5_uid303_vecTranslateTest_q <= "1000101110";
                    WHEN "100111" => table_l5_uid303_vecTranslateTest_q <= "1000110100";
                    WHEN "101000" => table_l5_uid303_vecTranslateTest_q <= "1011111010";
                    WHEN "101001" => table_l5_uid303_vecTranslateTest_q <= "1100000000";
                    WHEN "101010" => table_l5_uid303_vecTranslateTest_q <= "1100100101";
                    WHEN "101011" => table_l5_uid303_vecTranslateTest_q <= "1100101010";
                    WHEN "101100" => table_l5_uid303_vecTranslateTest_q <= "0001001100";
                    WHEN "101101" => table_l5_uid303_vecTranslateTest_q <= "0001010010";
                    WHEN "101110" => table_l5_uid303_vecTranslateTest_q <= "0001110111";
                    WHEN "101111" => table_l5_uid303_vecTranslateTest_q <= "0001111100";
                    WHEN "110000" => table_l5_uid303_vecTranslateTest_q <= "1100100101";
                    WHEN "110001" => table_l5_uid303_vecTranslateTest_q <= "1100101010";
                    WHEN "110010" => table_l5_uid303_vecTranslateTest_q <= "1101001111";
                    WHEN "110011" => table_l5_uid303_vecTranslateTest_q <= "1101010101";
                    WHEN "110100" => table_l5_uid303_vecTranslateTest_q <= "0001110111";
                    WHEN "110101" => table_l5_uid303_vecTranslateTest_q <= "0001111100";
                    WHEN "110110" => table_l5_uid303_vecTranslateTest_q <= "0010100010";
                    WHEN "110111" => table_l5_uid303_vecTranslateTest_q <= "0010100111";
                    WHEN "111000" => table_l5_uid303_vecTranslateTest_q <= "0101101101";
                    WHEN "111001" => table_l5_uid303_vecTranslateTest_q <= "0101110011";
                    WHEN "111010" => table_l5_uid303_vecTranslateTest_q <= "0110011000";
                    WHEN "111011" => table_l5_uid303_vecTranslateTest_q <= "0110011101";
                    WHEN "111100" => table_l5_uid303_vecTranslateTest_q <= "1011000000";
                    WHEN "111101" => table_l5_uid303_vecTranslateTest_q <= "1011000101";
                    WHEN "111110" => table_l5_uid303_vecTranslateTest_q <= "1011101010";
                    WHEN "111111" => table_l5_uid303_vecTranslateTest_q <= "1011101111";
                    WHEN OTHERS => -- unreachable
                                   table_l5_uid303_vecTranslateTest_q <= (others => '-');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- os_uid305_vecTranslateTest(BITJOIN,304)@17
    os_uid305_vecTranslateTest_q <= table_l5_uid304_vecTranslateTest_q & table_l5_uid303_vecTranslateTest_q;

    -- lev1_a0_uid316_vecTranslateTest(ADD,315)@17 + 1
    lev1_a0_uid316_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 20 => os_uid305_vecTranslateTest_q(19)) & os_uid305_vecTranslateTest_q));
    lev1_a0_uid316_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 14 => os_uid310_vecTranslateTest_q(13)) & os_uid310_vecTranslateTest_q));
    lev1_a0_uid316_vecTranslateTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            lev1_a0_uid316_vecTranslateTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                lev1_a0_uid316_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0_uid316_vecTranslateTest_a) + SIGNED(lev1_a0_uid316_vecTranslateTest_b));
            END IF;
        END IF;
    END PROCESS;
    lev1_a0_uid316_vecTranslateTest_q <= lev1_a0_uid316_vecTranslateTest_o(20 downto 0);

    -- lev2_a0_uid317_vecTranslateTest(ADD,316)@18
    lev2_a0_uid317_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 21 => lev1_a0_uid316_vecTranslateTest_q(20)) & lev1_a0_uid316_vecTranslateTest_q));
    lev2_a0_uid317_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 8 => table_l15_uid313_vecTranslateTest_q(7)) & table_l15_uid313_vecTranslateTest_q));
    lev2_a0_uid317_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(lev2_a0_uid317_vecTranslateTest_a) + SIGNED(lev2_a0_uid317_vecTranslateTest_b));
    lev2_a0_uid317_vecTranslateTest_q <= lev2_a0_uid317_vecTranslateTest_o(21 downto 0);

    -- atanRes_uid318_vecTranslateTest(BITSELECT,317)@18
    atanRes_uid318_vecTranslateTest_in <= lev2_a0_uid317_vecTranslateTest_q(19 downto 0);
    atanRes_uid318_vecTranslateTest_b <= atanRes_uid318_vecTranslateTest_in(19 downto 3);

    -- redist6_atanRes_uid318_vecTranslateTest_b_1(DELAY,408)
    redist6_atanRes_uid318_vecTranslateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => atanRes_uid318_vecTranslateTest_b, xout => redist6_atanRes_uid318_vecTranslateTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- xNotZero_uid17_vecTranslateTest(LOGICAL,16)@0 + 1
    xNotZero_uid17_vecTranslateTest_qi <= "1" WHEN x /= "0000000000000000" ELSE "0";
    xNotZero_uid17_vecTranslateTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xNotZero_uid17_vecTranslateTest_qi, xout => xNotZero_uid17_vecTranslateTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist50_xNotZero_uid17_vecTranslateTest_q_19(DELAY,452)
    redist50_xNotZero_uid17_vecTranslateTest_q_19 : dspba_delay
    GENERIC MAP ( width => 1, depth => 18, reset_kind => "ASYNC" )
    PORT MAP ( xin => xNotZero_uid17_vecTranslateTest_q, xout => redist50_xNotZero_uid17_vecTranslateTest_q_19_q, ena => en(0), clk => clk, aclr => areset );

    -- xZero_uid18_vecTranslateTest(LOGICAL,17)@19
    xZero_uid18_vecTranslateTest_q <= not (redist50_xNotZero_uid17_vecTranslateTest_q_19_q);

    -- yNotZero_uid15_vecTranslateTest(LOGICAL,14)@0 + 1
    yNotZero_uid15_vecTranslateTest_qi <= "1" WHEN y /= "0000000000000000" ELSE "0";
    yNotZero_uid15_vecTranslateTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yNotZero_uid15_vecTranslateTest_qi, xout => yNotZero_uid15_vecTranslateTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist51_yNotZero_uid15_vecTranslateTest_q_19(DELAY,453)
    redist51_yNotZero_uid15_vecTranslateTest_q_19 : dspba_delay
    GENERIC MAP ( width => 1, depth => 18, reset_kind => "ASYNC" )
    PORT MAP ( xin => yNotZero_uid15_vecTranslateTest_q, xout => redist51_yNotZero_uid15_vecTranslateTest_q_19_q, ena => en(0), clk => clk, aclr => areset );

    -- yZero_uid16_vecTranslateTest(LOGICAL,15)@19
    yZero_uid16_vecTranslateTest_q <= not (redist51_yNotZero_uid15_vecTranslateTest_q_19_q);

    -- concXZeroYZero_uid325_vecTranslateTest(BITJOIN,324)@19
    concXZeroYZero_uid325_vecTranslateTest_q <= xZero_uid18_vecTranslateTest_q & yZero_uid16_vecTranslateTest_q;

    -- atanResPostExc_uid326_vecTranslateTest(MUX,325)@19
    atanResPostExc_uid326_vecTranslateTest_s <= concXZeroYZero_uid325_vecTranslateTest_q;
    atanResPostExc_uid326_vecTranslateTest_combproc: PROCESS (atanResPostExc_uid326_vecTranslateTest_s, en, redist6_atanRes_uid318_vecTranslateTest_b_1_q, cstZeroOutFormat_uid319_vecTranslateTest_q, constPio2P2u_mergedSignalTM_uid323_vecTranslateTest_q)
    BEGIN
        CASE (atanResPostExc_uid326_vecTranslateTest_s) IS
            WHEN "00" => atanResPostExc_uid326_vecTranslateTest_q <= redist6_atanRes_uid318_vecTranslateTest_b_1_q;
            WHEN "01" => atanResPostExc_uid326_vecTranslateTest_q <= cstZeroOutFormat_uid319_vecTranslateTest_q;
            WHEN "10" => atanResPostExc_uid326_vecTranslateTest_q <= constPio2P2u_mergedSignalTM_uid323_vecTranslateTest_q;
            WHEN "11" => atanResPostExc_uid326_vecTranslateTest_q <= cstZeroOutFormat_uid319_vecTranslateTest_q;
            WHEN OTHERS => atanResPostExc_uid326_vecTranslateTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist55_signX_uid7_vecTranslateTest_b_19(DELAY,457)
    redist55_signX_uid7_vecTranslateTest_b_19 : dspba_delay
    GENERIC MAP ( width => 1, depth => 19, reset_kind => "ASYNC" )
    PORT MAP ( xin => signX_uid7_vecTranslateTest_b, xout => redist55_signX_uid7_vecTranslateTest_b_19_q, ena => en(0), clk => clk, aclr => areset );

    -- redist54_signY_uid8_vecTranslateTest_b_19(DELAY,456)
    redist54_signY_uid8_vecTranslateTest_b_19 : dspba_delay
    GENERIC MAP ( width => 1, depth => 19, reset_kind => "ASYNC" )
    PORT MAP ( xin => signY_uid8_vecTranslateTest_b, xout => redist54_signY_uid8_vecTranslateTest_b_19_q, ena => en(0), clk => clk, aclr => areset );

    -- concSigns_uid327_vecTranslateTest(BITJOIN,326)@19
    concSigns_uid327_vecTranslateTest_q <= redist55_signX_uid7_vecTranslateTest_b_19_q & redist54_signY_uid8_vecTranslateTest_b_19_q;

    -- secondOperand_uid334_vecTranslateTest(MUX,333)@19 + 1
    secondOperand_uid334_vecTranslateTest_s <= concSigns_uid327_vecTranslateTest_q;
    secondOperand_uid334_vecTranslateTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            secondOperand_uid334_vecTranslateTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE (secondOperand_uid334_vecTranslateTest_s) IS
                    WHEN "00" => secondOperand_uid334_vecTranslateTest_q <= constantZeroOutFormat_uid330_vecTranslateTest_q;
                    WHEN "01" => secondOperand_uid334_vecTranslateTest_q <= atanResPostExc_uid326_vecTranslateTest_q;
                    WHEN "10" => secondOperand_uid334_vecTranslateTest_q <= atanResPostExc_uid326_vecTranslateTest_q;
                    WHEN "11" => secondOperand_uid334_vecTranslateTest_q <= constPi_uid329_vecTranslateTest_q;
                    WHEN OTHERS => secondOperand_uid334_vecTranslateTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- constPiP2u_uid328_vecTranslateTest(CONSTANT,327)
    constPiP2u_uid328_vecTranslateTest_q <= "11001001000100011";

    -- constantZeroOutFormatP2u_uid331_vecTranslateTest(CONSTANT,330)
    constantZeroOutFormatP2u_uid331_vecTranslateTest_q <= "00000000000000100";

    -- firstOperand_uid333_vecTranslateTest(MUX,332)@19 + 1
    firstOperand_uid333_vecTranslateTest_s <= concSigns_uid327_vecTranslateTest_q;
    firstOperand_uid333_vecTranslateTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            firstOperand_uid333_vecTranslateTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE (firstOperand_uid333_vecTranslateTest_s) IS
                    WHEN "00" => firstOperand_uid333_vecTranslateTest_q <= atanResPostExc_uid326_vecTranslateTest_q;
                    WHEN "01" => firstOperand_uid333_vecTranslateTest_q <= constantZeroOutFormatP2u_uid331_vecTranslateTest_q;
                    WHEN "10" => firstOperand_uid333_vecTranslateTest_q <= constPiP2u_uid328_vecTranslateTest_q;
                    WHEN "11" => firstOperand_uid333_vecTranslateTest_q <= atanResPostExc_uid326_vecTranslateTest_q;
                    WHEN OTHERS => firstOperand_uid333_vecTranslateTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- outResExtended_uid335_vecTranslateTest(SUB,334)@20
    outResExtended_uid335_vecTranslateTest_a <= STD_LOGIC_VECTOR("0" & firstOperand_uid333_vecTranslateTest_q);
    outResExtended_uid335_vecTranslateTest_b <= STD_LOGIC_VECTOR("0" & secondOperand_uid334_vecTranslateTest_q);
    outResExtended_uid335_vecTranslateTest_o <= STD_LOGIC_VECTOR(UNSIGNED(outResExtended_uid335_vecTranslateTest_a) - UNSIGNED(outResExtended_uid335_vecTranslateTest_b));
    outResExtended_uid335_vecTranslateTest_q <= outResExtended_uid335_vecTranslateTest_o(17 downto 0);

    -- atanResPostRR_uid336_vecTranslateTest(BITSELECT,335)@20
    atanResPostRR_uid336_vecTranslateTest_b <= STD_LOGIC_VECTOR(outResExtended_uid335_vecTranslateTest_q(17 downto 2));

    -- redist5_atanResPostRR_uid336_vecTranslateTest_b_2(DELAY,407)
    redist5_atanResPostRR_uid336_vecTranslateTest_b_2 : dspba_delay
    GENERIC MAP ( width => 16, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => atanResPostRR_uid336_vecTranslateTest_b, xout => redist5_atanResPostRR_uid336_vecTranslateTest_b_2_q, ena => en(0), clk => clk, aclr => areset );

    -- xOut(GPOUT,4)@22
    q <= redist5_atanResPostRR_uid336_vecTranslateTest_b_2_q;
    r <= outMag_uid344_vecTranslateTest_b(14 downto 0);

END normal;
