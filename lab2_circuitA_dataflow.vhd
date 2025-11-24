--------------------------------------------
-- Module Name: lab2_circuitA_dataflow
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

Entity lab2_circuitA_dataflow Is
port(
		v_in  : in STD_LOGIC_VECTOR (2 downto 0);
		v_out : out STD_LOGIC_VECTOR (2 downto 0)
	);
end lab2_circuitA_dataflow;

Architecture behavior of lab2_circuitA_dataflow Is

begin
		v_out(0) <= (v_in(2) and v_in(0)) or (v_in(1) and v_in(0));
		v_out(1) <= (v_in(2) and not(v_in(1)));
		v_out(2) <= (v_in(2) and v_in(1));
end behavior;