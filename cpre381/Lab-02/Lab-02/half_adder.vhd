library IEEE;
use IEEE.std_logic_1164.all;

--------------------------------------------------------------

entity half_adder is 
	port(	A	: in std_logic;
		B	: in std_logic;
		sum	: out std_logic;
		Co	: out std_logic);
end half_adder;

--------------------------------------------------------------

architecture structure of half_adder is 

component andg2 is

  port(i_A          : in std_logic;
       i_B          : in std_logic;
       o_F          : out std_logic);

end component andg2;

component xorg2 is

  port(i_A          : in std_logic;
       i_B          : in std_logic;
       o_F          : out std_logic);

end component xorg2;

component org2 is

  port(i_A          : in std_logic;
       i_B          : in std_logic;
       o_F          : out std_logic);

end component org2;

---------------------------------------------------


begin 

xor1: xorg2
	port map( i_A => A,
			i_B => B,
			o_F => sum);

or1: andg2
	port map( i_A => A,
			i_B => B,
			o_F => Co);

end structure;



