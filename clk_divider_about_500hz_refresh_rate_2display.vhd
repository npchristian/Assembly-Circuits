--------------------------------------------
-- Module Name: clk_divider_about_500hz_refresh_rate_2display
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library UNISIM;
use UNISIM.VComponents.all;

Entity clk_divider_about_500hz_refresh_rate_2display Is
port(
		clk 		: in STD_LOGIC;
		rst 		: in STD_LOGIC;
		an1			: out STD_LOGIC;
		an0			: out STD_LOGIC
	);
end clk_divider_about_500hz_refresh_rate_2display;

Architecture behavior of clk_divider_about_500hz_refresh_rate_2display Is

signal count : STD_LOGIC_VECTOR(13 downto 0) := "00000000000000";
signal an0_int : STD_LOGIC;
signal an1_int : STD_LOGIC;

begin
    an0 <= an0_int;
    an1 <= an1_int;
        
	process (clk) begin
		if rising_edge(clk) then
			if (rst = '1') then
				an0_int <= '0';
				an1_int <= '1';
				count <= "00000000000000";
			elsif (count(13) = '1') then
			    an0_int <= not(an0_int);
			    an1_int <= not(an1_int);
				count <= "00000000000000";
		    else
				count <= count + '1';
			end if;
		end if;
	end process;
end behavior;