----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2022 02:37:58 PM
-- Design Name: 
-- Module Name: animatie_1 - Behavioral
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


--ANIMTIE 

entity animatie_7 is
  Port ( clk,reset,one_second_enable: in std_logic;
         mode: in std_logic_vector(2 downto 0);
         out_1: out std_logic_vector(4 downto 0);       
         out_2: out std_logic_vector(4 downto 0);       
         out_3: out std_logic_vector(4 downto 0);       
         out_4: out std_logic_vector(4 downto 0)       
  );
end animatie_7;

architecture Behavioral of animatie_7 is

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

type mem_lit is array(31 downto 0) of std_logic_vector(4 downto 0);  
constant litera: mem_lit :=
(
        0 =>      "00000",  --0
        1 =>      "00001",--1
		2 =>	  "00010",  --2
		3 =>	  "00011" ,--3
		4 =>	  "00100"  ,--4
		5 =>	  "00101",--5
		6 =>	  "00110" ,--6
		7 =>	  "00111",--7
		8 =>	  "01000",--8
		9 =>	  "01001",--9
		10 =>	  "01010",--A
        11 =>      "01011" ,--B
        12 =>      "01100"  , --C
        13 =>      "01101" ,--D
        14 =>      "01110" ,--E
        15 =>      "01111"  , --F
        16 =>      "10000"   ,--G
        17 =>      "10001"   ,--H
        18 =>      "10010" ,--I
        19 =>      "10011"  ,--J
        20 =>      "10100",--L
        21 =>      "10101" ,--N
        22 =>      "10110"  ,--O
        23 =>      "10111"  ,--P
        24 =>      "11000"   ,--R
        25 =>      "11001"   ,--S
        26 =>      "11010"   ,--T
        27 =>      "11011"  ,--U
        28 =>      "11100"   ,--V
        29 =>      "11101"   ,--X
        30 =>      "11110"  ,--Z
        31 =>      "11111" --SPATIU LIBER
);

type mem_cuv is array(43 downto 0) of std_logic_vector(4 downto 0);  
constant cuv: mem_cuv :=
(
    0 => litera(1),
    1 => litera(31),
    2 => litera(31),
    3 => litera(31),
    --
    4 => litera(31),
    5 => litera(1),
    6 => litera(31),
    7 => litera(31),
    --
    8 => litera(31),
    9 => litera(31),
    10 => litera(1),
    11 => litera(31),
    --
    12 => litera(31),
    13 => litera(31),
    14 => litera(31),
    15 => litera(1),
    --
    16 => litera(20),
    17 => litera(31),
    18 => litera(31),
    19 => litera(1),
    --
    20 => litera(31),
    21 => litera(20),
    22 => litera(31),
    23 => litera(1),
    --
    24 => litera(31),
    25 => litera(31),
    26 => litera(20),
    27 => litera(1),
    --
    28 => litera(1),
    29 => litera(31),
    30 => litera(20),
    31 => litera(1),
    --
    32 => litera(31),
    33 => litera(1),
    34 => litera(20),
    35 => litera(1),
    --
    36 => litera(20),
    37 => litera(1),
    38 => litera(20),
    39 => litera(1),
    --
    40 => litera(1),
    41 => litera(31),
    42 => litera(31),
    43 => litera(31)
);


begin

     process(clk,reset,one_second_enable,mode)
   variable i: integer := 0;
   variable j: integer := 0;
   begin
       if(reset='1')then
            i := 0;
            out_1 <= litera(31);
            out_2 <= litera(31);
            out_3 <= litera(31);
            out_4 <= litera(31);
      elsif(mode="110")then
       if(one_second_enable='1' and one_second_enable'event)then
                out_1 <= cuv(i);
                out_2 <= cuv(i+1);
                out_3 <= cuv(i+2);
                out_4 <= cuv(i+3);
            if(i>=40) then i := 0;
            end if;
            i := i+4;
        end if;
       end if;         
    end process;
     
end Behavioral;
