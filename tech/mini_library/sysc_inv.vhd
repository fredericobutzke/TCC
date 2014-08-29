library ieee;
use ieee.std_logic_1164.all;

entity inv is
	port(
		A : in std_logic;
		Z : out std_logic
	);
end;
architecture SystemC of inv is
	attribute foreign of SystemC : architecture is "SystemC";
begin
end;
