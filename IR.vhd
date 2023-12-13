--IR (Registra o comando atual, basicamento um registrador de 16 bits)

library ieee;
use ieee.std_logic_1164.all;

ENTITY IR IS
PORT(IR_in : in std_logic_vector (15 downto 0); 
		C, load : in std_logic;
		IR_out : out std_logic_vector (15 downto 0));
END;

ARCHITECTURE behav OF IR IS

	component FlipFlopD IS
		PORT(D, clk, ld : in std_logic;
			Q : out std_logic);
	end component;
	
BEGIN
	u0: FlipFlopD port map (D=>IR_in(0), clk=>C, ld=>load, Q=>IR_out(0));
	u1: FlipFlopD port map (D=>IR_in(1), clk=>C, ld=>load, Q=>IR_out(1));
	u2: FlipFlopD port map (D=>IR_in(2), clk=>C, ld=>load, Q=>IR_out(2));
	u3: FlipFlopD port map (D=>IR_in(3), clk=>C, ld=>load, Q=>IR_out(3));
	u4: FlipFlopD port map (D=>IR_in(4), clk=>C, ld=>load, Q=>IR_out(4));
	u5: FlipFlopD port map (D=>IR_in(5), clk=>C, ld=>load, Q=>IR_out(5));
	u6: FlipFlopD port map (D=>IR_in(6), clk=>C, ld=>load, Q=>IR_out(6));
	u7: FlipFlopD port map (D=>IR_in(7), clk=>C, ld=>load, Q=>IR_out(7));
	u8: FlipFlopD port map (D=>IR_in(8), clk=>C, ld=>load, Q=>IR_out(8));
	u9: FlipFlopD port map (D=>IR_in(9), clk=>C, ld=>load, Q=>IR_out(9));
	u10: FlipFlopD port map (D=>IR_in(10), clk=>C, ld=>load, Q=>IR_out(10));
	u11: FlipFlopD port map (D=>IR_in(11), clk=>C, ld=>load, Q=>IR_out(11));
	u12: FlipFlopD port map (D=>IR_in(12), clk=>C, ld=>load, Q=>IR_out(12));
	u13: FlipFlopD port map (D=>IR_in(13), clk=>C, ld=>load, Q=>IR_out(13));
	u14: FlipFlopD port map (D=>IR_in(14), clk=>C, ld=>load, Q=>IR_out(14));
	u15: FlipFlopD port map (D=>IR_in(15), clk=>C, ld=>load, Q=>IR_out(15));
END;
