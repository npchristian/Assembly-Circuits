--------------------------------------------
-- Module Name: Eight_bit_counter_with_T_flop_behave
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;

library UNISIM;
use UNISIM.VComponents.all;

Entity Eight_bit_counter_behave Is
port (
		clk : in STD_LOGIC;
		enable : in STD_LOGIC;
		clear_n : in STD_LOGIC;
		count_out   : out STD_LOGIC_VECTOR(7 downto 0)
	);
end Eight_bit_counter_behave;

Architecture behavior of Eight_bit_counter_behave Is


Signal count : unsigned(7 downto 0) := "00000000";

begin

count_out <= std_logic_vector(count);

process (clk) 
begin
    if (clear_n = '0') then-- complete the code from here through line 36
		  count <= "0000";
    		elsif rising_edge(clk) then
		  if (enable = '1') then
			count <= count + '1';
		  end if;   
    end if;  
end process;


end behavior;