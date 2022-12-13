library IEEE;
use IEEE.std_logic_1164.all;

package bkadder16 is 

	--16-bit Brent Kung Adder
	component bk_adder is 
		port (
			A, B: in std_logic_vector(15 downto 0);
			Cin: in std_logic;
			S: out std_logic_vector(15 downto 0);
			Cout: out std_logic
		);
	end component bk_adder;
	
end package bkadder16;

library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.gates.all;

entity bk_adder is 
	port (
		A, B: in std_logic_vector(15 downto 0);
		Cin: in std_logic;
		S: out std_logic_vector(15 downto 0);
		Cout: out std_logic
	);
end entity bk_adder;

architecture arch of bk_adder is

	signal G0,P0: std_logic_vector(15 downto 0);
	signal G1,P1: std_logic_vector(7 downto 0);
	signal G2,P2: std_logic_vector(3 downto 0);
	signal G3,P3: std_logic_vector(1 downto 0);
	signal G4,P4: std_logic;
	signal C: std_logic_vector(15 downto 0);
	
	begin
		
		C(0) <= Cin;
		
		--Slot 1 --0th order Gs and Ps
		
		G_0: Cin_map_G port map (A => A(0), B => B(0), Cin => C(0), Bit0_G => G0(0)); --this represents C1
		P_0: xorgate port map (A => A(0), B => B(0), uneq => P0(0));
		
		G_1: andgate port map (A => A(1), B => B(1), prod => G0(1));
		P_1: xorgate port map (A => A(1), B => B(1), uneq => P0(1));
		
		G_2: andgate port map (A => A(2), B => B(2), prod => G0(2));
		P_2: xorgate port map (A => A(2), B => B(2), uneq => P0(2));
		
		G_3: andgate port map (A => A(3), B => B(3), prod => G0(3));
		P_3: xorgate port map (A => A(3), B => B(3), uneq => P0(3));
		
		G_4: andgate port map (A => A(4), B => B(4), prod => G0(4));
		P_4: xorgate port map (A => A(4), B => B(4), uneq => P0(4));
		
		G_5: andgate port map (A => A(5), B => B(5), prod => G0(5));
		P_5: xorgate port map (A => A(5), B => B(5), uneq => P0(5));
		
		G_6: andgate port map (A => A(6), B => B(6), prod => G0(6));
		P_6: xorgate port map (A => A(6), B => B(6), uneq => P0(6));
		
		G_7: andgate port map (A => A(7), B => B(7), prod => G0(7));
		P_7: xorgate port map (A => A(7), B => B(7), uneq => P0(7));
		
		G_8: andgate port map (A => A(8), B => B(8), prod => G0(8));
		P_8: xorgate port map (A => A(8), B => B(8), uneq => P0(8));
		
		G_9: andgate port map (A => A(9), B => B(9), prod => G0(9));
		P_9: xorgate port map (A => A(9), B => B(9), uneq => P0(9));
		
		G_10: andgate port map (A => A(10), B => B(10), prod => G0(10));
		P_10: xorgate port map (A => A(10), B => B(10), uneq => P0(10));
		
		G_11: andgate port map (A => A(11), B => B(11), prod => G0(11));
		P_11: xorgate port map (A => A(11), B => B(11), uneq => P0(11));
		
		G_12: andgate port map (A => A(12), B => B(12), prod => G0(12));
		P_12: xorgate port map (A => A(12), B => B(12), uneq => P0(12));
		
		G_13: andgate port map (A => A(13), B => B(13), prod => G0(13));
		P_13: xorgate port map (A => A(13), B => B(13), uneq => P0(13));
		
		G_14: andgate port map (A => A(14), B => B(14), prod => G0(14));
		P_14: xorgate port map (A => A(14), B => B(14), uneq => P0(14));
		
		G_15: andgate port map (A => A(15), B => B(15), prod => G0(15));
		P_15: xorgate port map (A => A(15), B => B(15), uneq => P0(15));
		
		--C1
		C(1) <= G0(0);
		
		--Slot 2 --1st order Gs and Ps
		
		G_1_0: abcgate port map (A => G0(1), B => P0(1), C => G0(0), abc => G1(0)); --this represents C2
		P_1_0: andgate port map (A => P0(1), B => P0(0), prod => P1(0));
		
		G_3_2: abcgate port map (A => G0(3), B => P0(3), C => G0(2), abc => G1(1));
		P_3_2: andgate port map (A => P0(3), B => P0(2), prod => P1(1));
		
		G_5_4: abcgate port map (A => G0(5), B => P0(5), C => G0(4), abc => G1(2));
		P_5_4: andgate port map (A => P0(5), B => P0(4), prod => P1(2));
		
		G_7_6: abcgate port map (A => G0(7), B => P0(7), C => G0(6), abc => G1(3));
		P_7_6: andgate port map (A => P0(7), B => P0(6), prod => P1(3));
		
		G_9_8: abcgate port map (A => G0(9), B => P0(9), C => G0(8), abc => G1(4));
		P_9_8: andgate port map (A => P0(9), B => P0(8), prod => P1(4));
		
		G_11_10: abcgate port map (A => G0(11), B => P0(11), C => G0(10), abc => G1(5));
		P_11_10: andgate port map (A => P0(11), B => P0(10), prod => P1(5));
		
		G_13_12: abcgate port map (A => G0(13), B => P0(13), C => G0(12), abc => G1(6));
		P_13_12: andgate port map (A => P0(13), B => P0(12), prod => P1(6));
		
		G_15_14: abcgate port map (A => G0(15), B => P0(15), C => G0(14), abc => G1(7));
		P_15_14: andgate port map (A => P0(15), B => P0(14), prod => P1(7));
		
		--C2
		C(2) <= G1(0);
		
		--S0
		S_0: xorgate port map (A => P0(0), B => C(0), uneq => S(0));
		
		--S1
		S_1: xorgate port map (A => P0(1), B => C(1), uneq => S(1));
		
		--Slot 3 --2nd order Gs and Ps
		
		G_3_0: abcgate port map (A => G1(1), B => P1(1), C => G1(0), abc => G2(0)); --this represents C4
		P_3_0: andgate port map (A => P1(1), B => P1(0), prod => P2(0));
		
		G_7_4: abcgate port map (A => G1(3), B => P1(3), C => G1(2), abc => G2(1));
		P_7_4: andgate port map (A => P1(3), B => P1(2), prod => P2(1));
		
		G_11_8: abcgate port map (A => G1(5), B => P1(5), C => G1(4), abc => G2(2));
		P_11_8: andgate port map (A => P1(5), B => P1(4), prod => P2(2));
		
		G_15_12: abcgate port map (A => G1(7), B => P1(7), C => G1(6), abc => G2(3));
		P_15_12: andgate port map (A => P1(7), B => P1(6), prod => P2(3));
		
		--C3
		C_3: abcgate port map (A => G0(2), B => P0(2), C => C(2), abc => C(3));
		
		--C4
		C(4) <= G2(0);
		
		--S2
		S_2: xorgate port map (A => P0(2), B => C(2), uneq => S(2));
		
		--Slot 4 --3rd order Gs and Ps
		
		G_7_0: abcgate port map (A => G2(1), B => P2(1), C => G2(0), abc => G3(0)); --this represents C8
		P_7_0: andgate port map (A => P2(1), B => P2(0), prod => P3(0));
		
		G_15_8: abcgate port map (A => G2(3), B => P2(3), C => G2(2), abc => G3(1));
		P_15_8: andgate port map (A => P2(3), B => P2(2), prod => P3(1));
		
		--C5
		C_5: abcgate port map (A => G0(4), B => P0(4), C => C(4), abc => C(5));
		
		--C6
		C_6: abcgate port map (A => G1(2), B => P1(2), C => C(4), abc => C(6));
		
		--C8
		C(8) <= G3(0);
		
		--S3
		S_3: xorgate port map (A => P0(3), B => C(3), uneq => S(3));
		
		--S4
		S_4: xorgate port map (A => P0(4), B => C(4), uneq => S(4));
		
		--Slot 5 --4th order G and P
		
		G_15_0: abcgate port map (A => G3(1), B => P3(1), C => G3(0), abc => G4); --this represents C16
		P_15_0: andgate port map (A => P3(1), B => P3(0), prod => P4);
		
		--C7
		C_7: abcgate port map (A => G0(6), B => P0(6), C => C(6), abc => C(7));
		
		--C9
		C_9: abcgate port map (A => G0(8), B => P0(8), C => C(8), abc => C(9));
		
		--C10
		C_10: abcgate port map (A => G1(4), B => P1(4), C => C(8), abc => C(10));
		
		--C12
		C_12: abcgate port map (A => G2(2), B => P2(2), C => C(8), abc => C(12));
		
		--C16
		Cout <= G4;
		
		--S5
		S_5: xorgate port map (A => P0(5), B => C(5), uneq => S(5));
		
		--S6
		S_6: xorgate port map (A => P0(6), B => C(6), uneq => S(6));
		
		--S8
		S_8: xorgate port map (A => P0(8), B => C(8), uneq => S(8));
		
		--Slot 6
		
		--C11
		C_11: abcgate port map (A => G0(10), B => P0(10), C => C(10), abc => C(11));
		
		--C13
		C_13: abcgate port map (A => G0(12), B => P0(12), C => C(12), abc => C(13));
		
		--C14
		C_14: abcgate port map (A => G1(6), B => P1(6), C => C(12), abc => C(14));
		
		--S7
		S_7: xorgate port map (A => P0(7), B => C(7), uneq => S(7));
		
		--S9
		S_9: xorgate port map (A => P0(9), B => C(9), uneq => S(9));
		
		--S10
		S_10: xorgate port map (A => P0(10), B => C(10), uneq => S(10));
		
		--S12
		S_12: xorgate port map (A => P0(12), B => C(12), uneq => S(12));
		
		--Slot 7
		
		--C15
		C_15: abcgate port map (A => G0(14), B => P0(14), C => C(14), abc => C(15));
		
		--S11	
		S_11: xorgate port map (A => P0(11), B => C(11), uneq => S(11));
		
		--S13
		S_13: xorgate port map (A => P0(13), B => C(13), uneq => S(13));
		
		--S14
		S_14: xorgate port map (A => P0(14), B => C(14), uneq => S(14));
		
		--Slot 8
		
		--S15
		S_15: xorgate port map (A => P0(15), B => C(15), uneq => S(15));
		
		
end architecture arch;