library IEEE;
use IEEE.std_logic_1164.all;

--------------------------------------------------------------

entity n_bit_adder_struct is 
	generic(N : integer := 32);
	port(	C_in   : in std_logic;
		n_A  : in std_logic_vector(N-1 downto 0);
		n_B  : in std_logic_vector(N-1 downto 0);
		n_sum  : out std_logic_vector(N-1 downto 0);
		C_out  : out std_logic);
end n_bit_adder_struct;

--------------------------------------------------------------
architecture structure of n_bit_adder_struct is 

component full_adder is 
	port(	A	: in std_logic;
		B	: in std_logic;
		Ci	: in std_logic;
		sum	: out std_logic;
		Co	: out std_logic);
end component full_adder;

signal n_C : std_logic_vector(N-1 downto 0);

--------------------------------------------------

begin

adder1: full_adder
	port map( A => n_A(0),
			B => n_B(0),
			Ci => C_in,
			sum => n_sum(0),
			Co => n_C(0));

G1: for i in 1 to N-1 generate
  full_adder_i: full_adder
    port map(A  => n_A(i),
  	        B  => n_B(i), 
		Ci => n_C(i-1),
		sum => n_sum(i),
		Co => n_C(i));
end generate;

C_out <= n_C(N-1);
  
end structure;