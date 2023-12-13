--Jumper (somador que faz o jump do PC)
--utilizar o sum16 como componente

library ieee;
use ieee.std_logic_1164.all;

entity Jump is
	port(A, B : in std_logic_vector (15 downto 0);
			R: out std_logic_vector (15 downto 0));
end Jump;

architecture behav of Jump is

signal Aaux : std_logic_vector(15 downto 0);

component sum16 is
	port(A, B : in std_logic_vector (15 downto 0);
			cin : in std_logic;
			R: out std_logic_vector (15 downto 0));
end component;

begin
	u0: sum16 port map (A => A, B => "1111111111111110", cin => '1', R => Aaux);
	u1: sum16 port map (A => Aaux, B => B, cin => '0', R => R);
end architecture behav;
