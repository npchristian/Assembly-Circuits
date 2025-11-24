--------------------------------------------
-- Module Name: clk_divider_behavior
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library UNISIM;
use UNISIM.VComponents.all;

Entity clk_divider_behavior Is
port (
		clk : in STD_LOGIC;
		rst : in STD_LOGIC;
		enable : in STD_LOGIC;
		q   : out STD_LOGIC
	);
end clk_divider_behavior;

Architecture behavior of clk_divider_behavior Is

Signal count : STD_LOGIC_VECTOR(22 downto 0);
Signal q_int : STD_LOGIC;

begin

q <= q_int;

process (clk) 
begin
	
    if (clk'event and clk = '1') then
		if (rst = '1') then
			q_int <= '0';
			count <= "00000000000000000000000";
		elsif (count(22) = '1') then
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