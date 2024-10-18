----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2022 11:05:51 PM
-- Design Name: 
-- Module Name: mux_4_1 - Behavioral
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

entity mux_4_1 is
  Port ( I0 :in std_logic_vector(4 downto 0);
         I1 :in std_logic_vector(4 downto 0);
         I2 :in std_logic_vector(4 downto 0);
         I3 :in std_logic_vector(4 downto 0);
         sel: in std_logic_vector(1 downto 0);
         iesire: out std_logic_vector(4 downto 0)           
        );
end mux_4_1;

architecture Behavioral of mux_4_1 is

begin
    process(sel,i0,i1,i2,i3)
    begin
        case sel is
            when "00" => iesire <= i0;
            when "01" => iesire <= i1;
            when "10" => iesire <= i2;
            when "11" => iesire <= i3;
        end case;
       end process;
end Behavioral;
