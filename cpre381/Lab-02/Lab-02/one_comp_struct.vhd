library IEEE;
use IEEE.std_logic_1164.all;



entity one_comp_struct is 
	generic(N : integer := 32);
	port(	num  : in std_logic_vector(N-1 downto 0);
		comp  : out std_logic_vector(N-1 downto 0));
end one_comp_struct;

architecture structure of one_comp_struct is 

component invg is

  port(i_A          : in std_logic;
       o_F          : out std_logic);

end component invg;

begin 

-- Generate the not gates --
G1: for i in 0 to N-1 generate
  not_i: invg 
    port map(i_A  => num(i),
  	          o_F  => comp(i));
end generate;

  
end structure;