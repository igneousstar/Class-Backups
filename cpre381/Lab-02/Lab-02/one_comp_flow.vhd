library IEEE;
use IEEE.std_logic_1164.all;


entity one_comp_flow is 
	generic(N : integer := 32);
	port(	num  : in std_logic_vector(N-1 downto 0);
		comp  : out std_logic_vector(N-1 downto 0));
end one_comp_flow;

architecture dataflow of one_comp_flow is
begin 


G1: for i in 0 to N-1 generate
 
	comp(i) <= not num(i);

end generate;

end dataflow; 