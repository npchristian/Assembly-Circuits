--------------------------------------------
-- Module Name: tutorial
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity mux_2_to_1 is
port (x: in std_logic_vector(1 downto 0);
     y: in std_logic_vector(1 downto 0);
	 s: in std_logic;
	 m: out std_logic_vector(1 downto 0)
);
end mux_2_to_1;

architecture dataflow of mux_2_to_1 is
-- no need for internal signals

begin

        m(0)<=((x(0) and (not s))or(s and y(0))) after 3 ns;
        m(1)<=((x(1) and (not s))or(s and y(1))) after 3 ns;
        
end dataflow;














































--code below this line is for reference  if you want to use it you can copy it and use where ever you want 
-- to uncomment the code , select it and click on // icon on left vertical panel

------------------------------------------------------------------------------------------------
--Entity tutorial Is
--port (
--		swt : in STD_LOGIC_VECTOR(7 downto 0);
--		led : out STD_LOGIC_VECTOR(7 downto 0)
--	);
--end tutorial;

--Architecture behavior of tutorial Is

--component instance1 is port(
--		port_in : in std_logic;
--		…
--		port_out : out std_logic
--);


--Signal led_int : STD_LOGIC_VECTOR(7 downto 0) := "00000000";

--begin

--comp1 : instance1
--	port map (
--		port_in => sig_a;
--		…
--		port_out => sig_b;
--	);

--        led <= led_int;
        
--		led_int(0) <= not(swt(0));
--		led_int(1) <= swt(1) and not(swt(2));
--		led_int(2) <= swt(2) and swt(3);
--		led_int(3) <= led_int(1) or led_int(2);

--		led_int(7 downto 4) <= swt(7 downto 4);

--end behavior;
		

