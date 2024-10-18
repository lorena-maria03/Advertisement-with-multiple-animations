----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/18/2022 06:05:58 PM
-- Design Name: 
-- Module Name: mux_4_1_decid_st - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux_4_1_decid_st is
  Port ( mode_select: in std_logic_vector(2 downto 0);
         output_1: in std_logic_vector(4 downto 0);  
         output_2: in std_logic_vector(4 downto 0);  
         output_3: in std_logic_vector(4 downto 0);  
         output_4: in std_logic_vector(4 downto 0);  
         output_5: in std_logic_vector(4 downto 0);  
         output_6: in std_logic_vector(4 downto 0);  
         output_7: in std_logic_vector(4 downto 0);  
         output_8: in std_logic_vector(4 downto 0);  
         output_9: in std_logic_vector(4 downto 0);  
         output_10: in std_logic_vector(4 downto 0);  
         output_11: in std_logic_vector(4 downto 0);  
         output_12: in std_logic_vector(4 downto 0);  
         output_13: in std_logic_vector(4 downto 0);  
         output_14: in std_logic_vector(4 downto 0);  
         output_15: in std_logic_vector(4 downto 0);  
         output_16: in std_logic_vector(4 downto 0);
         output_17: in std_logic_vector(4 downto 0);
         output_18: in std_logic_vector(4 downto 0);
         output_19: in std_logic_vector(4 downto 0);
         output_20: in std_logic_vector(4 downto 0);
         output_21: in std_logic_vector(4 downto 0);
         output_22: in std_logic_vector(4 downto 0);
         output_23: in std_logic_vector(4 downto 0);
         output_24: in std_logic_vector(4 downto 0);
         output_25: in std_logic_vector(4 downto 0);
         output_26: in std_logic_vector(4 downto 0);
         output_27: in std_logic_vector(4 downto 0);
         output_28: in std_logic_vector(4 downto 0);
         afiss_1: out std_logic_vector(4 downto 0);  
         afiss_2: out std_logic_vector(4 downto 0);  
         afiss_3: out std_logic_vector(4 downto 0);  
         afiss_4: out std_logic_vector(4 downto 0)  
  );
end mux_4_1_decid_st;

architecture Behavioral of mux_4_1_decid_st is

begin
    process(mode_select,output_1,output_2,output_3,output_4,output_5,output_6,output_7,output_8,output_9,output_10,output_11,output_12,output_13,output_14,output_15,output_16)
    begin
        case mode_select is
            when "000" =>
                afiss_4 <= output_1; 
                afiss_3 <= output_2; 
                afiss_2 <= output_3; 
                afiss_1 <= output_4; 
            when "001" =>
                afiss_4 <= output_5; 
                afiss_3 <= output_6; 
                afiss_2 <= output_7; 
                afiss_1 <= output_8;
            when "010" =>
                afiss_4 <= output_9; 
                afiss_3 <= output_10; 
                afiss_2 <= output_11; 
                afiss_1 <= output_12;
            when "011" =>
                afiss_4 <= output_13; 
                afiss_3 <= output_14; 
                afiss_2 <= output_15; 
                afiss_1 <= output_16;
            when "100" =>
                afiss_4 <= output_17; 
                afiss_3 <= output_18; 
                afiss_2 <= output_19; 
                afiss_1 <= output_20;
            when "101" =>
                afiss_4 <= output_21; 
                afiss_3 <= output_22; 
                afiss_2 <= output_23; 
                afiss_1 <= output_24;
             when "110" =>
                afiss_4 <= output_25; 
                afiss_3 <= output_26; 
                afiss_2 <= output_27; 
                afiss_1 <= output_28;
             when "111" =>
                afiss_4 <= output_1; 
                afiss_3 <= output_2; 
                afiss_2 <= output_3; 
                afiss_1 <= output_4;
            end case;
         end process;
end Behavioral;
