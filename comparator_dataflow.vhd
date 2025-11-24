--------------------------------------------
-- Module Name: comparator_dataflow
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

Entity comparator_dataflow Is
port (
		v : in STD_LOGIC_VECTOR(3 downto 0);
		z : out STD_LOGIC
	);
end comparator_dataflow;

Architecture behavior of comparator_dataflow Is

Signal v_int : STD_LOGIC_VECTOR(3 downto 0);
Signal z_int : STD_LOGIC;

begin

v_int <= v;
z <= z_int;

process (v_int)	begin	
		if (v_int > x"9") then
			z_int <= '1';
		else
			z_int <= '0';
		end if;
end process;

end behavior;