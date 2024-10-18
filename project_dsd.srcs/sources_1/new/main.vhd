----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/27/2022 06:49:56 PM
-- Design Name: 
-- Module Name: cod_proiect - Behavioral
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cod_proiect is
  Port ( clk: in std_logic;
         reset: in std_logic;
         mode_select: in std_logic_vector(2 downto 0);
         activare_anod: out std_logic_vector(3 downto 0);
         led_out: out std_logic_vector(6 downto 0)   
            );
end cod_proiect;

architecture Behavioral of cod_proiect is

signal one_second_enable_26_b: std_logic := '0';
signal one_second_enable_25_b: std_logic := '0';
signal one_second_enable_decresc_out: std_logic := '0';
--signal one_second_enable_decresc: integer := 27;
signal refresh_activate: std_logic_vector(1 downto 0) := "00";

    
component DIVIZOR_FRECVENTA
    port(clk,reset: in std_logic;
           n: in integer;
          one_second_enable: out std_logic);
end component;

component REFRESH_RATE
    port(clk,reset: in std_logic;
        refresh_activate: out std_logic_vector(1 downto 0));
end component;

component afisor_SSD is
  Port (    clk :in std_logic;
            --reset :in std_logic;
           n0: std_logic_vector(4 downto 0);
           n1: std_logic_vector(4 downto 0);
           n2: std_logic_vector(4 downto 0);
           n3: std_logic_vector(4 downto 0);
           anode: out std_logic_vector(3 downto 0);
           cathode: out std_logic_vector(6 downto 0)
           );
end component;

component mux_4_1_decid_st is
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
end component;

    
component animatie_1 is
  Port ( clk,reset,one_second_enable: in std_logic;
         mode: in std_logic_vector(2 downto 0);
         out_1: out std_logic_vector(4 downto 0);       
         out_2: out std_logic_vector(4 downto 0);       
         out_3: out std_logic_vector(4 downto 0);       
         out_4: out std_logic_vector(4 downto 0)       
  );
end component;

component animatie_2 is
  Port ( clk,reset,one_second_enable: in std_logic;
         mode: in std_logic_vector(2 downto 0);
         out_1: out std_logic_vector(4 downto 0);       
         out_2: out std_logic_vector(4 downto 0);       
         out_3: out std_logic_vector(4 downto 0);       
         out_4: out std_logic_vector(4 downto 0)       
  );
end component;

component animatie_3 is
  Port ( clk,reset,one_second_enable: in std_logic;
         mode: in std_logic_vector(2 downto 0);
         out_1: out std_logic_vector(4 downto 0);       
         out_2: out std_logic_vector(4 downto 0);       
         out_3: out std_logic_vector(4 downto 0);       
         out_4: out std_logic_vector(4 downto 0)       
  );
end component;

component animatie_4 is
  Port ( clk,reset,one_second_enable: in std_logic;
         mode: in std_logic_vector(2 downto 0);
         out_1: out std_logic_vector(4 downto 0);       
         out_2: out std_logic_vector(4 downto 0);       
         out_3: out std_logic_vector(4 downto 0);       
         out_4: out std_logic_vector(4 downto 0)       
  );
end component;

component animatie_5 is
  Port ( clk,reset,one_second_enable: in std_logic;
         mode: in std_logic_vector(2 downto 0);
         out_1: out std_logic_vector(4 downto 0);       
         out_2: out std_logic_vector(4 downto 0);       
         out_3: out std_logic_vector(4 downto 0);       
         out_4: out std_logic_vector(4 downto 0)       
  );
end component;

component animatie_6 is
  Port ( clk,reset,one_second_enable: in std_logic;
         mode: in std_logic_vector(2 downto 0);
         out_1: out std_logic_vector(4 downto 0);       
         out_2: out std_logic_vector(4 downto 0);       
         out_3: out std_logic_vector(4 downto 0);       
         out_4: out std_logic_vector(4 downto 0)       
  );
end component;

component animatie_7 is
  Port ( clk,reset,one_second_enable: in std_logic;
         mode: in std_logic_vector(2 downto 0);
         out_1: out std_logic_vector(4 downto 0);       
         out_2: out std_logic_vector(4 downto 0);       
         out_3: out std_logic_vector(4 downto 0);       
         out_4: out std_logic_vector(4 downto 0)       
  );
end component;

signal aux_1: std_logic_vector(4 downto 0);
signal aux_2: std_logic_vector(4 downto 0);
signal aux_3: std_logic_vector(4 downto 0);
signal aux_4: std_logic_vector(4 downto 0);
signal aux_5: std_logic_vector(4 downto 0);
signal aux_6: std_logic_vector(4 downto 0);
signal aux_7: std_logic_vector(4 downto 0);
signal aux_8: std_logic_vector(4 downto 0);
signal aux_9: std_logic_vector(4 downto 0);
signal aux_10: std_logic_vector(4 downto 0);
signal aux_11: std_logic_vector(4 downto 0);
signal aux_12: std_logic_vector(4 downto 0);
signal aux_13: std_logic_vector(4 downto 0);
signal aux_14: std_logic_vector(4 downto 0);
signal aux_15: std_logic_vector(4 downto 0);
signal aux_16: std_logic_vector(4 downto 0);
signal aux_17: std_logic_vector(4 downto 0);
signal aux_18: std_logic_vector(4 downto 0);
signal aux_19: std_logic_vector(4 downto 0);
signal aux_20: std_logic_vector(4 downto 0);
signal aux_21: std_logic_vector(4 downto 0);
signal aux_22: std_logic_vector(4 downto 0);
signal aux_23: std_logic_vector(4 downto 0);
signal aux_24: std_logic_vector(4 downto 0);
signal aux_25: std_logic_vector(4 downto 0);
signal aux_26: std_logic_vector(4 downto 0);
signal aux_27: std_logic_vector(4 downto 0);
signal aux_28: std_logic_vector(4 downto 0);
signal afis_1: std_logic_vector(4 downto 0);
signal afis_2: std_logic_vector(4 downto 0);
signal afis_3: std_logic_vector(4 downto 0);
signal afis_4: std_logic_vector(4 downto 0);
signal aux_mode_select_0: std_logic := mode_select(0);
signal aux_mode_select_1: std_logic := mode_select(1);
signal aux_mode_select: integer := CONV_INTEGER(mode_select);
begin
    Div_frec_26: DIVIZOR_FRECVENTA port map(clk, reset,26, one_second_enable_26_b);
    Div_frec_25: DIVIZOR_FRECVENTA port map(clk, reset,25, one_second_enable_25_b);
    
    Refr_rate: REFRESH_RATE port map(clk, reset, refresh_activate); 
   
    ANIMATIEE_1: animatie_1 port map(clk,reset,one_second_enable_26_b,mode_select,aux_1,aux_2,aux_3,aux_4);
    ANIMATIEE_2: animatie_2 port map(clk,reset,one_second_enable_25_b,mode_select,aux_5,aux_6,aux_7,aux_8);
    ANIMATIEE_3: animatie_3 port map(clk,reset,one_second_enable_25_b,mode_select,aux_9,aux_10,aux_11,aux_12);
    ANIMATIEE_4: animatie_4 port map(clk,reset,one_second_enable_25_b,mode_select,aux_13,aux_14,aux_15,aux_16);
    ANIMATIEE_5: animatie_5 port map(clk,reset,one_second_enable_26_b,mode_select,aux_17,aux_18,aux_19,aux_20);
    ANIMATIEE_6: animatie_6 port map(clk,reset,one_second_enable_25_b,mode_select,aux_21,aux_22,aux_23,aux_24);
    ANIMATIEE_7: animatie_7 port map(clk,reset,one_second_enable_25_b,mode_select,aux_25,aux_26,aux_27,aux_28);
    
    DECID_ANIM: mux_4_1_decid_st port map(mode_select,aux_1,aux_2,aux_3,aux_4,aux_5,aux_6,aux_7,aux_8,aux_9,aux_10,aux_11,aux_12,aux_13,aux_14,aux_15,aux_16,aux_17,aux_18,aux_19,aux_20,aux_21,aux_22,aux_23,aux_24,aux_25,aux_26,aux_27,aux_28,afis_4,afis_3,afis_2,afis_1);
    
    AFISEAZA: afisor_SSD port map(clk, afis_4,afis_3,afis_2,afis_1,activare_anod,led_out);
end Behavioral;

