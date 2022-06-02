library ieee;
use ieee.std_logic_1164.all;
entity eq_top is
   port(
      sw  : in  std_logic_vector(15 downto 0);
      led : out std_logic_vector(15 downto 0)
   );
end eq_top;

architecture struc_arch of eq_top is
    signal escolha : std_logic_vector(1 downto 0);
begin
   prioridade : entity work.prio_encoder42(cond_arch)
      port map(
        r => sw(15 downto 12),
        code => escolha,
        active => led(15)
      );
   deslocador : entity work.shift3mode(direct_arch)
      port map(
         a    => sw(2 downto 0),
         lar    => escolha,
         y => led(2 downto 0)
      );
end struc_arch;