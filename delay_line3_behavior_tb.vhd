--------------------------------------------
-- Module Name: delay_line3_behavior_tb
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

Entity delay_line3_behavior_tb Is
end delay_line3_behavior_tb;

Architecture behavior of delay_line3_behavior_tb Is
	Component delay_line3_behavior Is
port (
		clk : in STD_LOGIC;
		shift_in : in STD_LOGIC;
		shift_out   : out STD_LOGIC
	);
end component;

	Signal clk_int : STD_LOGIC := '0';
	Signal shift_in_int  : STD_LOGIC := '0';
	Signal shift_out_int : STD_LOGIC := '0';
	
begin
	uut:  delay_line3_behavior PORT MAP (
			clk => clk_int,		
			shift_in => shift_in_int,
			shift_out => shift_out_int
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
		shift_in_int <= '0';
		
	    wait for 20 ns; shift_in_int <= '1';-- complete code here 
	    wait for 40 ns; shift_in_int <= '0';
	    wait for 20 ns; shift_in_int <= '1';
	    wait for 40 ns; shift_in_int <= '0';-- till this line
		
		wait for 20 ns;
		
	end process;
end behavior;