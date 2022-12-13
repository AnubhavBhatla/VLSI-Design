library ieee;
use ieee.std_logic_1164.all;

entity DUT is
   port(input_vector: in std_logic_vector(31 downto 0);
       	output_vector: out std_logic_vector(16 downto 0));
end entity;

architecture DutWrap of DUT is
   component mac is 
		port (
			A, B: in std_logic_vector(7 downto 0);
			C: in std_logic_vector(15 downto 0);
			O: out std_logic_vector(16 downto 0)
		);
	end component mac;
begin

   add_instance: mac
			port map (
					
					A(7 downto 0) => input_vector(15 downto 8),
					
					B(7 downto 0) => input_vector(7 downto 0),
					
					C(15 downto 0) => input_vector(31 downto 16),

					O(16 downto 0) => output_vector(16 downto 0)				
					
					);

end DutWrap;

