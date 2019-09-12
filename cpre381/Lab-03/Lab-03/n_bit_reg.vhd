library IEEE;
use IEEE.std_logic_1164.all;

--------------------------------------------------------------

entity n_bit_reg is 
	generic(N : integer := 32);
	port(	i_CLK   : in std_logic;
		i_RST	: in std_logic;
		i_WE	: in std_logic;
		i_reg  : in std_logic_vector(N-1 downto 0);
		o_reg  : out std_logic_vector(N-1 downto 0));
end n_bit_reg;

---------------------------------------------------------------

architecture structure of n_bit_reg is 

component dff is 
  port(i_CLK        : in std_logic;     -- Clock input
       i_RST        : in std_logic;     -- Reset input
       i_WE         : in std_logic;     -- Write enable input
       i_D          : in std_logic;     -- Data value input
       o_Q          : out std_logic);   -- Data value output
end component dff;

---------------------------------------------------------------

begin

G1: for i in 0 to N-1 generate
  dff_i: dff
    port map(i_Clk => i_Clk,
		i_RST => i_RST,
		i_WE => i_WE,
		i_D => i_reg(i),
		o_Q => o_reg(i));


end generate;

end structure;
