library IEEE;
use IEEE.std_logic_1164.all;

-- simple gates with trivial architectures
package gates is

	-- A.B
	component andgate is
		port (
			A, B: in std_ulogic;
			prod: out std_ulogic
		);
	end component andgate;
	
	-- A XOR B
	component xorgate is
		port (
			A, B: in std_ulogic;
			uneq: out std_ulogic
		);
	end component xorgate;
	
	-- A + B.C
	component abcgate is
		port (
			A, B, C: in std_ulogic;
			abc: out std_ulogic
		);
	end component abcgate;

	-- A.B + C.(A + B)
	component Cin_map_G is
	port(
		A, B, Cin: in std_ulogic;
		Bit0_G: out std_ulogic
	);
	end component Cin_map_G;
	
end package gates;

library IEEE;
use IEEE.std_logic_1164.all;

-- A.B
entity andgate is
	port (
		A, B: in std_ulogic;
		prod: out std_ulogic
	);
end entity andgate;

architecture trivial of andgate is
	begin
		prod <= A AND B AFTER 48 ps;
end architecture trivial;

library IEEE;
use IEEE.std_logic_1164.all;

-- A XOR B
entity xorgate is
	port (
		A, B: in std_ulogic;
		uneq: out std_ulogic
	);
end entity xorgate;

architecture trivial of xorgate is
	begin
		uneq <= A XOR B AFTER 76 ps;
end architecture trivial;

library IEEE;
use IEEE.std_logic_1164.all;

-- A + B.C
entity abcgate is
	port (
		A, B, C: in std_ulogic;
		abc: out std_ulogic
	);
end entity abcgate;

architecture trivial of abcgate is
	begin
		abc <= A OR (B AND C) AFTER 66 ps;
end architecture trivial;

library IEEE;
use IEEE.std_logic_1164.all;

-- A.B + C.(A + B)
entity Cin_map_G is
	port(
		A, B, Cin: in std_ulogic;
		Bit0_G: out std_ulogic
	);
end entity Cin_map_G;

architecture trivial of Cin_map_G is
	begin
		Bit0_G <= (A AND B) OR (Cin AND (A OR B)) AFTER 76 ps;
end architecture trivial;
