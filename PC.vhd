--PC (grava a instrução atual, contando qual a instrução atual)
--contador crescente +1 começando em 0
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

ENTITY PC IS
	PORT(PC_inc, PC_clr, PC_ld, clock : in std_logic;
			Jump_PC : in std_logic_vector (15 downto 0);
			PC_out : out std_logic_vector (15 downto 0));
END PC;

ARCHITECTURE behav OF PC IS
	BEGIN 
		PROCESS(clock, PC_clr, PC_inc, PC_ld)
			VARIABLE contador: INTEGER RANGE 65535 DOWNTO 0;
				BEGIN
					IF(PC_clr = '1') THEN
						contador := 0;
					ELSIF(rising_edge(clock)) THEN
						IF(PC_ld = '1') THEN
							contador := conv_integer(Jump_PC);
						ELSIF(contador = 65535) THEN
								contador := 0;
							ELSIF(PC_inc = '1') THEN
									contador := contador + 1;
						END IF;
					END IF;
				PC_out <= conv_std_logic_vector(contador, 16);
		END PROCESS;
END;
