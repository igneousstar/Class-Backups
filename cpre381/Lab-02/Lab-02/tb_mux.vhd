library IEEE;
use IEEE.std_logic_1164.all;

-- This is empty
entity tb_mux is 

end tb_mux;

architecture behavior of tb_mux is

-- Declare the component we are going to instantiate --

component n_bit_2_1_mux_struct
	generic(N : integer := 32);
	port(	n_A  : in std_logic_vector(N-1 downto 0);
		n_B  : in std_logic_vector(N-1 downto 0);
		n_F  : out std_logic_vector(N-1 downto 0);
		s    : in std_logic);
end component;

component n_bit_2_1_mux_flow
	generic(N : integer := 32);
	port(	n_A  : in std_logic_vector(N-1 downto 0);
		n_B  : in std_logic_vector(N-1 downto 0);
		n_F  : out std_logic_vector(N-1 downto 0);
		s    : in std_logic);
end component;

---- Signals used for testing ----
signal out_flow, out_struct, in_a, in_b  : std_logic_vector (31 downto 0);
signal s_all	: std_logic;

begin

------- Devices to be tested -------
DUT1: n_bit_2_1_mux_struct
  generic map(32)
	port map(n_A => in_a,
		n_B => in_b,
		n_F => out_struct,
		s => s_all);

DUT2: n_bit_2_1_mux_flow
  generic map(32)
	port map(n_A => in_a,
		n_B => in_b,
		n_F => out_flow,
		s => s_all);

---- Start Testing ----
process

	begin
	
	in_a <= "11001100110011001100110011001100";
	in_b <= "00110011001100110011001100110011";
	s_all <= '0';

	wait for 100 ns;

	s_all <= '1';

	wait for 100 ns;

	in_a <= "11110000111100001111000011110000";
	in_b <= "00001111000011110000111100001111";
	s_all <= '0';

	wait for 100 ns;

	s_all <= '1';

	wait for 100 ns;

	end process;
end behavior;
	