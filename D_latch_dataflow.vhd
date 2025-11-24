--------------------------------------------
-- Module Name: D_latch_dataflow
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

Entity D_latch_dataflow Is
port (
		d : in STD_LOGIC;
		enable : in STD_LOGIC;
		q     : out STD_LOGIC;
		q_bar : out STD_LOGIC
	);
end D_latch_dataflow;

Architecture behavior of D_latch_dataflow Is

	signal enable_int : STD_LOGIC;
	signal d_int : STD_LOGIC;  -- both of these signals are referenced in the testbench so i included them here. 
	
begin
	d_int <= d; 
	enable_int <= enable;
	
    process (enable, d)
	begin
		if (enable = '1') then
			q <= d; 
			q_bar <= not(d);
		end if;
	end process;

end behavior;