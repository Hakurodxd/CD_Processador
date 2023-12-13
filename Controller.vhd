--Controller (maquina de estado que lê, decodifica e executa o comando dando as saidas pro datapath)
--incrementa o PC durante o fetch
--Fetching (registra a instrução no IR e incrementa o PC lendo a instrução do IR)
--decoding (determina a operação, apenas lê os 4 da op e determina o tipo de execução)
--executing (da as saidas pro dtapath realizar a operação)
library ieee;
use ieee.std_logic_1164.all;

entity Controller is
	port (Inst : in std_logic_vector(15 downto 0);
			clock : in std_logic;
			PC_ld, PC_clr, PC_inc, I_rd, IR_ld : out std_logic;
			D_addr : out std_logic_vector (7 downto 0);
			D_rd, D_wr : out std_logic;
			RF_W_data : out std_logic_vector (7 downto 0);
			RF_s1, RF_s0 : out std_logic;
			RF_W_addr, RF_Rp_addr, RF_Rq_addr : out std_logic_vector (3 downto 0);
			RF_W_wr, RF_Rp_rd, RF_Rq_rd : out std_logic;
			alu_s1, alu_s0 : out std_logic;
			RF_Rp_zero, Alu_overflow : in std_logic);
end Controller;

architecture behavior of Controller is

	type statetype is
	(Init, Fetch, Decode, Load, Store, Add, LoadConst, Sub, JIZ, JIO, JIZJump, JIOJump);
	
	signal currentstate: statetype;
	signal nextstate: statetype := Init;
	signal op : std_logic_vector (3 downto 0):= Inst(15 downto 12);

begin

	estado: process(clock)
	begin
		if(rising_edge(clock)) then
			currentstate <= nextstate;
		end if;
	end process;
	
	controle: process (currentstate)
	begin
		case currentstate is
			when Init =>
				PC_clr <= '1';
				nextstate <= Fetch;
			when Fetch =>
				PC_clr <= '0';
				I_rd <= '1';
				PC_inc <= '1';
				IR_ld <= '1';
				nextstate <= Decode;
				PC_ld <= '0';
				D_rd <= '0';
				D_wr <= '0';
				RF_s1 <= '0';
				RF_s0 <= '0';
				RF_W_wr <= '0';
				RF_Rp_rd <= '0';
				RF_Rq_rd <= '0';
				alu_s1 <= '0';
				alu_s0 <= '0';
			when Decode =>
				I_rd <= '0';
				PC_inc <= '0';
				IR_ld <= '0';
				case op is
					when "0000" =>
						nextstate <= Load;
					when "0001" =>
						nextstate <= Store;
					when "0010" =>
						nextstate <= Add;
					when "0011" =>
						nextstate <= LoadConst;
					when "0100" =>
						nextstate <= Sub;
					when "0101" =>
						nextstate <= JIZ;
					when "0110" =>
						nextstate <= JIO;
				end case;
			when Load =>
				D_addr <= Inst(7 downto 0);
				D_rd <= '1';
				RF_s1 <= '0';
				RF_s0 <= '1';
				RF_W_addr <= Inst(11 downto 8);
				RF_W_wr <= '1';
				nextstate <= Fetch;
			when Store =>
				D_addr <= Inst(7 downto 0);
				D_wr <= '1';
				RF_s1 <= '0';
				RF_s0 <= '0';
				RF_Rp_addr <= Inst(11 downto 8);
				RF_Rp_rd <= '1';
				nextstate <= Fetch;
			when Add =>
				RF_Rp_addr <= Inst(7 downto 4);
				RF_Rp_rd <= '1';
				RF_s1 <= '0';
				RF_s0 <= '0';
				RF_Rq_addr <= Inst(3 downto 0);
				RF_Rq_rd <= '1';
				RF_W_addr <= Inst(11 downto 8);
				RF_W_wr <= '1';
				alu_s1 <= '0';
				alu_s0 <= '1';
				nextstate <= Fetch;
			when LoadConst =>
				RF_s1 <= '1';
				RF_s0 <= '0';
				RF_W_addr <= Inst(11 downto 8);
				RF_W_wr <= '1';
				RF_W_data <= Inst(7 downto 0);
				nextstate <= Fetch;
			when Sub =>
				RF_Rp_addr <= Inst(7 downto 4);
				RF_Rp_rd <= '1';
				RF_s1 <= '0';
				RF_s0 <= '0';
				RF_Rq_addr <= Inst(3 downto 0);
				RF_Rq_rd <= '1';
				RF_W_addr <= Inst(11 downto 8);
				RF_W_wr <= '1';
				alu_s1 <= '1';
				alu_s0 <= '0';
				nextstate <= Fetch;
			when JIZ =>
				RF_Rp_addr <= Inst(11 downto 8);
				RF_Rp_rd <= '1';
				if RF_Rp_zero = '0' then
					nextstate <= Fetch;
				else
					nextstate <= JIZJump;
				end if;
			when JIZJump =>
				RF_Rp_rd <= '0';
				PC_ld <= '1';
				nextstate <= Fetch;
			when JIO =>
				if Alu_overflow = '0' then
					nextstate <= Fetch;
				else
					nextstate <= JIOJump;
				end if;
			when JIOJump =>
				PC_ld <= '1';
				nextstate <= Fetch;
		end case;
	end process;
end behavior;