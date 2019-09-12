library IEEE;
use IEEE.std_logic_1164.all;



entity n_bit_2_1_mux_struct is 
	generic(N : integer := 32);
	port(	n_A  : in std_logic_vector(N-1 downto 0);
		n_B  : in std_logic_vector(N-1 downto 0);
		n_F  : out std_logic_vector(N-1 downto 0);
		s    : in std_logic);
end n_bit_2_1_mux_struct;

--------------------------------------------------------------


architecture structure of n_bit_2_1_mux_struct is 

component two_one_mux_struct is
	generic(N : integer := 32);
	port(	A	: in std_logic;
		B	: in std_logic;
		sel	: in std_logic;
		F	: out std_logic);
end component two_one_mux_struct;

---------------------------------------------------------------


-- Generate all all 2 to 1 single bit muxes necesary --
begin
G1: for i in 0 to N-1 generate
  mux_i: two_one_mux_struct
    port map(A  => n_A(i),
  	        B  => n_B(i),
		sel => s,
		F => n_F(i));
end generate;

  
end structure;