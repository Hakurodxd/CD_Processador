--Cinext

library ieee;
use ieee.std_logic_1164.all;

ENTITY Cinext IS
	PORT(S1, S0 : in std_logic;
			Cin : out std_logic);
END;

ARCHITECTURE behav OF Cinext IS

BEGIN
	Cin <= (not(S1) and S0);
END;
