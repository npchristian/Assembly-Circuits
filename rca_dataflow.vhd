--------------------------------------------
-- Module Name: rca_dataflow
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


library UNISIM;
use UNISIM.VComponents.all;

Entity rca_dataflow Is
port(
		a  	 : in STD_LOGIC_VECTOR (3 downto 0);
		b  	 : in STD_LOGIC_VECTOR (3 downto 0);
		cin  : in STD_LOGIC;
		s 	 : out STD_LOGIC_VECTOR (3 downto 0);
		cout : out STD_LOGIC
	);
end rca_dataflow;

Architecture behavior of rca_dataflow Is
	
signal cin_int : std_logic_vector(3 downto 0);
signal sum:std_logic_vector(4 downto 0);

begin
	cin_int<= "000" & cin;
	sum<=(('0' & a)+('0' & b) + (cin_int));
	s<= sum(3 downto 0);
	cout<= sum(4); 

end behavior;