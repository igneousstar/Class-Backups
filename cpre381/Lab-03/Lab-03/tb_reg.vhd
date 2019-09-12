library IEEE;
use IEEE.std_logic_1164.all;

entity tb_reg is
  generic(gCLK_HPER   : time := 50 ns);
end tb_reg;

architecture behavior of tb_reg is
  
  -- Calculate the clock period as twice the half-period
  constant cCLK_PER  : time := gCLK_HPER * 2;


  component n_bit_reg
	generic(N : integer := 32);
	port(	i_CLK   : in std_logic;
		i_RST	: in std_logic;
		i_WE	: in std_logic;
		i_reg  : in std_logic_vector(N-1 downto 0);
		o_reg  : out std_logic_vector(N-1 downto 0));
  end component;

  -- Temporary signals to connect to the dff component.
  signal s_CLK, s_RST  : std_logic;
  signal s_D, s_Q : std_logic_vector(31 downto 0);
  signal s_WE : std_logic;

begin

  DUT: n_bit_reg
  generic map(32)
  port map(i_CLK => s_CLK, 
           i_RST => s_RST,
           i_WE  => s_WE,
           i_reg   => s_D,
           o_reg   => s_Q);

  -- This process sets the clock value (low for gCLK_HPER, then high
  -- for gCLK_HPER). Absent a "wait" command, processes restart 
  -- at the beginning once they have reached the final statement.
  P_CLK: process
  begin
    s_CLK <= '0';
    wait for gCLK_HPER;
    s_CLK <= '1';
    wait for gCLK_HPER;
  end process;
  
  -- Testbench process  
  P_TB: process
  begin
    -- Reset the FF
    s_RST <= '1';
    s_WE  <= '1';
    s_D   <= "00000000000000000000000000000000";
    wait for cCLK_PER;

    -- Store '1'
    s_RST <= '0';
    s_WE  <= '1';
    s_D   <= "11111111111111111111111111111111";
    wait for cCLK_PER;  

    -- Keep '1'
    s_RST <= '0';
    s_WE  <= '0';
    s_D   <= "11001100110011001100110011001100";
    wait for cCLK_PER;  

    -- Store '0'    
    s_RST <= '0';
    s_WE  <= '1';
    s_D   <= "00110011001100110011001100110011";
    wait for cCLK_PER;  

    -- Keep '0'
    s_RST <= '0';
    s_WE  <= '0';
    s_D   <= "10101010101010101010101010101010";
    wait for cCLK_PER;  

    wait;
  end process;
  
end behavior;