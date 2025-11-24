--------------------------------------------
-- Module Name: Register_with_synch_reset_load_behavior_tb
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

Entity Register_with_synch_reset_load_behavior_tb Is
end Register_with_synch_reset_load_behavior_tb;

Architecture behavior of Register_with_synch_reset_load_behavior_tb Is
	Component Register_with_synch_reset_load_behavior Is
port (
		d 	: in STD_LOGIC_VECTOR(3 downto 0);
		clk : in STD_LOGIC;
		rst : in STD_LOGIC;
		load : in STD_LOGIC;
		q   : out STD_LOGIC_VECTOR(3 downto 0)
	);
end component;

	Signal d_int : STD_LOGIC_VECTOR(3 downto 0) := "0000";
	Signal clk_int : STD_LOGIC := '0';
	Signal rst_int : STD_LOGIC := '0';
	Signal load_int  : STD_LOGIC := '0';
	Signal q_int : STD_LOGIC_VECTOR(3 downto 0) := "0000";
	
begin
	uut:  Register_with_synch_reset_load_behavior PORT MAP (
			d => d_int,
			clk => clk_int,
			rst => rst_int,
			load => load_int,
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
		d_int <= "0000"; rst_int <= '0'; load_int <= '0';
		
	    wait for 20 ns; d_int <= "0101";
		
		wait for 40 ns; load_int <= '1';--complete the code here through line 75
		wait for 20 ns; load_int <= '0';
		
	    wait for 20 ns; d_int <= "1001";
		
		wait for 40 ns; load_int <= '1';
		wait for 20 ns; load_int <= '0';

		wait for 15 ns; rst_int <= '1';
		
		wait for 40 ns; load_int <= '1';
		wait for 20 ns; load_int <= '0';
		
	    wait for 25 ns; rst_int <= '0';

		wait for 40 ns; load_int <= '1';
		wait for 20 ns; load_int <= '0';
		
		wait for 20 ns;
		
	end process;
end behavior;