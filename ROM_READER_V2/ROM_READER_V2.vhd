--ROM_READER_V2.vhd, by Vincent Gosselin, 2020.
--module to read the content of ROM component.
-- currently reads 1024 memory addresses.
-- Indication of first packet and last packet.

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;  

LIBRARY work;


ENTITY ROM_READER_V2 IS 
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
END ROM_READER_V2;

ARCHITECTURE rtl OF ROM_READER_V2 IS 


--components declaration
component pulse_gen is
	port
	(
		-- Input ports
		input	: in std_logic;
		clk : in std_logic; 
		resetn : in std_logic;
		
		-- Output ports
		pulse	:	out std_logic
	);
end component;



SIGNAL	SOP_OUT : STD_LOGIC;	--WIRES
SIGNAL	SOP_OUT_ff : STD_LOGIC;	--WIRES
SIGNAL 	EOP_OUT	: STD_LOGIC; --WIRES
SIGNAL 	EOP_OUT_ff	: STD_LOGIC; --WIRES
SIGNAL	Q_OUT : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	Q_OUT_ff : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	COUNTER : NATURAL;
signal	read_ena_out : std_logic;
signal	dff1:	std_logic;
signal	dff0: std_logic;
signal	cnt_ena_ff: std_logic;
signal	cnt_ena_ffd: std_logic;
signal	cout : std_logic;
SIGNAL	Q_OUTd : STD_LOGIC_VECTOR(9 DOWNTO 0);
signal	trigger_in_sync : std_logic;
signal 	trigger_in_sync2 : std_logic;
signal resetn : std_logic;


	


BEGIN 

	resetn <= not(reset);
	
		--COUNTER <=  to_integer(unsigned(Q_OUT));
		--my_slv <= std_logic_vector(to_unsigned(my_int, my_slv'length));
		
		Q_OUT <= std_logic_vector(to_unsigned(COUNTER, 10));
		

		SOP <= SOP_OUT_ff;
		EOP <= EOP_OUT_ff;
		
		READ_ENA <= cnt_ena_ffd;
		
		ROM_ADDR <= Q_OUT_ff;
	
	--all outputs registered
	process (CLK, RESET, Q_OUT, cnt_ena_ff, SOP_OUT, eop_out)
	begin
		if reset = '1' then
			SOP_OUT_ff <= '0';
			eop_out_ff <= '0';
			cnt_ena_ffd <= '0';
			q_out_ff <= "0000000000";
		elsif (rising_edge(clk)) then
			SOP_OUT_ff <= SOP_OUT;
			eop_out_ff <= eop_out;
			cnt_ena_ffd <= cnt_ena_ff;
			q_out_ff <= q_out;
		end if;
	end process;
		
	
		
	--10bitcounter
	process (CLK,RESET,cnt_ena_ff)
		variable cnt : natural range 0 to 1023 := 0;
	begin
	
		if (RESET = '1') then
				-- Reset the counter to 0
				cnt := 0;
				cout <= '0';
		
				
		elsif (rising_edge(clk)) then
		
					if cnt_ena_ff = '1' then	
					
						--reset counter
						if cnt = 1023 then
							cnt := 0;
						
						
						else	   
							cnt := cnt + 1;
							
							
						end if;
						
					end if;
				
		end if;

		-- Output the current count
		COUNTER <= cnt;
		
		-- some AND gates
		if ( cnt = 0 and cnt_ena_ff = '1') then
			SOP_OUT <= '1';
		else
			SOP_OUT <= '0';
		end if;
		
		if (cnt = 1023 and cnt_ena_ff = '1') then
			EOP_OUT <= '1';
			cout <= '1';
		else
			EOP_OUT <= '0';
			cout <= '0';
		end if;

	end process;

--TRIGGER_IN CAPTURE
--trigger_in_sync
	process(RESET, TRIGGER_IN, clk)
	begin
		if reset = '1' then
			trigger_in_sync <= '0';
		elsif rising_edge(clk) then
			trigger_in_sync <= trigger_in;
		end if;
	end process;
	
--trigger_in_sync2
	process(reset, trigger_in_sync, clk)
	begin	
		if reset = '1' then		
			trigger_in_sync2 <= '0';
		elsif rising_edge(clk) then	
			trigger_in_sync2 <= trigger_in_sync;
		end if;
	end process;



--dff0
inst55 :  pulse_gen
	port map
	(
		-- Input ports
		input	=> trigger_in_sync2,
		clk => clk, 
		resetn => resetn,
		
		-- Output ports
		pulse	=> dff1
	);


--cnt_ena_ff
process(CLK, dff1, cout, reset)
begin
	if(reset = '1') then
		cnt_ena_ff <= '0';
	elsif (rising_edge(CLK)) then
	
			if ((dff1 = '1') or (cout = '1')) then
				cnt_ena_ff <= dff1;
			end if;
			
	end if;
end process;



END rtl;