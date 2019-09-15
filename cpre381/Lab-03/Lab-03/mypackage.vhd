library IEEE; 
use IEEE.STD_LOGIC_1164.all; 

package mypackage is 

   subtype chunk is std_logic_vector(31 downto 0); -- a byte 
        type chunk_array is array (0 to 31) of chunk; -- array of bytes 

end mypackage; 


package body mypackage is 

end mypackage; 