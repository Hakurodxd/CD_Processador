--Registrador 16 bits
library ieee;
use ieee.std_logic_1164.all;

ENTITY Reg16bits IS
PORT(D : in std_logic_vector (15 downto 0); 
		C, load : in std_logic;
		Q : out std_logic_vector (15 downto 0));
END;

ARCHITECTURE behav OF Reg16bits IS

	component FlipFlopD IS
		PORT(D, clk, ld : in std_logic;
			Q : out std_logic);
	end component;
	
BEGIN
	u0: FlipFlopD port map (D=>D(0), clk=>C, ld=>load, Q=>Q(0));
	u1: FlipFlopD port map (D=>D(1), clk=>C, ld=>load, Q=>Q(1));
	u2: FlipFlopD port map (D=>D(2), clk=>C, ld=>load, Q=>Q(2));
	u3: FlipFlopD port map (D=>D(3), clk=>C, ld=>load, Q=>Q(3));
	u4: FlipFlopD port map (D=>D(4), clk=>C, ld=>load, Q=>Q(4));
	u5: FlipFlopD port map (D=>D(5), clk=>C, ld=>load, Q=>Q(5));
	u6: FlipFlopD port map (D=>D(6), clk=>C, ld=>load, Q=>Q(6));
	u7: FlipFlopD port map (D=>D(7), clk=>C, ld=>load, Q=>Q(7));
	u8: FlipFlopD port map (D=>D(8), clk=>C, ld=>load, Q=>Q(8));
	u9: FlipFlopD port map (D=>D(9), clk=>C, ld=>load, Q=>Q(9));
	u10: FlipFlopD port map (D=>D(10), clk=>C, ld=>load, Q=>Q(10));
	u11: FlipFlopD port map (D=>D(11), clk=>C, ld=>load, Q=>Q(11));
	u12: FlipFlopD port map (D=>D(12), clk=>C, ld=>load, Q=>Q(12));
	u13: FlipFlopD port map (D=>D(13), clk=>C, ld=>load, Q=>Q(13));
	u14: FlipFlopD port map (D=>D(14), clk=>C, ld=>load, Q=>Q(14));
	u15: FlipFlopD port map (D=>D(15), clk=>C, ld=>load, Q=>Q(15));
END;
