
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity yellow_box is
    Port ( pi : in  STD_LOGIC;
           gi : in  STD_LOGIC;
           previous_pi : in  STD_LOGIC;
	   previous_gi : in STD_LOGIC;
	   p : out STD_LOGIC;
	   g : out STD_LOGIC
	);
end yellow_box;

architecture behavioral of yellow_box is
begin

	p <= pi and previous_pi;
	g <= (pi and previous_gi) or gi;	

end Behavioral;

