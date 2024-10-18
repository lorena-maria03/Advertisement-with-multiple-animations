----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2022 11:11:09 PM
-- Design Name: 
-- Module Name: decod_alf - Behavioral
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

entity decod_alf is
  Port ( intrare: in std_logic_vector(4 downto 0);
         iesire: out std_logic_vector(6 downto 0)
        );
end decod_alf;

architecture Behavioral of decod_alf is
type memorie_1 is array (24 downto 0) of std_logic_vector(6 downto 0);
constant alfabet: memorie_1 := (
    0 => "1111111", -- Spatiu primul este dp care il punem pe 1 
    1 => "0001000", -- A
    2 => "1100000", --B
    3 => "0110001", --c 
    4 => "1000010", --d
    5 => "0110000", -- E
    6 => "0111000", --f 
    7 => "0100000", -- g 
    8 => "1101000", -- h 
    9 => "1001111", -- i 
    10 => "1000011", --j
    11 => "1111000", --k --NU 
    12 => "1110001", --l
    13 => "0101010", --m --NU 
    14 => "1101010", --n
    15 => "1000000", --o 
    16 => "0011000", --p
    17 => "1111100", --r
    18 => "0100100", --s
    19 => "1111010", --t
    20 => "1000001", --u
    21 => "1100011", --v
    22 => "1000000", --w --NU 
    23 => "1001000", --x
    24 => "0010010" --z
    --LIPSESTE Q si Y
    );
begin
    process(intrare)
    begin
        case intrare is
            when "00000" => iesire <= "0000001";
			when "00001" => iesire <= "1001111";
			when "00010" => iesire <= "0010010";
			when "00011" => iesire <= "0000110";
			when "00100" => iesire <= "1001100";
			when "00101" => iesire <= "0100100";
			when "00110" => iesire <= "0100000";
			when "00111" => iesire <= "0001111";
			when "01000" => iesire <= "0000000";
			when "01001" => iesire <= "0000100";
			when "01010" => iesire <= alfabet(1);	
            when "01011" => iesire <= alfabet(2);	
             when "01100" => iesire <= alfabet(3);
            when "01101" => iesire <= alfabet(4);
            when "01110" => iesire <= alfabet(5);
            when "01111" => iesire <= alfabet(6);
            when "10000" => iesire <= alfabet(7);
            when "10001" => iesire <= alfabet(8);
            when "10010" => iesire <= alfabet(9);
            when "10011" => iesire <= alfabet(10);
            when "10100" => iesire <= alfabet(12);
            when "10101" => iesire <= alfabet(14);
            when "10110" => iesire <= alfabet(15);
            when "10111" => iesire <= alfabet(16);
            when "11000" => iesire <= alfabet(17);
            when "11001" => iesire <= alfabet(18);
            when "11010" => iesire <= alfabet(19);
            when "11011" => iesire <= alfabet(20);
            when "11100" => iesire <= alfabet(21);
            when "11101" => iesire <= alfabet(23);
            when "11110" => iesire <= alfabet(24);
            when "11111" => iesire <= alfabet(0);

		end case;
		end process;
end architecture;