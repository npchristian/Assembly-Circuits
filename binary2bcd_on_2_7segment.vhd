--------------------------------------------
-- Module Name: binary2bcd_on_2_7segment
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VComponents.all;

Entity binary2bcd_on_2_7segment Is
port (
		v : in STD_LOGIC_VECTOR(3 downto 0);
		rst : in STD_LOGIC;
		clk_in : in STD_LOGIC;
		locked  : out STD_LOGIC;
		an : out STD_LOGIC_VECTOR(7 downto 0);
		seg : out STD_LOGIC_VECTOR(6 downto 0)
	);
end binary2bcd_on_2_7segment;

Architecture behavior of binary2bcd_on_2_7segment Is
Component lab2_2_1_partA Is
port(
		v 		: in STD_LOGIC_VECTOR (3 downto 0);
		z 		: out STD_LOGIC;
		m_out 	: out STD_LOGIC_VECTOR (3 downto 0)
	);
end component;

Component clk_divider_about_500hz_refresh_rate_2display Is
port(
		clk 		: in STD_LOGIC;
		rst 		: in STD_LOGIC;
		an1			: out STD_LOGIC;
		an0			: out STD_LOGIC
	);
end component;

Component two_bcd_2_7segment_display Is
port(
		lsn 		: in STD_LOGIC_VECTOR(3 downto 0);
		msn 		: in STD_LOGIC_VECTOR(3 downto 0);
		an			: in STD_LOGIC;
		seg			: out STD_LOGIC_VECTOR(6 downto 0)
	);
end component;

component clk_5MHz
port
 (-- Clock in ports
  CLK_IN1           : in     std_logic;
  -- Clock out ports
  CLK_OUT1          : out    std_logic;
  -- Status and control signals
  RESET             : in     std_logic;
  LOCKED            : out    std_logic
 );
end component;

Signal an_int : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
Signal m : STD_LOGIC_VECTOR(3 downto 0) := "0000";

Signal d_int : STD_LOGIC := '0';
Signal clk : STD_LOGIC := '0';
Signal an0 : STD_LOGIC := '0';
Signal an1 : STD_LOGIC := '0';
Signal z_int : STD_LOGIC := '0';

begin
	U1:  lab2_2_1_partA PORT MAP(
		v => v,
		z => z_int,
		m_out => m
	);

	U2:  clk_divider_about_500hz_refresh_rate_2display PORT MAP(
		clk => clk,
		rst => rst,
		an0 => an0,
		an1 => an1
	);

	U4:  two_bcd_2_7segment_display PORT MAP(
		lsn => m,
		msn => "000" & z_int,
		an => an_int(0), --was an_int but that is incorrect due to bus width mismatch. Trying an0. Parimal said it is an(0).
		seg => seg
	);	

    U3 : clk_5MHz
      port map
       (-- Clock in ports
        CLK_IN1 => clk_in,
        -- Clock out ports
        CLK_OUT1 => clk,
        -- Status and control signals
        RESET  => rst,
        LOCKED => locked);

    an <= an_int;

process (rst)
begin

	if (rst = '1') then
		an_int <= "11111111";
	else
		an_int <= "111111" & an1 & an0;
	end if;

end process;
end behavior;