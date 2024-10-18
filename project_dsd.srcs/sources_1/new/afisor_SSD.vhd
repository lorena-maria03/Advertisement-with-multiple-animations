----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/04/2022 06:10:41 PM
-- Design Name: 
-- Module Name: afisor_SSD - Behavioral
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

entity afisor_SSD is
  Port (    clk :in std_logic;
            --reset :in std_logic;
           n0: std_logic_vector(4 downto 0);
           n1: std_logic_vector(4 downto 0);
           n2: std_logic_vector(4 downto 0);
           n3: std_logic_vector(4 downto 0);
           anode: out std_logic_vector(3 downto 0);
           cathode: out std_logic_vector(6 downto 0)
           );
end afisor_SSD;

architecture Behavioral of afisor_SSD is

component mux_4_1 is
  Port ( I0 :in std_logic_vector(4 downto 0);
         I1 :in std_logic_vector(4 downto 0);
         I2 :in std_logic_vector(4 downto 0);
         I3 :in std_logic_vector(4 downto 0);
         sel: in std_logic_vector(1 downto 0);
         iesire: out std_logic_vector(4 downto 0)           
        );
end component;

component mux_4_1_4b is
  Port ( I0 :in std_logic_vector(3 downto 0);
         I1 :in std_logic_vector(3 downto 0);
         I2 :in std_logic_vector(3 downto 0);
         I3 :in std_logic_vector(3 downto 0);
         sel: in std_logic_vector(1 downto 0);
         iesire: out std_logic_vector(3 downto 0)           
        );
end component;

component decod_alf
    Port ( intrare: in std_logic_vector(4 downto 0);
         iesire: out std_logic_vector(6 downto 0)
        );
end component;

component refresh_rate
    port(clk,reset: in std_logic;
        refresh_activate: out std_logic_vector(1 downto 0)
        );
end component;

signal refr_rate_temp: std_logic_vector(1 downto 0);
signal output_mux: std_logic_vector(4 downto 0);

begin
    C1: refresh_rate port map(clk,'0',refr_rate_temp);
    C2: mux_4_1 port map (n0,n1,n2,n3,refr_rate_temp, output_mux);
    C3: decod_alf port map(output_mux, cathode);
    C4: mux_4_1_4b port map ("1110","1101","1011","0111", refr_rate_temp, anode);
end Behavioral;
