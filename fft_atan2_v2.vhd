---fft_atan2_v2.vhd by Vincent Gosselin, 2020.

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY fft_atan2_v2 IS 
	PORT
	(
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
		rad :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0)
		
	);
END fft_atan2_v2;

ARCHITECTURE rtl OF fft_atan2_v2 IS 



--components used

COMPONENT fft_burst_16x1024_v1
	PORT(clk : IN STD_LOGIC;
		 reset_n : IN STD_LOGIC;
		 sink_valid : IN STD_LOGIC;
		 sink_sop : IN STD_LOGIC;
		 sink_eop : IN STD_LOGIC;
		 --inverse : IN STD_LOGIC;
		 inverse : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
		 source_ready : IN STD_LOGIC;
		 sink_error : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 sink_imag : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 sink_real : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 sink_ready : OUT STD_LOGIC;
		 source_valid : OUT STD_LOGIC;
		 source_sop : OUT STD_LOGIC;
		 source_eop : OUT STD_LOGIC;
		 source_error : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		 source_exp : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		 source_imag : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 source_real : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

	component cordic_atan2_v2 is
		port (
			areset : in  std_logic                     := 'X';             -- reset
			clk    : in  std_logic                     := 'X';             -- clk
			en     : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- en
			--Angle is q.
			q      : out std_logic_vector(15 downto 0);                    -- q
			--Magnitude is r
			r      : out std_logic_vector(14 downto 0);                    -- r
			x      : in  std_logic_vector(15 downto 0) := (others => 'X'); -- x
			y      : in  std_logic_vector(15 downto 0) := (others => 'X')  -- y
		);
	end component cordic_atan2_v2;
	

component ROM_RAWDATA
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		rden		: IN STD_LOGIC  := '1';
		q		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
end component;

component ROM_READER_V2 IS 
	PORT
	(
		TRIGGER_IN :  IN  STD_LOGIC;
		CLK :  IN  STD_LOGIC;
		RESET :  IN  STD_LOGIC;
		READ_ENA :  OUT  STD_LOGIC;
		ROM_ADDR :  OUT  STD_LOGIC_VECTOR(9 DOWNTO 0);
		SOP	: OUT STD_LOGIC; --FIRST SAMPLE OUT
		EOP	:	OUT STD_LOGIC --last SAMPLE OUT
	);
END component;

	
--signals
SIGNAL	RESETn :  STD_LOGIC;
SIGNAL	VCC	:	STD_LOGIC;
signal	read_req : std_logic;
signal	w1 : std_logic;
signal	w2 : std_logic;
signal rom_addr : std_logic_vector(9 downto 0);
signal rom_out_w : std_logic_vector(15 downto 0);




BEGIN 

resetn <= not(reset);
rom_out <= rom_out_w;
source_imag <= (others => '0');
source_real <= (others => '0');
mag <= (others => '0');
rad <= (others => '0');

--rom reader		
	inst1 : ROM_READER_V2
	PORT map
	(
		TRIGGER_IN		=> 	trigger_in,
		CLK				=>	 		clk,
		RESET			=> 	 reset,
		READ_ENA		=>	 read_req,
		ROM_ADDR		=>	 rom_addr,
		SOP				=>		w1,
		EOP				=>		w2
	);


	inst2 : component ROM_RAWDATA 
	PORT MAP 
	(
		address	 => rom_addr, 
		clock	 => clk,
		rden	 => read_req,
		q	 => rom_out_w
	);

-- VCC <= '1';

-- inst3 : FFT_Burst_16x1024_v1
-- PORT MAP(clk => CLK,
		 -- reset_n => RESETn,
		 -- sink_valid => valid,
		 -- sink_sop => sop,
		 -- sink_eop => eop,
		 -- inverse => SYNTHESIZED_WIRE_0,
		 -- source_ready => SYNTHESIZED_WIRE_1,
		 -- sink_error => SYNTHESIZED_WIRE_2,
		 -- sink_imag => SYNTHESIZED_WIRE_3,
		 -- sink_real => W4,
		 -- source_valid => SYNTHESIZED_WIRE_4(0),
		 -- source_imag => source_imag_ALTERA_SYNTHESIZED,
		 -- source_real => source_real_ALTERA_SYNTHESIZED,
		 -- sink_ready => sink_ready);	

	-- u0 : component cordic_atan2_v2
		-- port map (
			-- clk    => CLK,    --    clk.clk
			-- areset => RESET, -- areset.reset
			-- x      => source_real_ALTERA_SYNTHESIZED,      --      x.x
			-- y      => source_imag_ALTERA_SYNTHESIZED,      --      y.y
			-- q      => rad,      --      q.q
			-- r      => mag,      --      r.r
			-- en(0)     => VCC      --     en.en
		-- );
		

END rtl;