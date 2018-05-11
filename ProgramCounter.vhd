library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ProgramCounter is
	port (clk	:	in std_logic;
			pc		:	out std_logic_vector(1 downto 0)
	);
end ProgramCounter;

architecture Behavioral of ProgramCounter is
	signal storage	:	std_logic_vector(1 downto 0);
begin
	process(clk)
	begin
		if(rising_edge(clk)) then
			storage <= std_logic_vector(unsigned(storage) + to_unsigned(1, 2));
		end if;
	end process;
	pc <= storage;
end Behavioral;