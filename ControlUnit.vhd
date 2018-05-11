library ieee;
use ieee.std_logic_1164.all;

entity ControlUnit is
	port (opcode	:	in std_logic_vector(1 downto 0);
			RegWrite	:	out std_logic;
			AluSrc	:	out std_logic;
			MemWrite	:	out std_logic;
			MemtoReg	:	out std_logic
);
end ControlUnit;

architecture Dataflow of ControlUnit is
begin
  with opcode select
    RegWrite <= '0' when "11",
					 '1' when others;
  
  with opcode select
    AluSrc <= '0' when "00",
				  '1' when others;
				  
  with opcode select
    MemWrite <= '1' when "11",
					 '0' when others;
					 
  with opcode select
    MemToReg <= '1' when "10",
					 '0' when others;
end Dataflow;