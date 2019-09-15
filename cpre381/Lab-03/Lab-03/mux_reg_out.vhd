--------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use work.mypackage.all;
-----------------------------------------------------


entity mux_reg_out is 
	port(	
		mux_in	: in chunk_array;
		sel	: in std_logic_vector(4 downto 0);
		mux_out : out std_logic_vector(31 downto 0));
		
end mux_reg_out;

architecture dataflow of mux_reg_out is
begin 

--------------------------------------------------------------
	with sel select 
	mux_out <=  x"00000000" when "00000",
		mux_in(1) when "00001",
		mux_in(2) when "00010",
		mux_in(3) when "00011",
		mux_in(4) when "00100",
		mux_in(5) when "00101",
		mux_in(6) when "00110",
		mux_in(7) when "00111",
		mux_in(8) when "01000",
		mux_in(9) when "01001",
		mux_in(10) when "01010",
		mux_in(11) when "01011",
		mux_in(12) when "01100",
		mux_in(13) when "01101",
		mux_in(14) when "01110",
		mux_in(15) when "01111",
		mux_in(16) when "10000",
		mux_in(17) when "10001",
		mux_in(18) when "10010",
		mux_in(19) when "10011",
		mux_in(20) when "10100",
		mux_in(21) when "10101",
		mux_in(22) when "10110",
		mux_in(23) when "10111",
		mux_in(24) when "11000",
		mux_in(25) when "11001",
		mux_in(26) when "11010",
		mux_in(27) when "11011",
		mux_in(28) when "11100",
		mux_in(29) when "11101",
		mux_in(30) when "11110",
		mux_in(31) when "11111",
		x"00000000" when others;
		


--------------------------------------------------------------

end dataflow; 