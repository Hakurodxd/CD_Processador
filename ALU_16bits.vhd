--ALU 16 bits (Soma, Subtração e pass through)

library ieee;
use ieee.std_logic_1164.all;

ENTITY ALU IS
PORT(Ai, Bi : in std_logic_vector (15 downto 0);
		clock : in std_logic;
		S1, S0 : in std_logic;
		--over : out std_logic (saida caso seja necessario para vefiricar o overflow, lembrar de colocar o mesmo no somador pro 'cf')
		Result : out std_logic_vector (15 downto 0));
END;

ARCHITECTURE behav OF ALU IS

	signal Cinaux : std_logic;
	signal Aaux, Baux, Raux : std_logic_vector (15 downto 0);

	component ExtensorALU IS
	PORT(Ain, Bin : in std_logic_vector (15 downto 0);
			s1, s0 : in std_logic;
			Aout, Bout : out std_logic_vector (15 downto 0);
			cin : out std_logic);
	end component;
	
	component Sum16 is
	port(A, B : in std_logic_vector (15 downto 0);
			cin : in std_logic;
			R: out std_logic_vector (15 downto 0));
	end component;
	
	component Reg16bits IS
	PORT(D : in std_logic_vector (15 downto 0); 
			C, load : in std_logic;
			Q : out std_logic_vector (15 downto 0));
	end component;

BEGIN

	u0: ExtensorALU port map (Ain => Ai, Bin => Bi, s1 => S1, s0 => S0, Aout => Aaux, Bout => Baux, cin => Cinaux);
	u1: Sum16 port map (A => Aaux, B => Baux, cin => Cinaux, R => Raux);
	u2: Reg16bits port map (D => Raux, C => clock, load => '1', Q => Result);

END;
