--Banco de Registradores 256x16
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


ENTITY BancoDeReg IS
PORT(D_addr: in std_logic_vector(7 downto 0);
		D_rd, D_wr, clock: in std_logic;
		 W_data : in std_logic_vector(15 downto 0);
		 R_data : out std_logic_vector (15 downto 0));
END;

ARCHITECTURE behav OF BancoDeReg IS

	type BancoR is array (255 downto 0) of std_logic_vector (15 downto 0);

	signal Data : BancoR;
	signal wr_addr_aux : std_logic_vector (7 downto 0);

	component Reg16bits IS
	PORT(D : in std_logic_vector (15 downto 0); 
			C, load : in std_logic;
			Q : out std_logic_vector (15 downto 0));
	end component;
	
	component Decode_8x256 IS
    PORT (addr : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			D_wr : IN STD_LOGIC;
			wr_addr : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
	end component;
	
	component Mux256x1_16bits IS
	PORT(Dados: BancoR;
			D_rd : in std_logic;
			addr : in std_logic_vector(7 downto 0);
			Saida: out std_logic_vector (15 downto 0));
	end component;
	
BEGIN

	u0:Decode_8x256 port map (addr => D_addr, D_wr => D_wr, wr_addr => wr_addr_aux);
	u1:Reg16bits port map (D => W_data, C=> clock, load => D_wr, Q => Data(conv_integer(unsigned(wr_addr_aux))));
	u2:Mux256x1_16bits port map (Dados => Data, D_rd => D_rd, addr => D_addr, Saida => R_data);
	
end architecture;

