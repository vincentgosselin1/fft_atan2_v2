--pulse_gen.vhd by Vincent Gosselin, 2020.
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;  

entity pulse_gen is

	port
	(
		-- Input ports
		input	: in std_logic;
		clk : in std_logic; 
		resetn : in std_logic;
		
		-- Output ports
		pulse	:	out std_logic
	);
end pulse_gen;



architecture rtl of pulse_gen is

	-- Declarations (optional)
	signal dff1 : std_logic;
	signal dff2 : std_logic;

begin

	process(clk, resetn, input, dff1, dff2)
	begin
		if resetn = '0' then
			dff1 <= '0';
			dff2 <= '0';
		elsif rising_edge(clk) then
			dff1 <= input;
			dff2 <= dff1;
		end if;
		
		--logic
		pulse <= dff1 and not(dff2);
	end process;

end rtl;

