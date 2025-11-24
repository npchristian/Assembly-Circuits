
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;


entity mux_2_to_1_struct is
    Port (x_outer: in std_logic_vector(1 downto 0);
     y_outer: in std_logic_vector(1 downto 0);
	 s_outer: in std_logic;
	 m_outer: out std_logic_vector(1 downto 0));
end mux_2_to_1_struct;

architecture structural of mux_2_to_1_struct is


component and_gate is
Port (a: in std_logic;
          b: in std_logic;
          c: out std_logic
);
end component;

component or_gate is
Port (a: in std_logic;
          b: in std_logic;
          c: out std_logic
);
end component;

signal a1: std_logic;
signal a2: std_logic;
signal a3: std_logic;
signal a4: std_logic;
signal select_comp :std_logic;

 
begin

---make select complement from s_outer
select_comp<= not s_outer;

-- instantiation of and gates
and_1: and_gate port map (
a=>x_outer(0),
b=>s_outer,
c=>a1
);

-- write rest of three and gate ports
and_2: and_gate port map (
   
   
   
);

and_3: and_gate port map (
  
  
  
);

and_4: and_gate port map (



);

-- instantiation of or gates
or_1: or_gate port map (
a=>a1,
b=>a3,
c=>m_outer(0)
);
-- write or ports

or_2: or_gate port map (



);



end structural;
