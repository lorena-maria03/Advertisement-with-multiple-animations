----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2022 09:01:12 AM
-- Design Name: 
-- Module Name: divizor_frecventa - Behavioral
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

entity divizor_frecventa is
  Port ( clk, reset: in std_logic;
          n : in integer;
          one_second_enable: out std_logic);
end divizor_frecventa;

architecture Behavioral of divizor_frecventa is
begin
    process(clk, reset,n)
    variable one_second_counter: std_logic_vector(26 downto 0) := (others => '0');
    begin
        if(reset='1') then
            one_second_counter := (others=>'0');
            elsif(clk='1' and clk'event) then
                one_second_counter := one_second_counter + 1;
        end if;
        one_second_enable <= one_second_counter(n);
end process;


end Behavioral;

