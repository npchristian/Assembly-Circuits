--------------------------------------------
-- Module Name: D_latch_dataflow_tb
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use std.textio.all;
use IEEE.std_logic_textio.all;

library UNISIM;
use UNISIM.VComponents.all;

Entity D_latch_dataflow_tb Is
end D_latch_dataflow_tb;

Architecture behavior of D_latch_dataflow_tb Is
	Component D_latch_dataflow Is
port (
		d : in STD_LOGIC;
		enable : in STD_LOGIC;
		q     : out STD_LOGIC;
		q_bar : out STD_LOGIC
	);
end component;

	Signal d_int : STD_LOGIC := '0';
	Signal enable_int : STD_LOGIC := '0';
	Signal q_int : STD_LOGIC := '0';
	Signal q_bar_int : STD_LOGIC := '0';
	
begin
	uut:  D_latch_dataflow PORT MAP (
			d => d_int,
			enable => enable_int,
			q => q_int,
			q_bar => q_bar_int
		 );
		 
	process

	begin
		d_int <= '0'; enable_int <= '0';
		
	    wait for 10 ns; d_int <= '1';	-- write appropriate value(0 or 1) in('') to achive desired waveform
		
	    wait for 10 ns; enable_int <= '1';
		
	    wait for 10 ns; d_int <= '0';
	    wait for 10 ns; d_int <= '1';
		
	    wait for 10 ns; enable_int <= '0';
		
	    wait for 10 ns; d_int <= '0';
	    wait for 10 ns; d_int <= '1';
	    wait for 10 ns; d_int <= '0';
		
	    wait for 10 ns; enable_int <= '1';
		
	    wait for 10 ns; d_int <= '1';
	    wait for 10 ns; d_int <= '0';

		wait for 20 ns;
		
	end process;
end behavior;