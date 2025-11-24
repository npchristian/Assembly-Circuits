--------------------------------------------
-- Module Name: two_bcd_2_7segment_display
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

Entity two_bcd_2_7segment_display Is
port (
		lsn : in STD_LOGIC_VECTOR(3 downto 0);
		msn : in STD_LOGIC_VECTOR(3 downto 0);
		an : in STD_LOGIC;
		seg : out STD_LOGIC_VECTOR(6 downto 0)
	);
end two_bcd_2_7segment_display;

Architecture behavior of two_bcd_2_7segment_display Is
Component bcdto7segment_dataflow Is
port(
		x 	: in STD_LOGIC_VECTOR(3 downto 0);
		an 	: out STD_LOGIC_VECTOR(3 downto 0);
		seg : out STD_LOGIC_VECTOR(6 downto 0)
	);
end component;

Component mux_2_to_1_behavior Is
port(
		x  : in STD_LOGIC;
		y  : in STD_LOGIC;
		s  : in STD_LOGIC;		
		m  : out STD_LOGIC
	);
end component;

Signal seg0 : STD_LOGIC_VECTOR(6 downto 0) := "0000000";
Signal seg1 : STD_LOGIC_VECTOR(6 downto 0) := "0000000";

begin
	U2:  bcdto7segment_dataflow PORT MAP(
		x => lsn,
		an => open,
		seg => seg0
	);

	U3:  bcdto7segment_dataflow PORT MAP(
		x => msn,
		an => open,
		seg => seg1
	);

	U5_0:  mux_2_to_1_behavior PORT MAP(
		x  => seg0(0),
		y  => seg1(0),
		s  => an,	
		m  => seg(0)
	);	

	U5_1:  mux_2_to_1_behavior PORT MAP(
		x  => seg0(1),
		y  => seg1(1),
		s  => an,	
		m  => seg(1)
	);	
	
	U5_2:  mux_2_to_1_behavior PORT MAP(
		x  => seg0(2),
		y  => seg1(2),
		s  => an,	
		m  => seg(2)
	);

	U5_3:  mux_2_to_1_behavior PORT MAP(
		x  => seg0(3),
		y  => seg1(3),
		s  => an,	
		m  => seg(3)
	);

	U5_4:  mux_2_to_1_behavior PORT MAP(
		x  => seg0(4),
		y  => seg1(4),
		s  => an,	
		m  => seg(4)
	);		

	U5_5:  mux_2_to_1_behavior PORT MAP(
		x  => seg0(5),
		y  => seg1(5),
		s  => an,	
		m  => seg(5)
	);	

	U5_6:  mux_2_to_1_behavior PORT MAP(
		x  => seg0(6),
		y  => seg1(6),
		s  => an,	
		m  => seg(6)
	);	

end behavior;