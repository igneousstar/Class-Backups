-------------------------------------------------------------------------
-- Taylor Burton
-- CprE 381
-- Iowa State University
-------------------------------------------------------------------------


-- Einstein.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This is used to calculate energey in gigajouls using
-- E = mc^2
--
-- NOTES:
-- 29 Aug 2019
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;




Entity Einstein is

	port(iCLK	: in std_logic; 
	     m		: in integer;
	     GJ		: out integer);

end Einstein;

architecture structure of Einstein is
  
  -- and Multiplier.vhd

  component Multiplier
    port(iCLK           : in std_logic;
         iA             : in integer;
         iB             : in integer;
         oC             : out integer);
  end component;

  constant c : integer := 9487;

  -- Signals to store c*c, extra step that is not practical 
  signal csq : integer;


begin

  g_Mult1: Multiplier
    port MAP(iCLK             => iCLK,
             iA               => c,
             iB               => c,
             oC               => csq);

  g_Mult2: Multiplier
    port MAP(iCLK             => iCLK,
             iA               => csq,
             iB               => m,
             oC               => GJ);
end structure;
