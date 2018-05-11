library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity Alu is
	port (in_1		:	in std_logic_vector(7 downto 0);
			in_2		:	in std_logic_vector(7 downto 0);
			result	:	out std_logic_vector(7 downto 0)
	);
end Alu;

architecture Dataflow of Alu is
begin
	result <= in_1 + in_2;
end Dataflow;
