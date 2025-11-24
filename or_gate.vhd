

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;


entity or_gate is
    Port (a: in std_logic;
          b: in std_logic;
          c: out std_logic);
end or_gate;

architecture dataflow of or_gate is

begin

   c<=(a or b);

end dataflow;
