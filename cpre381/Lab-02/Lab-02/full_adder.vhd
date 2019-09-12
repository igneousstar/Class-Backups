library IEEE;
use IEEE.std_logic_1164.all;

--------------------------------------------------------------

entity full_adder is 
	port(	A	: in std_logic;
		B	: in std_logic;
		Ci	: in std_logic;
		sum	: out std_logic;
		Co	: out std_logic);
end full_adder;

--------------------------------------------------------------

architecture structure of full_adder is 

component half_adder is

	port(	A	: in std_logic;
		B	: in std_logic;
		sum	: out std_logic;
		Co	: out std_logic);

end component half_adder;

component org2 is

  port(i_A          : in std_logic;
       i_B          : in std_logic;
       o_F          : out std_logic);

end component org2;

signal ApB, C1, C2 : std_logic;

---------------------------------------------------


begin 

adder1: half_adder
	port map( A => A,
			B => B,
			sum => ApB,
			Co => C1);

adder2: half_adder
	port map( A => ApB,
			B => Ci,
			sum => sum,
			Co => C2);

or1: org2
	port map(i_A => C1,
			i_B => C2,
			o_F => Co);

end structure;