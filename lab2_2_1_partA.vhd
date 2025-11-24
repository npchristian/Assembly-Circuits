--------------------------------------------
-- Module Name: lab2_2_1_partA
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

Entity lab2_2_1_partA Is
port(
		v 		: in STD_LOGIC_VECTOR (3 downto 0);
		z 		: out STD_LOGIC;
		m_out 	: out STD_LOGIC_VECTOR (3 downto 0)
	);
end lab2_2_1_partA;

Architecture behavior of lab2_2_1_partA Is
	Component comparator_dataflow
	port (
		v : in STD_LOGIC_VECTOR(3 downto 0);
		z : out STD_LOGIC
		);	
	End Component;

	Component lab2_circuitA_dataflow
	port (
		v_in 	: in STD_LOGIC_VECTOR(2 downto 0);
		v_out 	: out STD_LOGIC_VECTOR(2 downto 0)
		);	
	End Component;

	Component mux_2_to_1_behavior
	port (
		x 	: in STD_LOGIC;
		y 	: in STD_LOGIC;
		s	: in STD_LOGIC;
		m	: out STD_LOGIC
		);	
	End Component;
	
	Signal z_int : STD_LOGIC := '0';	
	Signal m_int : STD_LOGIC_VECTOR (2 downto 0);
	Signal v_out : STD_LOGIC_VECTOR (2 downto 0);
		
begin
    z <= z_int;
    	
	U1:  comparator_dataflow PORT MAP (
			v => v,
			z => z_int
		 );		
		 
	U2:  lab2_circuitA_dataflow PORT MAP (
			v_in => v(2 downto 0),
			v_out => v_out
		 );	
		 
	U3:  mux_2_to_1_behavior PORT MAP (
			x => v(3),
			y => '0',
			s => z_int,
			m => m_out(3)
		 );	
		 
	U4:  mux_2_to_1_behavior PORT MAP (
			x => v(2),
			y => v_out(2),
			s => z_int,
			m => m_out(2)
		 );	
		 
	U5:  mux_2_to_1_behavior PORT MAP (
			x => v(1),
			y => v_out(1),
			s => z_int,
			m => m_out(1)
		 );	
		 
	U6:  mux_2_to_1_behavior PORT MAP (
			x => v(0),	
			y => v_out(0),
			s => z_int,
			m => m_out(0)
		 );	
		 
end behavior;