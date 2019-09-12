library IEEE;
use IEEE.std_logic_1164.all;

-- This is empty
entity tb_add_sub is 

end tb_add_sub;

architecture behavior of tb_add_sub is

component add_sub is 
	generic(N : integer := 32);
	port(	n_A  : in std_logic_vector(N-1 downto 0);
		n_B  : in std_logic_vector(N-1 downto 0);
		n_result  : out std_logic_vector(N-1 downto 0);
		sel	  : in std_logic);
end component;

------------ Signals for Testing --------------

signal test_A, test_B, result : std_logic_vector(31 downto 0);
signal nAdd_sub : std_logic;

------- Start Testing -------------

begin

DUT1: add_sub
  generic map(32)
	port map( n_A=> test_A,
		n_B => test_B,
		n_result => result,
		sel => nAdd_sub);

---- Start Testing ----
process

	begin
	
----------------------------------------------------------
	test_A <= "11111111111111111111111111111111";
	test_B <= "00000000000000000000000000000000";
	nAdd_sub <= '0';

	wait for 100 ns;

	nAdd_sub <= '1';

	wait for 100 ns;

-----------------------------------------------------------

	test_A <= "11111111111111111111111111111111";
	test_B <= "11111111111111111111111111111111";
	nAdd_sub <= '0';

	wait for 100 ns;

	nAdd_sub <= '1';

	wait for 100 ns;	

-------------------------------------------------------------


	test_A <= "10101010101010101010101010101010";
	test_B <= "01010101010101010101010101010101";
	nAdd_sub <= '0';

	wait for 100 ns;

	nAdd_sub <= '1';

	wait for 100 ns;	
-----------------------------------------------------------------
	
	test_A <= "11111111111111111111111111111111";
	test_B <= "00000000000000000000000000000000";

	nAdd_sub <= '0';

	wait for 100 ns;

	nAdd_sub <= '1';

	wait for 100 ns;	

------------------------------------------------------------------


	test_A <= "11111111111111111111111111111111";
	test_B <= "11111111111111111111111111111111";
	nAdd_sub <= '0';

	wait for 100 ns;

	nAdd_sub <= '1';

	wait for 100 ns;	

--------------------------------------------------------------------

	end process;



end behavior;