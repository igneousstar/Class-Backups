library IEEE;

use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

---------------------------------------

entity n_bit_decoder is 
	port(	sel : in std_logic_vector(4 downto 0);
		o_F  : out std_logic_vector(31 downto 0));
end n_bit_decoder;

----------------------------------------


architecture dataflow of n_bit_decoder is

signal check : std_logic_vector(4 downto 0); -- variable to check input
signal temp : std_logic_vector(31 downto 0);
signal carry : std_logic;

begin 

--------------------------------------------------------------


process(sel)
 begin

	check <= "00000";
	temp <= x"00000001";
	o_F  <= x"00000000";
	carry <= '0';
	

	for i in 0 to 30 loop
		if sel = check then
			o_F <= temp;
		end if;

		---- increment check ----
		--check <= check + "00001";

		--- shift left ----
		temp(i) <= '0';
		temp(i+1) <= '1';

	end loop;

	if sel = check then
		o_F <= temp;
	end if;
	o_F <= temp;
	

end process;



--------------------------------------------------------------

end dataflow; 