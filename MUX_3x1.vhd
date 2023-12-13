--Mux 3x1 16 bits

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

ENTITY Mux3x1_16bits IS
PORT(data0, data1, data2 : in std_logic_vector (15 downto 0);
		S1, S0 : in std_logic;
		dataOut: out std_logic_vector (15 downto 0));
END;

ARCHITECTURE behav OF Mux3x1_16bits IS

BEGIN

	dataOut(0) <= (data0(0) and not(S1) and not(S0))or(data1(0) and not(S1) and S0) or (data2(0) and S1 and not(S0));
	dataOut(1) <= (data0(1) and not(S1) and not(S0))or(data1(1) and not(S1) and S0) or (data2(1) and S1 and not(S0));
	dataOut(2) <= (data0(2) and not(S1) and not(S0))or(data1(2) and not(S1) and S0) or (data2(2) and S1 and not(S0));
	dataOut(3) <= (data0(3) and not(S1) and not(S0))or(data1(3) and not(S1) and S0) or (data2(3) and S1 and not(S0));
	dataOut(4) <= (data0(4) and not(S1) and not(S0))or(data1(4) and not(S1) and S0) or (data2(4) and S1 and not(S0));
	dataOut(5) <= (data0(5) and not(S1) and not(S0))or(data1(5) and not(S1) and S0) or (data2(5) and S1 and not(S0));
	dataOut(6) <= (data0(6) and not(S1) and not(S0))or(data1(6) and not(S1) and S0) or (data2(6) and S1 and not(S0));
	dataOut(7) <= (data0(7) and not(S1) and not(S0))or(data1(7) and not(S1) and S0) or (data2(7) and S1 and not(S0));
	dataOut(8) <= (data0(8) and not(S1) and not(S0))or(data1(8) and not(S1) and S0) or (data2(8) and S1 and not(S0));
	dataOut(9) <= (data0(9) and not(S1) and not(S0))or(data1(9) and not(S1) and S0) or (data2(9) and S1 and not(S0));
	dataOut(10) <= (data0(10) and not(S1) and not(S0))or(data1(10) and not(S1) and S0) or (data2(10) and S1 and not(S0));
	dataOut(11) <= (data0(11) and not(S1) and not(S0))or(data1(11) and not(S1) and S0) or (data2(11) and S1 and not(S0));
	dataOut(12) <= (data0(12) and not(S1) and not(S0))or(data1(12) and not(S1) and S0) or (data2(12) and S1 and not(S0));
	dataOut(13) <= (data0(13) and not(S1) and not(S0))or(data1(13) and not(S1) and S0) or (data2(13) and S1 and not(S0));
	dataOut(14) <= (data0(14) and not(S1) and not(S0))or(data1(14) and not(S1) and S0) or (data2(14) and S1 and not(S0));
	dataOut(15) <= (data0(15) and not(S1) and not(S0))or(data1(15) and not(S1) and S0) or (data2(15) and S1 and not(S0));

	
END;
