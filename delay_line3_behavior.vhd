--------------------------------------------
-- Module Name: delay_line3_behavior
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

Entity delay_line3_behavior Is
port (
		clk : in STD_LOGIC;
		shift_in : in STD_LOGIC;
		shift_out   : out STD_LOGIC
	);
end delay_line3_behavior;

Architecture behavior of delay_line3_behavior Is

Signal shift_int : STD_LOGIC_VECTOR(2 downto 0) := "000";

begin

process (clk) 
begin
	
    if rising_edge(clk) then
		shift_int <= shift_int(1 downto 0) & shift_in;
		end if;
		shift_out <= shift_int(2);
end process;
end behavior;



