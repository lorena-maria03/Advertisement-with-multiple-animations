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

entity divizor_frecventa_cresc is
  Port ( clk, reset: in std_logic;
          one_second_enable_in: in std_logic;
          one_second_enable: out std_logic);
end divizor_frecventa_cresc;

architecture Behavioral of divizor_frecventa_cresc is
begin
    process(clk, reset,one_second_enable_in)
    variable one_second_counter: std_logic_vector(26 downto 0) := (others => '0');
    variable n: integer := 26;
    begin
        if(reset='1') then
            one_second_counter := (others=>'0');
            elsif(clk='1' and clk'event) then
                one_second_counter := one_second_counter + 1;
        end if;
        if(one_second_enable_in = '1' and one_second_enable_in'event) then n := n-1; end if;
        one_second_enable <= one_second_counter(n);
 
--        if(n=19) then n := 26;
--        end if;
end process;


end Behavioral;
