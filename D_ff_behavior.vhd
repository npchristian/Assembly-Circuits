--------------------------------------------
-- Module Name: D_ff_behavior
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

Entity D_ff_behavior Is
port (
		d 	: in STD_LOGIC;
		clk : in STD_LOGIC;
		q   : out STD_LOGIC
	);
end D_ff_behavior;

Architecture behavior of D_ff_behavior Is

begin
process (clk) 
begin

	if rising_edge(clk) then
		q <= d;-- write your logic here. that is on every rising edge input port is assigned to output port
	end if;
	
end process;
end behavior;