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
-- we have to declare components which we are going to use
-- clock component with name clk_5MHz 
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

-- this component takes 5 mhz clock and divides into 1 hz clock
Component clk_divider_1hz_behavior Is
port (
		clk : in STD_LOGIC;
		reset : in STD_LOGIC;
		enable : in STD_LOGIC;
		q : out STD_LOGIC
	);
end component;

-- this is a one digit binary counter which counts 0 till 9 
COMPONENT c_counter_binary_0
  PORT (
    clk : IN STD_LOGIC;
    ce : IN STD_LOGIC;
    sclr : IN STD_LOGIC;
    thresh0 : OUT STD_LOGIC;
    q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END COMPONENT;

-- this component generates anode signals at 500 Hz frequency which are then connected to 7 segment displays anode pins
Component clk_divider_about_500hz_refresh_rate_2display Is
port(
		clk 		: in STD_LOGIC;
		rst 		: in STD_LOGIC;
		an1			: out STD_LOGIC;
		an0			: out STD_LOGIC;
		an2			: out STD_LOGIC;
        an3         : out STD_LOGIC
	);
end component;

-- this component converts 4 bit BCD number into its 7 segment Led driver code pattern
Component bcdto7segment_dataflow Is
port (
		x : in STD_LOGIC_VECTOR(3 downto 0);
		seg : out STD_LOGIC_VECTOR(6 downto 0)
	);
end component;

-- this signal is used in line 181-192 as interin signal to transfer counter's count value to bcdto7segment_dataflow to convert
Signal x_int : STD_LOGIC_VECTOR(3 downto 0) := "0000";

-- internal counters count values
Signal count_0 : STD_LOGIC_VECTOR(3 downto 0) := "0000";
Signal count_1 : STD_LOGIC_VECTOR(3 downto 0) := "0000";
Signal count_2 : STD_LOGIC_VECTOR(3 downto 0) := "0000";
Signal count_3 : STD_LOGIC_VECTOR(3 downto 0) := "0000";

Signal an_int : STD_LOGIC_VECTOR(7 downto 0) := "00000000";

Signal clk_1hz : STD_LOGIC := '0';
Signal clk : STD_LOGIC := '0';
Signal an0 : STD_LOGIC := '0';
Signal an1 : STD_LOGIC := '0';
Signal an2 : STD_LOGIC := '0';
Signal an3 : STD_LOGIC := '0';
Signal thresh0_to1 : STD_LOGIC := '0';
Signal thresh1_to2 : STD_LOGIC := '0';
Signal thresh2_to3 : STD_LOGIC := '0';



begin
-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.
------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
    U1 : clk_5MHz
      port map
       (-- Clock in ports
        CLK_IN1 => clkin,
        -- Clock out ports
        CLK_OUT1 =>  clk,
        -- Status and control signals
        RESET  => reset,
        LOCKED => locked);
-- INST_TAG_END ------ End INSTANTIATION Template ------------
		
	U2: clk_divider_1hz_behavior PORT MAP(
		clk => clk,
		reset => reset,
		enable => enable,
		q => clk_1hz
	);

	-- The following code must appear in the VHDL architecture
    -- body. Substitute your own instance name and net names.
    
    ------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
    U3 : c_counter_binary_0
      PORT MAP (
        clk => clk_1hz,
        ce => enable,
        sclr => cnt_reset,
        thresh0 =>thresh0_to1,
        q => count_0
      );
    
    U4 : c_counter_binary_0
      PORT MAP (
        clk => clk_1hz,
        ce => thresh0_to1,
        sclr => cnt_reset,
        thresh0 => thresh1_to2,
        q => count_1
      );
  
    U5 : c_counter_binary_0
          PORT MAP (
            clk => clk_1hz,
            ce => thresh1_to2,
            sclr =>cnt_reset,
            thresh0 => thresh2_to3,
            q => count_2
          );
          
      U6 : c_counter_binary_0
            PORT MAP (
              clk => clk_1hz,
              ce => thresh2_to3,
              sclr => cnt_reset,
              thresh0 => open,
              q => count_3
            );
    
-- this process assigns count 0,1,2,3 values which are output counts from counter to an interim signal x_int    
    process(clk)
    begin
    if(an0='0')then
     x_int<=count_0;
    elsif(an1='0')then
       x_int<=count_1;
    elsif(an2='0')then
        x_int<=count_2;
    elsif(an3='0')then
       x_int<=count_3;    
    end if;
  end process;  
  
  U8:  bcdto7segment_dataflow PORT MAP(
          x =>x_int,
          seg => seg 
      );
       
 -- enable generatoin process the digit counters are enabled when the lower digit count overflows for example counter 0 
 -- will overflow at 9 so we should enable counter 1 at that time and counter 2 should be enabled when counte0  and 1 have count 99 and counter3
 -- should be enabled when lower 3 counts are 999 
 process(clk)
 begin
         if(count_0="1001")then
            thresh0_to1<='1';
          else
            thresh0_to1<='0';
         end if;   
          if((count_1="1001") and (count_0="1001"))then
            thresh1_to2<='1';
          else
            thresh1_to2<='0';
         end if;
         if((count_2="0101") and (count_1="1001") and (count_0="1001"))then -- edited count_2 to 59
            thresh2_to3<='1';
          else
            thresh2_to3<='0';
         end if; 
     end process;        
     
    U7:  clk_divider_about_500hz_refresh_rate_2display PORT MAP(
             clk =>clk ,
             rst =>reset ,
             an0 =>an0 ,
             an1 => an1,
             an2 =>an2 ,
             an3 => an3
         );
 -- this process assigns the anode enable signals so that at any point of time only one of an0.1.2.3 is low so only one display is on   
    process (reset, clk) 
    begin
    
        if (reset = '1') then
            an_int <= "11111111";
        else
            an_int <= "1111" & an3 & an2 & an1 & an0;
        end if;
    
    end process;
    
     an <= an_int;
    
end behavior;