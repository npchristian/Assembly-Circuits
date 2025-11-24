--------------------------------------------
-- Module Name: add_two_values
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library UNISIM;
use UNISIM.VComponents.all;

Entity add_two_values  Is Port (
	Signal ain : in STD_LOGIC_VECTOR (3 downto 0);
	Signal bin : in STD_LOGIC_VECTOR (3 downto 0);
	Signal addition : out STD_LOGIC_VECTOR (4 downto 0)
);
end add_two_values ;

Architecture behavior of add_two_values
   signal ain_int : in STD_LOGIC_VECTOR (4 downto 0);
   signal bin_int : in STD_LOGIC_VECTOR (4 downto 0);
   
   
		
	function add_two_values_function  (signal ain_func, bin_func : in STD_LOGIC_VECTOR)
	return std_logic_vector is
        variable result : STD_LOGIC_VECTOR(4 downto 0);
	begin
	result := ain_func + bin_func; 
		return result;
	end add_two_values_function;
	
begin
    ain_int <= "0" & ain;
	bin_int <= "0" & bin;  -- single quote or double???
	
	process (ain_int, bin_int) begin	    
		addition <= add_two_values_function(ain_int, bin_int); 
	end process;
end behavior;