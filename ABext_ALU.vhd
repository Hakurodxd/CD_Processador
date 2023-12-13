--ABext

library ieee;
use ieee.std_logic_1164.all;

ENTITY Abext IS
	PORT(Ai, Bi : in std_logic;
			S1, S0 : in std_logic;
			Ao, Bo : out std_logic);
END;

ARCHITECTURE behav OF Abext IS

BEGIN
	Ao <= Ai;
				
	Bo <= (not(S1) and not(S0) and Bi) or (not(S1) and S0 and not(Bi));

END;
