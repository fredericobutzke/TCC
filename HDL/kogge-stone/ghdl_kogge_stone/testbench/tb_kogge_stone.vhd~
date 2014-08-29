
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.math_real.all;

entity tb_kogge_stone is
end tb_kogge_stone;

architecture arch of tb_kogge_stone is

	--signal carry : STD_LOGIC_VECTOR(nbits downto 0);
	signal int, int2 : integer;
	signal bits : integer := 16;
	signal array_1, sum : std_logic_vector(bits-1 downto 0);
	signal cout : std_logic;

	function log2( i : natural) return integer is
	    variable temp    : integer := i;
	    variable ret_val : integer := 1; --log2 of 0 should equal 1 because you still need 1 bit to represent 0
	  begin
		if i = 0 then
			return ret_val;
		else       
			while temp > 1 loop
				ret_val := ret_val + 1;
				temp    := temp / 2;     
			end loop;
				ret_val := ret_val - 1;
			return ret_val;
		end if;
	end function;

	function pow2( i : natural) return integer is
		variable ret_val : integer;
	begin
		ret_val := 2 ** i;	   	
		return ret_val;
	end function;

begin

	--process
	--begin
	--	int <= log2(4), log2(8) after 2 ns, log2(16) after 3 ns, log2(32) after 4 ns, log2(64) after 5 ns, log2(128) after 6 ns;
	--	int2 <= pow2(2), pow2(3) after 2 ns, pow2(4) after 3 ns;
--		s_1 <= array_1(array_1'length-1);
--		wait for 30 ns;
--	end process;

	KG : entity work.kogge_stone
	    Generic map ( 
		nbits => bits
	    )
	    Port map( a => x"ffff",
		   b => x"ffff",
		   carry_in => '0',
		   sum => sum,
		   carry_out => cout
		);

	process
	begin
		wait for 30 ns;
	end process;

end arch;

