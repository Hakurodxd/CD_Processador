--RF decode 4x16
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

ENTITY Decode_4x16 IS
    PORT (addr : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        W_wr : IN STD_LOGIC;
        wr_addr : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END;

ARCHITECTURE behav OF Decode_4x16 IS
BEGIN
    PROCESS (addr, W_wr)
    BEGIN
		if W_wr = '1' then
			wr_addr <= addr;
		else 
			wr_addr <= (others => '0');
		end if;
    END PROCESS;
END ARCHITECTURE behav;
