--------------------------------------------
-- Module Name: D_ff_with_ce_and_synch_reset_behavior
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

Entity D_ff_with_ce_and_synch_reset_behavior Is
port (
		d 	: in STD_LOGIC;
		clk : in STD_LOGIC;
		ce	: in STD_LOGIC;
		rst : in STD_LOGIC;
		q   : out STD_LOGIC
	);
end D_ff_with_ce_and_synch_reset_behavior;

Architecture behavior of D_ff_with_ce_and_synch_reset_behavior Is

begin
process (clk) 
begin
    if rising_edge(clk) then
        if (rst = '1') then-- complete the code here till line 30 
            q <= '0';
        elsif (ce = '1') then
             q <= d;
        end if;
	end if;
	
end process;
end behavior;