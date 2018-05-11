library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SignExtend is
	port (a	:	in std_logic_vector(1 downto 0);
			b	:	out std_logic_vector(7 downto 0)
	);
end SignExtend;

architecture Dataflow of SignExtend is
begin
  b <= std_logic_vector(resize(signed(a), b'length));
end Dataflow;