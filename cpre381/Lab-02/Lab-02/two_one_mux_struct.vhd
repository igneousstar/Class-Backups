library IEEE;
use IEEE.std_logic_1164.all;

entity two_one_mux_struct is

	port(	A	: in std_logic;
		B	: in std_logic;
		sel	: in std_logic;
		F	: out std_logic);
end two_one_mux_struct;

architecture structure of two_one_mux_struct is 

component andg2 is

  port(i_A          : in std_logic;
       i_B          : in std_logic;
       o_F          : out std_logic);

end component andg2;

component invg is

  port(i_A          : in std_logic;
       o_F          : out std_logic);

end component invg;
component org2 is

  port(i_A          : in std_logic;
       i_B          : in std_logic;
       o_F          : out std_logic);

end component org2;

-- Signals used for 2:1 Mux

signal a_s, b_s, s_not	: std_logic;

begin

not1: invg
	port map( i_A => sel,
			o_F => s_not);

and1: andg2
	port map( i_A => A,
			i_B => s_not,
			o_F => a_s);

and2: andg2
	port map( i_A => b,
			i_B => sel,
			o_F => b_s);

or1: org2
	port map( i_A => a_s,
			i_B => b_s,
			o_F => F);

end structure;

