
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;


entity mux_2_to_1_behav is
    Port (x: in std_logic_vector(1 downto 0);
     y: in std_logic_vector(1 downto 0);
	 s: in std_logic;
	 m: out std_logic_vector(1 downto 0));
end mux_2_to_1_behav;

architecture behav of mux_2_to_1_behav is

 
begin
--write process to make sequential statements
mux : process(s,x,y)-- never put m_outer(output) in sensitivity list
 begin
 
  if (s = '0')then

 --write logic here

   else
 --write logic here



   end if;  
   
end process;

end behav;
