library IEEE;
use IEEE.std_logic_1164.all;

--------------------------------------------------------------

entity n_bit_2_1_mux_flow is 
	generic(N : integer := 32);
	port(	n_A  : in std_logic_vector(N-1 downto 0);
		n_B  : in std_logic_vector(N-1 downto 0);
		n_F	: out std_logic_vector(N-1 downto 0);
		s    : in std_logic);
end n_bit_2_1_mux_flow;

--------------------------------------------------------------


architecture dataflow of n_bit_2_1_mux_flow is
begin 

--------------------------------------------------------------
G1: for i in 0 to N-1 generate
 
	n_F(i) <= (n_A(i) and (not s)) or (n_B(i) and s);

end generate;

--------------------------------------------------------------

end dataflow; 