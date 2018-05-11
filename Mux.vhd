library ieee;
use ieee.std_logic_1164.all;

entity Mux is
	Port( sel	:	in  std_logic;
			a, b	:	in  std_logic_vector(7 downto 0);
			y		:	out std_logic_vector(7 downto 0)
			);
end Mux;

architecture Dataflow of Mux is
begin
    y <= a when (sel = '0') else b;
end Dataflow;