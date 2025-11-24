--------------------------------------------
-- Module Name: specific_counter_case
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

Entity specific_counter_case Is
port (
		clk		: in STD_LOGIC;
		enable	: in STD_LOGIC;
		reset   : in STD_LOGIC;
		count   : out STD_LOGIC_VECTOR(2 downto 0)
	);
end specific_counter_case;

Architecture behavior of specific_counter_case Is

Signal count_int : STD_LOGIC_VECTOR(2 downto 0);

begin
    -- in this code we are playing with count_int which is an internal signal
    -- so you should do proper assignment such that this internal value is assigned to the output.
	count <= count_int; -- like this?
    
	process(clk) begin
	-- write (process triggered by clock)
	
		if (reset = '1')
			count_int = '000';
		end if;	-- write if statement for asynchronous reset which will 
				-- reset the count_int value and assign some default value to it.
		if (rising_edge(Clk) then
			if (enable = '1')
				-- write condition for synchronous enable signal which is active high
				case count_int is
					when "000" => count_int <= "001";
					when "001" => count_int <= "011";
					when "011" => count_int <= "101";
					when "101" => count_int <= "111";
					when "111" => count_int <= "010";
					when "010" => count_int <= "000";
				end case;
				-- if enabled then write case statement which should make a counter which
				-- counts in a specific pattern(hops to specific outputs)
			end if;
		end if;
		end process;
end behavior;