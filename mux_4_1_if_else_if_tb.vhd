--------------------------------------------
-- Module Name: mux_4_1_if_else_if_tb
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

Entity mux_4_1_if_else_if_tb Is
end mux_4_1_if_else_if_tb;

Architecture behavior of mux_4_1_if_else_if_tb Is
Component mux_4_1_if_else_if Is
port(
		channel  : in STD_LOGIC_VECTOR(3 downto 0);
		sel		 : in STD_LOGIC_VECTOR(1 downto 0);
		Q	 	 : out STD_LOGIC
	);
end component;
	
	signal channel : STD_LOGIC_VECTOR(3 downto 0);
	signal sel	: STD_LOGIC_VECTOR(1 downto 0);
	signal Q : STD_LOGIC;

begin
	DUT:  mux_4_1_if_else_if PORT MAP (
			channel => channel,
			sel => sel,
			Q => Q
		 );
		 
	process
	begin
		channel <= X"5"; sel <= "00";
		
	    wait for 5 ns; sel <= "01";
	    wait for 5 ns; sel <= "10";
	    wait for 5 ns; sel <= "11";
	    wait for 5 ns; sel <= "00";
		wait for 5 ns; channel <= X"a";
	    wait for 5 ns; sel <= "01";
	    wait for 5 ns; sel <= "10";
	    wait for 5 ns; sel <= "11";
	    wait for 5 ns; sel <= "00";
		
	end process;
end behavior;