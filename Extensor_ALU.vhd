--extensor ALU

library ieee;
use ieee.std_logic_1164.all;

ENTITY ExtensorALU IS
PORT(Ain, Bin : in std_logic_vector (15 downto 0);
		s1, s0 : in std_logic;
		Aout, Bout : out std_logic_vector (15 downto 0);
		cin : out std_logic);
END;

ARCHITECTURE behav OF ExtensorALU IS

component Abext IS
	PORT(Ai, Bi : in std_logic;
			S1, S0 : in std_logic;
			Ao, Bo : out std_logic);
end component;

component Cinext IS
	PORT(S1, S0 : in std_logic;
		Cin : out std_logic);
end component;

BEGIN
	u0: Abext port map (Ai => Ain(0), Bi => Bin(0), S1 => s1, S0 => s0, Ao => Aout(0), Bo => Bout(0));
	u1: Abext port map (Ai => Ain(1), Bi => Bin(1), S1 => s1, S0 => s0, Ao => Aout(1), Bo => Bout(1));
	u2: Abext port map (Ai => Ain(2), Bi => Bin(2), S1 => s1, S0 => s0, Ao => Aout(2), Bo => Bout(2));
	u3: Abext port map (Ai => Ain(3), Bi => Bin(3), S1 => s1, S0 => s0, Ao => Aout(3), Bo => Bout(3));
	u4: Abext port map (Ai => Ain(4), Bi => Bin(4), S1 => s1, S0 => s0, Ao => Aout(4), Bo => Bout(4));
	u5: Abext port map (Ai => Ain(5), Bi => Bin(5), S1 => s1, S0 => s0, Ao => Aout(5), Bo => Bout(5));
	u6: Abext port map (Ai => Ain(6), Bi => Bin(6), S1 => s1, S0 => s0, Ao => Aout(6), Bo => Bout(6));
	u7: Abext port map (Ai => Ain(7), Bi => Bin(7), S1 => s1, S0 => s0, Ao => Aout(7), Bo => Bout(7));
	u8: Abext port map (Ai => Ain(8), Bi => Bin(8), S1 => s1, S0 => s0, Ao => Aout(8), Bo => Bout(8));
	u9: Abext port map (Ai => Ain(9), Bi => Bin(9), S1 => s1, S0 => s0, Ao => Aout(9), Bo => Bout(9));
	u10: Abext port map (Ai => Ain(10), Bi => Bin(10), S1 => s1, S0 => s0, Ao => Aout(10), Bo => Bout(10));
	u11: Abext port map (Ai => Ain(11), Bi => Bin(11), S1 => s1, S0 => s0, Ao => Aout(11), Bo => Bout(11));
	u12: Abext port map (Ai => Ain(12), Bi => Bin(12), S1 => s1, S0 => s0, Ao => Aout(12), Bo => Bout(12));
	u13: Abext port map (Ai => Ain(13), Bi => Bin(13), S1 => s1, S0 => s0, Ao => Aout(13), Bo => Bout(13));
	u14: Abext port map (Ai => Ain(14), Bi => Bin(14), S1 => s1, S0 => s0, Ao => Aout(14), Bo => Bout(14));
	u15: Abext port map (Ai => Ain(15), Bi => Bin(15), S1 => s1, S0 => s0, Ao => Aout(15), Bo => Bout(15));
	u16: Cinext port map (S1 => s1, S0 => s0, Cin => cin);
END;

