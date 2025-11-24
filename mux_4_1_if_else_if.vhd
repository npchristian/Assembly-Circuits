--------------------------------------------
-- Module Name: mux_4_1_if_else_if
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

Entity mux_4_1_if_else_if Is
port(
		channel  : in STD_LOGIC_VECTOR(3 downto 0);
		sel		 : in STD_LOGIC_VECTOR(1 downto 0);
		Q	 	 : out STD_LOGIC
	);
end mux_4_1_if_else_if;

Architecture behavior of mux_4_1_if_else_if Is
	
    signal STREAM : STD_LOGIC;	
	
begin	

	process(channel, sel) begin
		if (sel(0) = '0') then
			if (sel(1) = '0') then
				Q<= channel(0);
			elsif (sel(1) = '1') then
				Q<= channel(1);
			end if;
			
		elsif(sel(0)='1') then
			if (sel(1) = '0') then
				Q<= channel(2);
			else
				Q<= channel(3);
			end if;
		end if;
	end process;		
		
end behavior;