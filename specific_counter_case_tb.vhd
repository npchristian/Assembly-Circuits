--------------------------------------------
-- Module Name: specific_counter_case_tb
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

use std.textio.all;
use IEEE.std_logic_textio.all;

library UNISIM;
use UNISIM.VComponents.all;

Entity specific_counter_case_tb Is
end specific_counter_case_tb;

Architecture behavior of specific_counter_case_tb Is
Component specific_counter_case Is
port (
		clk		: in STD_LOGIC;
		enable	: in STD_LOGIC;
		reset   : in STD_LOGIC;
		count   : out STD_LOGIC_VECTOR(2 downto 0)
	);
end component;

	signal clk : STD_LOGIC := '0';
	signal reset : STD_LOGIC := '0';
	signal enable : STD_LOGIC := '0';
	signal count : STD_LOGIC_VECTOR(2 downto 0) := "000";
	
begin
	DUT:  specific_counter_case PORT MAP (
			clk => clk,
			enable => enable,
			reset => reset,
			count => count
		 );

	process
		variable n : integer := 0;
	begin
		clk <= '0';
		
		for n in 0 to 127 loop       
	  
		  wait for 5 ns;
		  clk <= not(clk);
		  
		end loop;
	end process;		 
		 
	process
	    variable s : line;
		variable k : integer := 1;
		variable i : std_logic_vector(3 downto 0) := "0001";
		
	begin
		reset <= '0'; enable <= '0';
		
		if (clk'event and clk = '1') then
			wait for 5 ns; write (s, string'("enable = ")); write (s, enable); write (s, string'(" reset = ")); write (s, reset); write (s, string'(" count = ")); write (s, count); 
			writeline (output, s);
		end if;
		enable <= '1';
		
		for k in 0 to 6 loop
			i := i + '1';
			if (clk'event and clk = '1') then
				wait for 5 ns; write (s, string'("enable = ")); write (s, enable); write (s, string'(" reset = ")); write (s, reset); write (s, string'(" count = ")); write (s, count); 
				writeline (output, s);
			end if;
		end loop;
		reset <= '1';
		
		for k in 0 to 2 loop
			i := i + '1';
			if (clk'event and clk = '1') then
				wait for 5 ns; write (s, string'("enable = ")); write (s, enable); write (s, string'(" reset = ")); write (s, reset); write (s, string'(" count = ")); write (s, count); 
				writeline (output, s);
			end if;
		end loop;
		enable <= '0'; reset <= '0';
		
		for k in 0 to 2 loop
			i := i + '1';
			if (clk'event and clk = '1') then
				wait for 5 ns; write (s, string'("enable = ")); write (s, enable); write (s, string'(" reset = ")); write (s, reset); write (s, string'(" count = ")); write (s, count); 
				writeline (output, s);
			end if;
		end loop;
		enable <= '1';
		
		for k in 0 to 6 loop
			i := i + '1';
			if (clk'event and clk = '1') then
				wait for 5 ns; write (s, string'("enable = ")); write (s, enable); write (s, string'(" reset = ")); write (s, reset); write (s, string'(" count = ")); write (s, count); 
				writeline (output, s);
			end if;
		end loop;
		
		write (s, string'("Simulation Done!")); 
		writeline (output, s);
        
        wait; 
	end process;
end behavior;