library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DataMemory is
	port (clk 			:	in std_logic;
			write_en		:	in std_logic;
			access_addr	:	in std_logic_vector(7 downto 0);
			write_data	:	in std_logic_vector(7 downto 0);
			read_data		:	out std_logic_vector(7 downto 0)
	);
end DataMemory;

architecture Behavioral of DataMemory is
  type memory is array (0 to 255) of std_logic_vector(7 downto 0);
  signal data_mem : memory;
begin
  process(clk)
  begin
    if(rising_edge(clk) and write_en = '1') then
	   data_mem(to_integer(unsigned(access_addr))) <= write_data;
    end if;
  end process;
  read_data <= data_mem(to_integer(unsigned(access_addr)));
end Behavioral;












