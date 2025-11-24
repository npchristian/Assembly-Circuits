--------------------------------------------
-- Module Name: rca_dataflow_tb
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

use STD.textio.all;
use IEEE.STD_LOGIC_textio.all;

library UNISIM;
use UNISIM.VComponents.all;

Entity rca_dataflow_tb Is
end rca_dataflow_tb;

Architecture behavior of rca_dataflow_tb Is
	Component rca_dataflow
	port(
		a  	 : in STD_LOGIC_VECTOR (3 downto 0);
		b  	 : in STD_LOGIC_VECTOR (3 downto 0);
		cin  : in STD_LOGIC;
		s 	 : out STD_LOGIC_VECTOR (3 downto 0);
		cout : out STD_LOGIC
	);
	End Component;
	
	Signal a : STD_LOGIC_VECTOR (3 downto 0);
	Signal b : STD_LOGIC_VECTOR (3 downto 0);
	Signal c : STD_LOGIC;
	Signal s_int : STD_LOGIC_VECTOR (3 downto 0);
	Signal cout : STD_LOGIC;

		
begin
	DUT:  rca_dataflow PORT MAP (
			a => a,
			b => b,
			cin => c,
			s => s_int,
			cout => cout
		 );
		 
	process
			
	begin
		
		 a <= "0100";
		 b <= "1010"; 
		 c <= '0'; 
		wait for 10	ns;
		a <= "0101";
		b <= "0100";
		C <= '0';
		wait for 10	ns;
		a <= "1010";
		b <= "0111";
		C <= '0';
		wait for 10	ns;
		a <= "1100";
		b <= "0110";
		C <= '0';
		wait for 10	ns;
		a <= "0011";
		b <= "0101";
		C <= '1';
		wait for 10	ns;
		a <= "1001";
		b <= "1000";
		C <= '0';
		wait for 10	ns;
		a <= "1110";
		b <= "0001";
		C <= '1';
		
		
		wait;
		
	end process;
end behavior;