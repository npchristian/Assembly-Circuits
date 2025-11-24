--------------------------------------------
-- Module Name: SR_latch_dataflow
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

Entity SR_latch_dataflow Is
port (
		r : in STD_LOGIC;
		s : in STD_LOGIC;
		q     : out STD_LOGIC;
		q_bar : out STD_LOGIC
	);
end SR_latch_dataflow;

Architecture behavior of SR_latch_dataflow Is

	signal q_int : STD_LOGIC;
	signal q_bar_int : STD_LOGIC;
		
begin
	q_int <= q after 2ns; -- delay to circumvent parallel
	q_bar_int <= q_bar after 2ns; -- delay to circumvent parallel
	q <= not(r or q_bar) after 2ns;
	q_bar <= not(q or s) after 2ns;
	
end behavior;