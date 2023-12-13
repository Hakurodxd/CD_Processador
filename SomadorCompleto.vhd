--SomadorCompleto

library ieee;
use ieee.std_logic_1164.all;

entity Scompleto is
	port(ci, a, b : in std_logic;
			co, s: out std_logic);
end Scompleto;

architecture behav of Scompleto is
begin
	s <= (a and b and ci) or (a and not(b) and not(ci)) or (not(a) and b and
	not(ci)) or (not(a) and not(b) and ci);
	
	co <= (a and b) or (a and not(b) and ci) or (not(a) and b and ci);
	
end architecture behav;
