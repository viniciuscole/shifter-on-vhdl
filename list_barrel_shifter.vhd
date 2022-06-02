--=============================
-- Listing 7.13 barrel shifter
--=============================
library ieee;
use ieee.std_logic_1164.all;
entity shift3mode is
   port(
      a: in std_logic_vector(2 downto 0);
      lar: in std_logic_vector(1 downto 0);
      y: out std_logic_vector(2 downto 0)
   );
end shift3mode ;

architecture direct_arch of shift3mode is
   signal logicD_result, logicL_result, rotD_result:
      std_logic_vector(2 downto 0);
begin
       rotD_result<= a(0) & a(2 downto 1);

      logicD_result<= "0" & a(2 downto 1);
      
      logicL_result<= a(1 downto 0) & "0";
   
   with lar select
      y <= logicD_result when "11",
           rot_result when "10",
           logicL_result   when "01",
           a            when others; -- "00"
end direct_arch;

