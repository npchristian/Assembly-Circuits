--------------------------------------------
-- Module Name: D_ff_with_ce_and_synch_reset_behavior_tb
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use std.textio.all;
use IEEE.std_logic_textio.all;

library UNISIM;
use UNISIM.VComponents.all;

Entity D_ff_with_ce_and_synch_reset_behavior_tb Is
end D_ff_with_ce_and_synch_reset_behavior_tb;

Architecture behavior of D_ff_with_ce_and_synch_reset_behavior_tb Is
	Component D_ff_with_ce_and_synch_reset_behavior Is
port (
		d 	: in STD_LOGIC;
		clk : in STD_LOGIC;
		ce	: in STD_LOGIC;		
		rst : in STD_LOGIC;
		q	: out STD_LOGIC
	);
end component;

	Signal d_int : STD_LOGIC := '0';
	Signal clk_int : STD_LOGIC := '0';
	Signal ce_int  : STD_LOGIC := '0';
	Signal rst_int : STD_LOGIC := '0';
	Signal q_int : STD_LOGIC := '0';
	
begin
	uut:  D_ff_with_ce_and_synch_reset_behavior PORT MAP (
			d => d_int,
			clk => clk_int,
			ce => ce_int,
			rst => rst_int,
			q => q_int
		 );

	process
		variable k : integer := 0;
	begin
		clk_int <= '0';
		
		for k in 0 to 127 loop       
	  
		  wait for 10 ns;
		  clk_int <= not(clk_int);
		  
		end loop;
	end process;
		 
	process
	begin
		d_int <= '0'; rst_int <= '0'; ce_int <= '0';
		
	    wait for 20 ns; d_int <= '1';-- complete code by writing appropriate value(0 or 1) in ('')
		
		wait for 40 ns; ce_int <= '1';
		wait for 20 ns; ce_int <= '0';
		
	    wait for 20 ns; d_int <= '0';
		
		wait for 20 ns; rst_int <= '1';
		wait for 20 ns; rst_int <= '0';

		wait for 40 ns; ce_int <= '1';
		wait for 20 ns; ce_int <= '0';
		
	    wait for 20 ns; d_int <= '1';

		wait for 40 ns; ce_int <= '1';
		wait for 20 ns; ce_int <= '0';
		
		wait for 20 ns;
		
	end process;
end behavior;