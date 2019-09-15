library IEEE;
use IEEE.std_logic_1164.all;

--------------------------------------------------------------

entity n_bit_adder_flow is 
	generic(N : integer := 32);
	port(	n_A  : in std_logic_vector(N-1 downto 0);
		n_B  : in std_logic_vector(N-1 downto 0);
		i_C  : in std_logic;
		n_sum  : out std_logic_vector(N-1 downto 0));
end n_bit_adder_flow;

architecture dataflow of n_bit_adder_flow is

signal C_in	: std_logic_vector(N-1 downto 0);
begin 

--------------------------------------------------------------
C_in(0) <= (n_A(0) and n_B(0)) or (i_C and n_A(0)) or (i_C and n_B(0));

n_Sum(0) <= (n_A(0) xor n_B(0)) xor i_C; ------------ It would be good to chang this for a carry in

G1: for i in 1 to N-1 generate
 
	n_sum(i) <= (n_A(i) xor n_B(i)) xor C_in(i-1);
	C_in(i) <= (n_A(i) and n_B(i)) or (n_A(i) and C_in(i-1)) or (n_B(i) and C_in(i-1));

end generate;

--------------------------------------------------------------

end dataflow; 