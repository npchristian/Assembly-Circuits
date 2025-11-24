--------------------------------------------
-- Module Name: add_two_values
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library UNISIM;
use UNISIM.VComponents.all;

Entity add_two_values Is Port (
	Signal ain : in STD_LOGIC_VECTOR (3 downto 0);
	Signal bin : in STD_LOGIC_VECTOR (3 downto 0);
	Signal sum : out STD_LOGIC_VECTOR (4 downto 0)
	
);
end add_two_values;

Architecture behavior of add_two_values Is
	
	signal total_out : out STD_LOGIC_VECTOR (4 downto 0);
	
	procedure add_two_values_procedure (
		signal ain_int : in STD_LOGIC_VECTOR (3 downto 0); 
		signal bin_int : in STD_LOGIC_VECTOR (3 downto 0);
		signal total_out_int : out STD_LOGIC_VECTOR (4 downto 0);
	) is
	   
	begin
		total_out_int <= ('0' & ain_int) + ('0' & bin_int);
	end add_two_values_procedure;
	
begin
    
    sum <= total_out; 
 		 
	process (ain, bin)
	begin
		  add_two_values_procedure(ain, bin, total_out);
	end process;
end behavior;