--RF mux 16x1
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

package MuxTypes2 is
    type RegFile is array (15 downto 0) of std_logic_vector(15 downto 0);
end package MuxTypes2;

use work.MuxTypes2.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

ENTITY Mux16x1_16bits IS
PORT(Dados: RegFile;
		RF_rd : in std_logic;
		addr : in std_logic_vector(3 downto 0);
		Saida: out std_logic_vector (15 downto 0));
END;

ARCHITECTURE behav OF Mux16x1_16bits IS

BEGIN

	process (RF_rd, addr)
		begin
			for i in 0 to 15 loop
            if RF_rd = '1' and addr = conv_std_logic_vector(i, 8) then
                Saida <= Dados(i);
            end if;
        end loop;
	end process;
	
END;
