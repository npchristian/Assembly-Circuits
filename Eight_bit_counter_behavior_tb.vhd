--------------------------------------------
-- Module Name: Eight_bit_counter_with_T_flop_behave_tb
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

Entity Eight_bit_counter_behave_tb Is
end Eight_bit_counter_behave_tb;

Architecture behavior of Eight_bit_counter_behave_tb Is
	Component Eight_bit_counter_behave Is
port (
		clk : in STD_LOGIC;
		enable : in STD_LOGIC;
		clear_n : in STD_LOGIC;
		count_out   : out STD_LOGIC_VECTOR(7 downto 0)
	);
end component;

	Signal clk_int : STD_LOGIC := '0';
	Signal enable_int : STD_LOGIC := '0';
	Signal clear_n_int : STD_LOGIC := '0';
	Signal count_out_int : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
	
begin
	uut:  Eight_bit_counter_behave PORT MAP (
			clk => clk_int,		
			enable => enable_int,
			clear_n => clear_n_int,
			count_out => count_out_int
		 );

	process
		variable k : integer := 0;
	begin
		clk_int <= '0';
		
		for k in 0 to 127 loop       
	  
		  wait for 5 ns;
		  clk_int <= not(clk_int);
		  
		end loop;
	end process;
		 
	process
	begin
		enable_int <= '0'; clear_n_int <= '0';
		
	    wait for 20 ns; enable_int <= '1';-- complete code here through line 59
		wait for 20 ns; clear_n_int <= '1';
		wait for 40 ns; enable_int <= '0';
		wait for 20 ns; enable_int <= '1';
		wait for 20 ns; clear_n_int <= '0';
		wait for 20 ns; clear_n_int <= '1';

		wait for 40 ns;
		
	end process;
end behavior;