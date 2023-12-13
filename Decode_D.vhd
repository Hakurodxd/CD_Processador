--decode_8x256
library ieee;
use ieee.std_logic_1164.all;

ENTITY Decode_8x256 IS
    PORT (addr : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        D_wr : IN STD_LOGIC;
        wr_addr : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END;

ARCHITECTURE behav OF Decode_8x256 IS
BEGIN
    PROCESS (addr, D_wr)
    BEGIN
		if D_wr = '1' then
			wr_addr <= addr;
		else 
			wr_addr <= (others => '0');
		end if;
    END PROCESS;
END ARCHITECTURE behav;
