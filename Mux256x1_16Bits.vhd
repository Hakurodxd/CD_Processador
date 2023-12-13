--Mux 256x1 16bits
library ieee;
use ieee.std_logic_1164.all;

package MuxTypes is
    type BancoR is array (255 downto 0) of std_logic_vector(15 downto 0);
end package MuxTypes;

use work.MuxTypes.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

ENTITY Mux256x1_16bits IS
PORT(Dados: BancoR;
		D_rd : in std_logic;
		addr : in std_logic_vector(7 downto 0);
		Saida: out std_logic_vector (15 downto 0));
END;

ARCHITECTURE behav OF Mux256x1_16bits IS

BEGIN

	process (D_rd, addr)
		begin
			for i in 0 to 255 loop
            if D_rd = '1' and addr = conv_std_logic_vector(i, 8) then
                Saida <= Dados(i);
            end if;
        end loop;
	end process;
	
END;
