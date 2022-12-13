library std;
use std.textio.all;

library ieee;
use ieee.std_logic_1164.all;

entity my_Testbench is
end entity;

architecture Behave of my_Testbench is

  component DUT is
   port(input_vector: in std_logic_vector(32 downto 0);    
       	output_vector: out std_logic_vector(16 downto 0));
  end component;

  signal input_vector  : std_logic_vector(32 downto 0);
  signal output_vector : std_logic_vector(16 downto 0);

begin
    dut_instance: DUT 
     	port map(input_vector => input_vector, output_vector => output_vector);

    process
        variable err_flag : boolean := false;
    begin

        --TEST CASE - 1
        input_vector <= '1' & "0101010101010101" & "1010101010101010";
        wait for 10 ns;
        if (output_vector /= ('1' & "0000000000000000")) then
            err_flag := true;
        end if;

        assert (not err_flag) report "FAILURE, test case - 1 failed." severity error;
        
        wait for 4 ns;
        
        --TEST CASE - 2
        input_vector <= '1' & "0000000000000000" & "0000000000000001";
        wait for 10 ns;
        err_flag := false;
        if (output_vector /= ('0' & "0000000000000010")) then
            err_flag := true;
        end if;

        assert (not err_flag) report "FAILURE, test case - 2 failed." severity error;

        wait for 4 ns;
        
        --TEST CASE - 3
        input_vector <= '1' & "1111111111111111" & "1111111111111111";
        wait for 10 ns;
        err_flag := false;
        if (output_vector /= ('1' & "1111111111111111")) then
            err_flag := true;
        end if;

        assert (not err_flag) report "FAILURE, test case - 3 failed." severity error;

        wait for 4 ns;
        
        --TEST CASE - 4
        input_vector <= '0' & "0100100011000010" & "1000101100111011";
        wait for 10 ns;
        err_flag := false;
        if (output_vector /= ('0' & "1101001111111101")) then
            err_flag := true;
        end if;

        assert (not err_flag) report "FAILURE, test case - 4 failed." severity error;

        wait for 4 ns;
        
        --TEST CASE - 5
        input_vector <= '1' & "1000000000010101" & "1011100111101011";
        wait for 10 ns;
        err_flag := false;
        if (output_vector /= ('1' & "0011101000000001")) then
            err_flag := true;
        end if;

        assert (not err_flag) report "FAILURE, test case - 5 failed." severity error;

        wait for 4 ns;
        
        --TEST CASE - 6
        input_vector <= '0' & "1000010110101011" & "1111100110101000";
        wait for 10 ns;
        err_flag := false;
        if (output_vector /= ('1' & "0111111101010011")) then
            err_flag := true;
        end if;

        assert (not err_flag) report "FAILURE, test case - 6 failed." severity error;

        wait for 4 ns;
        
        --TEST CASE - 7
        input_vector <= '1' & "1010110110011000" & "1100111001010001";
        wait for 10 ns;
        err_flag := false;
        if (output_vector /= ('1' & "0111101111101010")) then
            err_flag := true;
        end if;

        assert (not err_flag) report "FAILURE, test case - 7 failed." severity error;

        wait for 4 ns;
        
        --TEST CASE - 8
        input_vector <= '0' & "1001011101110000" & "0010110010110001";
        wait for 10 ns;
        err_flag := false;
        if (output_vector /= ('0' & "1100010000100001")) then
            err_flag := true;
        end if;

        assert (not err_flag) report "FAILURE, test case - 8 failed." severity error;

        wait for 4 ns;
        
        --TEST CASE - 9
        input_vector <= '1' & "0001001000001111" & "0001101011010011";
        wait for 10 ns;
        err_flag := false;
        if (output_vector /= ('0' & "0010110011100011")) then
            err_flag := true;
        end if;

        assert (not err_flag) report "FAILURE, test case - 9 failed." severity error;

        wait for 4 ns;
        
        --TEST CASE - 10
        input_vector <= '0' & "0100101101101111" & "0100101101101111";
        wait for 10 ns;
        err_flag := false;
        if (output_vector /= ('0' & "1001011011011110")) then
            err_flag := true;
        end if;

        assert (not err_flag) report "FAILURE, test case - 10 failed." severity error;

        wait for 4 ns;
        
        --TEST CASE - 11
        input_vector <= '1' & "1111100100110011" & "0000111110011101";
        wait for 10 ns;
        err_flag := false;
        if (output_vector /= ('1' & "0000100011010001")) then
            err_flag := true;
        end if;

        assert (not err_flag) report "FAILURE, test case - 11 failed." severity error;

        wait for 4 ns;
        
        --TEST CASE - 12
        input_vector <= '0' & "0001011000001000" & "1010100011101110";
        wait for 10 ns;
        err_flag := false;
        if (output_vector /= ('0' & "1011111011110110")) then
            err_flag := true;
        end if;

        assert (not err_flag) report "FAILURE, test case - 12 failed." severity error;
        
        wait for 4 ns;
        
        --TEST CASE - 13
        input_vector <= '1' & "0011010100111111" & "0100000011111110";
        wait for 10 ns;
        err_flag := false;
        if (output_vector /= ('0' & "0111011000111110")) then
            err_flag := true;
        end if;

        assert (not err_flag) report "FAILURE, test case - 13 failed." severity error;
        
        wait for 4 ns;
        
        --TEST CASE - 14
        input_vector <= '0' & "1111101010101111" & "0010011100011010";
        wait for 10 ns;
        err_flag := false;
        if (output_vector /= ('1' & "0010000111001001")) then
            err_flag := true;
        end if;

        assert (not err_flag) report "FAILURE, test case - 14 failed." severity error;
        
        report "Testbench finished successfully." severity note;

        wait;
    end process;

end Behave;
