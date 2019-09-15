library IEEE;
use IEEE.std_logic_1164.all;

--------------------------------------------------------------

entity add_sub is 
	generic(N : integer := 32);
	port(	n_A  : in std_logic_vector(N-1 downto 0);
		n_B  : in std_logic_vector(N-1 downto 0);
		n_result  : out std_logic_vector(N-1 downto 0);
		sel	  : in std_logic);
end add_sub;

--------------------------------------------------------------

architecture structure of add_sub is

-- Declare the component we are going to instantiate --
component one_comp_struct
  generic(N : integer := 32);
	port(	num  : in std_logic_vector(N-1 downto 0);
		comp  : out std_logic_vector(N-1 downto 0));
end component;

component n_bit_2_1_mux_flow
	generic(N : integer := 32);
	port(	n_A  : in std_logic_vector(N-1 downto 0);
		n_B  : in std_logic_vector(N-1 downto 0);
		n_F  : out std_logic_vector(N-1 downto 0);
		s    : in std_logic);
end component;

component n_bit_adder_flow
	generic(N : integer := 32);
	port(	n_A  : in std_logic_vector(N-1 downto 0);
		n_B  : in std_logic_vector(N-1 downto 0);
		i_C  : in std_logic;
		n_sum  : out std_logic_vector(N-1 downto 0));
end component;

-------------- Signals -------------------

signal B_comp, B_muxed : std_logic_vector(N-1 downto 0);

------------------------------------

begin

------- Devices to be tested -------
adder: n_bit_adder_flow
  generic map(N)
	port map(n_A => n_A,
		n_B => B_muxed,
		i_C => sel,
		n_sum => n_result);

one_comp: one_comp_struct
  generic map(N)
	port map(num => n_B,
		comp => B_comp);

mux: n_bit_2_1_mux_flow
  generic map(N)
	port map(n_A => n_B,
		n_B => B_comp,
		n_F => B_muxed,
		s => sel);

end structure;
