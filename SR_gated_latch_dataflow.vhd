--------------------------------------------
-- Module Name: SR_gated_latch_dataflow
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

Entity SR_gated_latch_dataflow Is
port (
		r : in STD_LOGIC;
		s : in STD_LOGIC;
		enable : in STD_LOGIC;
		q     : out STD_LOGIC;
		q_bar : out STD_LOGIC
	);
end SR_gated_latch_dataflow;

Architecture behavior of SR_gated_latch_dataflow Is

	signal q_int : STD_LOGIC;
	signal q_bar_int : STD_LOGIC;
	signal r_int : STD_LOGIC;
	signal s_int : STD_LOGIC;

begin
	r_int <= r and enable after 2ns;
	s_int <= s and enable after 2ns;
	q_int <= q after 2ns;
	q_bar_int <= q_bar after 2ns;
	q <= not(r_int or q_bar) after 2ns;
	q_bar <= not(s_int or q) after 2ns;

end behavior;