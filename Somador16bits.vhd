--Somador16bits

library ieee;
use ieee.std_logic_1164.all;

entity Sum16 is
	port(A, B : in std_logic_vector (15 downto 0);
			cin : in std_logic;
			R: out std_logic_vector (15 downto 0));
end Sum16;

architecture behav of Sum16 is

component Scompleto is
	port(ci, a, b : in std_logic;
			co, s: out std_logic);
end component;

signal c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, cf: std_logic;

begin
	u1 : Scompleto port map (ci => cin, a => A(0), b => B(0), co => c1, s => R(0));
	u2 : Scompleto port map (ci => c1, a => A(1), b => B(1), co => c2, s => R(1));
	u3 : Scompleto port map (ci => c2, a => A(2), b => B(2), co => c3, s => R(2));
	u4 : Scompleto port map (ci => c3, a => A(3), b => B(3), co => c4, s => R(3));
	u5 : Scompleto port map (ci => c4, a => A(4), b => B(4), co => c5, s => R(4));
	u6 : Scompleto port map (ci => c5, a => A(5), b => B(5), co => c6, s => R(5));
	u7 : Scompleto port map (ci => c6, a => A(6), b => B(6), co => c7, s => R(6));
	u8 : Scompleto port map (ci => c7, a => A(7), b => B(7), co => c8, s => R(7));
	u9 : Scompleto port map (ci => c8, a => A(8), b => B(8), co => c9, s => R(8));
	u10 : Scompleto port map (ci => c9, a => A(9), b => B(9), co => c10, s => R(9));
	u11 : Scompleto port map (ci => c10, a => A(10), b => B(10), co => c11, s => R(10));
	u12 : Scompleto port map (ci => c11, a => A(11), b => B(11), co => c12, s => R(11));
	u13 : Scompleto port map (ci => c12, a => A(12), b => B(12), co => c13, s => R(12));
	u14 : Scompleto port map (ci => c13, a => A(13), b => B(13), co => c14, s => R(13));
	u15 : Scompleto port map (ci => c14, a => A(14), b => B(14), co => c15, s => R(14));
	u16 : Scompleto port map (ci => c15, a => A(15), b => B(15), co => cf, s => R(15));
end architecture behav;
