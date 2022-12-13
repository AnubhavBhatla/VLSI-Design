library ieee;
use ieee.std_logic_1164.all;

entity DUT is
   port(input_vector: in std_logic_vector(32 downto 0);
       	output_vector: out std_logic_vector(16 downto 0));
end entity;

architecture DutWrap of DUT is
   component bk_adder is 
	port (
		A, B: in std_logic_vector(15 downto 0);
		Cin: in std_logic;
		S: out std_logic_vector(15 downto 0);
		Cout: out std_logic
	);
	end component;
begin

   add_instance: bk_adder
			port map (
					
					Cin => input_vector(32),
					
					A(15 downto 0) => input_vector(31 downto 16),
					
					B(15 downto 0) => input_vector(15 downto 0),
					
					Cout => output_vector(16),

					S(15 downto 0) => output_vector(15 downto 0)				
					
					);

end DutWrap;

