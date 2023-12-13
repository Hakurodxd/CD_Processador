--I (memoria de instruções, contem o codigo)
--array de codigos (instruçoes de 16 bits) 4 bits da operação e 12 bits das info

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY I IS
PORT(addr : in std_logic_vector(15 downto 0);
		rd : in std_logic;
		data : out std_logic_vector(15 downto 0));
END I;

ARCHITECTURE behav OF I IS

	TYPE InstructList IS ARRAY(65535 downto 0)of std_logic_vector(15 downto 0);
	
	CONSTANT instrucoes: InstructList :=
		(0 => "0000000000000000");
		
	BEGIN
	PROCESS(rd) IS
	BEGIN
		IF (rd = '1') THEN
			data <= instrucoes(conv_integer(unsigned(addr)));
		END IF;
	END PROCESS;
	
END behav;