library IEEE;
use IEEE.std_logic_1164.all;

-- This is empty
entity tb_comp is 

end tb_comp;

architecture behavior of tb_comp is

-- Declare the component we are going to instantiate --
component one_comp_struct
  generic(N : integer := 32);
	port(	num  : in std_logic_vector(N-1 downto 0);
		comp  : out std_logic_vector(N-1 downto 0));
end component;

component one_comp_flow
  generic(N : integer := 32);
	port(	num  : in std_logic_vector(N-1 downto 0);
		comp  : out std_logic_vector(N-1 downto 0));
end component;

signal s_A, s_O1, s_O2  : std_logic_vector (31 downto 0);

begin

DUT1: one_comp_struct
  generic map(32)
	port map(num => s_A,
		comp => s_O1);
DUT2: one_comp_flow
  generic map(32)
	port map(num => s_A,
		comp => s_O2);

 process
  begin

    s_A <= "00000000111111110000000011111111";
    wait for 100 ns;

    s_A <= "00000000111111110000000011111111";
    wait for 100 ns;

    s_A <= "11111111111111111111111111111111";
    wait for 100 ns;

    s_A <= "00000000000000000000000000000000";
    wait for 100 ns;


  end process;
  
end behavior;

