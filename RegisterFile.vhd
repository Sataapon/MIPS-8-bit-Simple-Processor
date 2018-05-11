library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RegisterFile is
	port (clk 			:	in std_logic;
			write_en		:	in std_logic;
			write_reg	:	in std_logic_vector(1 downto 0);
			read_reg_1	:	in std_logic_vector(1 downto 0);
			read_reg_2	:	in std_logic_vector(1 downto 0);
			write_data	:	in std_logic_vector(7 downto 0);
			read_data_1	:	out std_logic_vector(7 downto 0);
			read_data_2	:	out std_logic_vector(7 downto 0);
			reg0			:	out std_logic_vector(7 downto 0);
			reg1			:	out std_logic_vector(7 downto 0);
			reg2			:	out std_logic_vector(7 downto 0);
			reg3			:	out std_logic_vector(7 downto 0)
	);
end RegisterFile;

architecture Behavioral of RegisterFile is
  type memory is array (0 to 3) of std_logic_vector(7 downto 0);
  signal reg_mem : memory;
begin
  process(clk)
  begin
    if(rising_edge(clk) and write_en = '1') then
	   reg_mem(to_integer(unsigned(write_reg))) <= write_data;
    end if;
  end process;
  read_data_1 <= reg_mem(to_integer(unsigned(read_reg_1)));
  read_data_2 <= reg_mem(to_integer(unsigned(read_reg_2)));
  
  reg0 <= reg_mem(to_integer("00"));
  reg1 <= reg_mem(to_integer("01"));
  reg2 <= reg_mem(to_integer("10"));
  reg3 <= reg_mem(to_integer("11"));
end Behavioral;












