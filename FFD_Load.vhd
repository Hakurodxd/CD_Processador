--FlipFlopD

library ieee;
use ieee.std_logic_1164.all;

ENTITY FlipFlopD IS
PORT(D, clk, ld : in std_logic;
	Q : out std_logic);
END;

ARCHITECTURE behav OF FlipFlopD IS

BEGIN
	PROCESS (D, clk, ld)
	BEGIN
		IF (rising_edge(clk) AND D = '1' AND ld = '1') THEN
			Q<='1';
		ELSIF (rising_edge(clk) AND D = '0' AND ld = '1') THEN
			Q<='0';
		END IF;
	END PROCESS ;
END;
