--------------------------------------------
-- Module Name: clk_divider_1hz_behavior
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library UNISIM;
use UNISIM.VComponents.all;

Entity clk_divider_1hz_behavior Is
port (
		clk : in STD_LOGIC;
		reset : in STD_LOGIC;
		enable : in STD_LOGIC;
		q : out STD_LOGIC
	);
end clk_divider_1hz_behavior;

Architecture behavior of clk_divider_1hz_behavior Is
	
	Constant terminal_count : STD_LOGIC_VECTOR(22 downto 0) := "00000111101000010010000"; --I divided the original number by 10?
	Signal count : STD_LOGIC_VECTOR(22 downto 0) := "00000000000000000000000";
	Signal count_done : STD_LOGIC := '0';
	Signal q_int : STD_LOGIC := '0';

begin
     
	q <= q_int;
	
	process (count) begin
        if (count = terminal_count) then
           count_done <= '1';
        else
           count_done <= '0';
        end if;
	end process;
	
	process (clk)
	begin
		if rising_edge(clk) then
            if (reset = '1') then
                q_int <= '0';
                count <= "00000000000000000000000";
            elsif (count_done = '1') then
                q_int <= not(q_int);
                count <= "00000000000000000000000";
            elsif (enable = '1') then
                count <= count + '1';
            else
                count <= count;
            end if;
		end if;
	end process;

end behavior;