--------------------------------------------
-- Module Name: binaryto7segment
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library UNISIM;
use UNISIM.VComponents.all;

Entity binaryto7segment Is
port(
		an : out STD_LOGIC_VECTOR (7 downto 0);
		seg : out STD_LOGIC_VECTOR (6 downto 0)
	);
end binaryto7segment;

Architecture behavior of binaryto7segment Is
	Component bcdto7segment_dataflow
	port (
		x 	: in STD_LOGIC_VECTOR(3 downto 0);
		an 	: out STD_LOGIC_VECTOR(7 downto 0);
		seg : out STD_LOGIC_VECTOR(6 downto 0)
		);	
	End Component;
	
	Signal x_int : STD_LOGIC_VECTOR (3 downto 0) := "1000";
	
begin
	U1:  bcdto7segment_dataflow PORT MAP (
			x => x_int,
			an => an,
			seg => seg
		 );
 	
end behavior;