--fft_atan2_v2_tb by Vincent Gosselin, 2020.

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY fft_atan2_v2_tb IS
END fft_atan2_v2_tb;

ARCHITECTURE fft_atan2_v2 OF fft_atan2_v2_tb IS

-- constants                                                 
-- signals                                                   

SIGNAL CLK : STD_LOGIC;
SIGNAL mag : STD_LOGIC_VECTOR(14 DOWNTO 0);
--SIGNAL rad : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL RESET : STD_LOGIC;
--SIGNAL sink_ready : STD_LOGIC;
SIGNAL sink_sop_out : STD_LOGIC;
signal sink_eop_out : STD_LOGIC;
signal sink_valid_out : STD_LOGIC;
SIGNAL source_imag : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL source_real : STD_LOGIC_VECTOR(15 DOWNTO 0);
--SIGNAL source_valid_out : std_logic;
--SIGNAL source_sop_out : std_logic;
--SIGNAL source_eop_out : std_logic;
SIGNAL TRIGGER_in : STD_LOGIC;
--SIGNAL valid : STD_LOGIC;
SIGNAL ROM_OUT : STD_LOGIC_VECTOR(15 DOWNTO 0);




COMPONENT fft_atan2_v2
	PORT (
		CLK :  IN  STD_LOGIC;
		RESET :  IN  STD_LOGIC;
		
		--for rom_reader_v2
		trigger_in : in std_logic; --for rom_reader_v2
		
		--rom_reader_v2 outputs
		rom_out : out std_logic_vector(15 DOWNTO 0);
		
		--fft outputs
		source_imag :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0);
		source_real :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0);

		--cordic_atan2_v2, also gives magnetude
		mag :  OUT  STD_LOGIC_VECTOR(14 DOWNTO 0);
		rad :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0);
		
		--for sim
		sink_sop_out : out std_logic;
		sink_eop_out : out std_logic;
		sink_valid_out : out std_logic;
		source_sop_out : out std_logic;
		source_eop_out : out std_logic;
		source_valid_out : out std_logic
	);
END COMPONENT;

BEGIN
	inst1: fft_atan2_v2
	PORT MAP (
	
		CLK => clk,
		RESET => reset,
		
		--for rom_reader_v2
		trigger_in => trigger_in,
		
		--rom_reader_v2 outputs
		rom_out => rom_out,
		
		--fft outputs
		source_imag => source_imag,
		source_real => source_real,

		--cordic_atan2_v2, also gives magnetude
		mag => mag,
		--rad => rad,
		
		--for sim
		sink_sop_out => sink_sop_out,
		sink_eop_out => sink_eop_out,
		sink_valid_out => sink_valid_out
		-- source_sop_out => source_sop_out,
		-- source_eop_out => source_eop_out,
		-- source_valid_out => source_valid_out
		
	);
	
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once                      
WAIT;                                                       
END PROCESS init;

clock_running : PROCESS

	--constant init.
	constant clock_period : time := 5 ns;

--	--clock running
	BEGIN
	CLK <='1';
	wait for clock_period/2;
	CLK <='0';
	wait for clock_period/2;

END PROCESS clock_running;

                                          
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
    
	RESET <= '1';
	trigger_in <= '0';
	WAIT FOR 20 ns;
	RESET <= '0';
	wait for 25 ns;

	trigger_in <= '1';
	wait for 5 ns;
	trigger_in <= '0';
	wait for 5 ns;
		
	
	
	
WAIT;                                                        
END PROCESS always;                                          
END fft_atan2_v2;
