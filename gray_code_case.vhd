--------------------------------------------
-- Module Name: gray_code_case
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

Entity gray_code_case Is
port (
		bcd		: in STD_LOGIC_VECTOR(3 downto 0);
		enable	: in STD_LOGIC;
		invalid : out STD_LOGIC;
		gray_code : out STD_LOGIC_VECTOR(3 downto 0)
	);
end gray_code_case;

Architecture behavior of gray_code_case Is

begin
	process (bcd, enable)
	if (enable <= '1')
		invalid <= '0';
		case bcd is
			when "0000" => gray_code <= "0000";
			when "0001" => gray_code <= "0001";
			when "0010" => gray_code <= "0011";
			when "0011" => gray_code <= "0010";
			when "0100" => gray_code <= "0110";
			when "0101" => gray_code <= "1110";
			when "0110" => gray_code <= "1010";
			when "0111" => gray_code <= "1011";
			when "1000" => gray_code <= "1001";
			when "1001" => gray_code <= "1000"; --when a bcd, led0 through led3 = graycode. 
			when others => 
				gray_code <= '1111';
				invalid <= '1'; -- when not a bcd, led0 through 3 and led4 are on. 
		end case;
	else
		invalid <= '1';
		gray_code <= "1111"; -- when enable is off, led0-4 are on
	end if;
end behavior;