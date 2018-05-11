library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity InstructionMemory is
port (pc		:	in std_logic_vector(1 downto 0);
		instr	:	out std_logic_vector(7 downto 0)
);
end InstructionMemory;

architecture Dataflow of InstructionMemory is
  type memory is array (0 to 3) of std_logic_vector(7 downto 0);
  constant instr_mem : memory:=(
  "01000000",
  "01010101",
  "10000110",
  "00011011"
  );
begin
  instr <= instr_mem(to_integer(unsigned(pc)));
end Dataflow;