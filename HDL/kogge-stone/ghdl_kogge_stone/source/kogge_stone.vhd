
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
	
entity kogge_stone is
    Generic ( 
	nbits := 32
    );
    Port ( a : in STD_LOGIC_VECTOR(nbits-1 downto 0);
           b : in STD_LOGIC_VECTOR(nbits-1 downto 0);
	   carry_in : in STD_LOGIC;
           sum : out STD_LOGIC_VECTOR(nbits-1 downto 0);
	   carry_out : out STD_LOGIC
	);
end kogge_stone;

architecture arch of kogge_stone is

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

	type wires is array (log2(nbits) downto 0) of std_logic_vector(nbits - 1 downto 0);
	signal g_signal : wires := (others => (others => '0'));
	signal p_signal : wires := (others => (others => '0'));

	signal carry : std_logic_vector(nbits downto 0);

begin

	carry(0) <= carry_in;
	carry_out <= carry(carry'length-1);

	--for generate
	GEN_Y_AXIS : for y in 0 to log2(nbits) generate
		
		GEN_X_AXIS : for x in 0 to nbits - 1 generate
			
			RED_BOXES : if y = 0 generate
				
				rb : entity work.red_box
				port map ( ai => a(x),
			   		   bi => b(x),
			   		   p => p_signal(y)(x), --out
			   		   g => g_signal(y)(x) 	--out
				);

				sum(x) <= p_signal(y)(x) xor carry(x);

			end generate RED_BOXES;	

			YELLOW_AND_GREEN_BOXES : if y > 0 generate
				
				GREEN_BOXES : for x in 0 to pow2(y-1)-1 generate 
					gb : entity work.green_box
					port map ( pi => p_signal(y-1)(x),
						   gi => g_signal(y-1)(x),
						   p => p_signal(y)(x), --out
						   g => g_signal(y)(x) --out
					);

					carry(x+1) <= g_signal(y)(x);

				end generate GREEN_BOXES;
				

				YELLOW_BOXES : for x in pow2(y-1) to nbits-1 generate		
					yb : entity work.yellow_box
					port map ( pi => p_signal(y-1)(x),
						   gi => g_signal(y-1)(x),
						   previous_pi => p_signal(y-1)(x-pow2(y-1)),
						   previous_gi => g_signal(y-1)(x-pow2(y-1)),
						   p => p_signal(y)(x),--out
						   g => g_signal(y)(x)--out
					);

					carry(x+1) <= g_signal(y)(x);				

				end generate YELLOW_BOXES;
				
			end generate YELLOW_AND_GREEN_BOXES;		

		
		end generate GEN_X_AXIS;

	end generate GEN_Y_AXIS;

end arch;

