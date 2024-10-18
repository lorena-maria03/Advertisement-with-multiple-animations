----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2022 09:19:46 AM
-- Design Name: 
-- Module Name: refresh_rate - Behavioral
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

entity refresh_rate is
    port(clk,reset: in std_logic;
        --refresh_rate_counter: inout std_logic_vector(19 downto 0));
        refresh_activate: out std_logic_vector(1 downto 0));
end refresh_rate;

architecture Behavioral of refresh_rate is
begin
     process(clk,reset)
     variable refresh_rate_counter: std_logic_vector(19 downto 0) := (others => '0'); --CHANGES HERE
     begin
         if(reset='1') then
                refresh_rate_counter := (others=>'0'); 
         elsif(clk='1' and clk'event) then
                refresh_rate_counter := refresh_rate_counter + 1;
         end if;
        refresh_activate(1) <= refresh_rate_counter(19);
        refresh_activate(0) <= refresh_rate_counter(18);
    end process;

end Behavioral;
