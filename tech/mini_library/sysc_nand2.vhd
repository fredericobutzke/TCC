library ieee;
use ieee.std_logic_1164.all;

entity nand2 is
	port(
		A : in std_logic;
		B : in std_logic;
		Z : out std_logic
	);
end;
architecture SystemC of nand2 is
	attribute foreign of SystemC : architecture is "SystemC";
begin
end;
