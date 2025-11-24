--------------------------------------------
-- Module Name: mux_2_to_1_behavior
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

Entity mux_2_to_1_behavior Is
port(
		x  : in STD_LOGIC;
		y  : in STD_LOGIC;
		s  : in STD_LOGIC;		
		m  : out STD_LOGIC
	);
end mux_2_to_1_behavior;

Architecture behavior of mux_2_to_1_behavior Is

signal m_int : STD_LOGIC := '0';

begin
    m <= m_int;
    
	process (x, y, s) begin
		if (s = '0') then
			m_int <= x;
		else
			m_int <= y;
		end if;
	end process;
end behavior;