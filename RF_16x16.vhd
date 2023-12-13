--Register File 16x16
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

ENTITY RF_16 IS
PORT(clock : in std_logic;
		W_addr, Rp_addr, Rq_addr : in std_logic_vector (3 downto 0);
		W_wr, Rp_rd, Rq_rd : in std_logic;
		W_data : std_logic_vector (15 downto 0);
		Rp_data, Rq_data : out std_logic_vector (15 downto 0));
END;

ARCHITECTURE behav OF RF_16 IS
	
	type RegFile is array (15 downto 0) of std_logic_vector (15 downto 0);
	signal RF : RegFile;
	signal wr_addr_aux : std_logic_vector (4 downto 0);
	
	component Decode_4x16 IS
    PORT (addr : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			  W_wr : IN STD_LOGIC;
			  wr_addr : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
	end component;
	
	component Reg16bits IS
	PORT(D : in std_logic_vector (15 downto 0); 
			C, load : in std_logic;
			Q : out std_logic_vector (15 downto 0));
	end component;

	component Mux16x1_16bits IS
	PORT(Dados: RegFile;
			RF_rd : in std_logic;
			addr : in std_logic_vector(3 downto 0);
			Saida: out std_logic_vector (15 downto 0));
	end component;
	
BEGIN

	u0: Decode_4x16 port map (addr => W_addr, W_wr => W_wr, wr_addr => wr_addr_aux);
	u1: Reg16bits port map (D => W_data, C => clock, load => W_wr, Q => RF(conv_integer(unsigned(wr_addr_aux))));
	u2: Mux16x1_16bits port map (Dados => RF, RF_rd => Rp_rd, addr => Rp_addr, Saida => Rp_data);
	u3: Mux16x1_16bits port map (Dados => RF, RF_rd => Rq_rd, addr => Rq_addr, Saida => Rq_data);
	
end architecture;
