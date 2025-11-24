
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;


entity and_gate is
    Port (a: in std_logic;
          b: in std_logic;
          c: out std_logic);
end and_gate;

architecture dataflow of and_gate is

begin

   c<=(a and b);

end dataflow;
