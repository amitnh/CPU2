LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;
USE work.aux_package.ALL;
ENTITY tb_top4 IS
	generic (
		n : positive := 8 ;
		m : positive := 7 ;
		k : positive := 3);
END tb_top4;

ARCHITECTURE dftb_top4 OF tb_top4 IS
	SIGNAL count: std_logic_vector (k downto 0);
	SIGNAL detector : std_logic;
	
begin
	tester : top4 generic map(n, m, k) port map(count,detector);
	-- run for 3600 ns
	--------- start of stimulus section ------------------	
	

	
	tb_count : PROCESS
	BEGIN
		count <= (others=>'0');
		wait for 100 ns;
		FOR i IN 0 TO 10 LOOP
			count <= count +1;
			wait for 100 ns;
		END LOOP;
		count <= (others=>'0');
		FOR i IN 0 TO 10 LOOP
			count <= count +1;
			wait for 100 ns;
		END LOOP;
		wait;
	END PROCESS tb_count;

END dftb_top4;