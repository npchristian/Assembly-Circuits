--------------------------------------------
-- Module Name: two_digits_counter_on_2_7segment_display
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

Entity two_digits_counter_on_2_7segment_display Is
port (
		clkin : in STD_LOGIC;
		reset : in STD_LOGIC;
		cnt_reset : in STD_LOGIC;
		enable : in STD_LOGIC;
		locked : out STD_LOGIC;
		an : out STD_LOGIC_VECTOR(7 downto 0);
		seg : out STD_LOGIC_VECTOR(6 downto 0)
	);
end two_digits_counter_on_2_7segment_display;

Architecture behavior of two_digits_counter_on_2_7segment_display Is
-- The following code must appear in the VHDL architecture header:
------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
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

-- COMP_TAG_END ------ End COMPONENT Declaration ------------
Component clk_divider_1hz_behavior Is
port (
		clk : in STD_LOGIC;
		reset : in STD_LOGIC;
		enable : in STD_LOGIC;
		q : out STD_LOGIC
	);
end component;

------------- Beg Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT c_counter_binary_0
  PORT (
    clk : IN STD_LOGIC;
    ce : IN STD_LOGIC;
    sclr : IN STD_LOGIC;
    thresh0 : OUT STD_LOGIC;
    q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END COMPONENT;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

Component clk_divider_about_500hz_refresh_rate_2display Is
port(
		clk 		: in STD_LOGIC;
		rst 		: in STD_LOGIC;
		an1			: out STD_LOGIC;
		an0			: out STD_LOGIC
	);
end component;

Component two_bcd_2_7segment_display Is
port (
		lsn : in STD_LOGIC_VECTOR(3 downto 0);
		msn : in STD_LOGIC_VECTOR(3 downto 0);
		an : in STD_LOGIC;
		seg : out STD_LOGIC_VECTOR(6 downto 0)
	);
end component;

Signal m_lsn : STD_LOGIC_VECTOR(3 downto 0) := "0000";
Signal m_msn : STD_LOGIC_VECTOR(3 downto 0) := "0000";
Signal an_int : STD_LOGIC_VECTOR(7 downto 0) := "00000000";

Signal clk_1hz : STD_LOGIC := '0';
Signal clk : STD_LOGIC := '0';
Signal an0 : STD_LOGIC := '0';
Signal an1 : STD_LOGIC := '0';
Signal thresh0 : STD_LOGIC := '0';

begin
-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.
------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
    U1 : clk_5MHz
      port map
       (-- Clock in ports
        CLK_IN1 => clkin,
        -- Clock out ports
        CLK_OUT1 => clk,
        -- Status and control signals
        RESET  => reset,
        LOCKED => locked);
-- INST_TAG_END ------ End INSTANTIATION Template ------------
		
	U2: clk_divider_1hz_behavior PORT MAP(
		clk => clk,
		reset => ,
		enable => ,
		q => 
	);

	-- The following code must appear in the VHDL architecture
    -- body. Substitute your own instance name and net names.
    
    ------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
    U3 : c_counter_binary_0
      PORT MAP (
        clk => ,
        ce => ,
        sclr => ,
        thresh0 => ,
        q => 
      );
    -- INST_TAG_END ------ End INSTANTIATION Template ------------

    -- The following code must appear in the VHDL architecture
    -- body. Substitute your own instance name and net names.
    
    ------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
    U4 : c_counter_binary_0
      PORT MAP (
        clk => ,
        ce => ,
        sclr =>,
        thresh0 => open,
        q =>
      );
    -- INST_TAG_END ------ End INSTANTIATION Template ------------
    
	U7:  clk_divider_about_500hz_refresh_rate_2display PORT MAP(
		clk => ,
		rst => ,
		an0 => ,
		an1 => 
	);

	U8:  two_bcd_2_7segment_display PORT MAP(
		lsn => ,
		msn => ,
		an => , --Again, I am assigning an0 since I am assuming it is a one bit input to U8. Parimal said an(0).
		seg => 
	);
	
    an <= an_int;
    
    process (reset) 
    begin
    
        if (reset = '1') then
            an_int <= "11111111";
        else
            an_int <= "111111" & an1 & an0;
        end if;
    
    end process;
end behavior;