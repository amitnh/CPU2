LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;
USE work.aux_package.ALL;
ENTITY tb_top2 IS
	generic (
		n : positive := 8 ;
		m : positive := 7 ;
		k : positive := 3);
END tb_top2;

ARCHITECTURE dftb_top2 OF tb_top2 IS

	SIGNAL din : std_logic_vector(n-1 downto 0);
	SIGNAL dinlast : std_logic_vector(n-1 downto 0);
	SIGNAL cond : integer range 0 to k;
	SIGNAL rise : std_logic;
	SIGNAL sum :  std_logic_vector (n-1 downto 0);
	SIGNAL  carry:  STD_LOGIC;
	
begin
	tester : top2 generic map(n, m, k) port map(din,dinlast,cond,rise,sum,carry);
	-- run for 3600 ns
	--------- start of stimulus section ------------------	
	

	tb_cond : PROCESS
	BEGIN
		cond <= 0;
		WAIT FOR 1100 ns;
		cond <= 1;
		wait for 1100 ns;
		cond <= 2;
		wait;
	END PROCESS tb_cond;
	
	
	tb_din : PROCESS
	BEGIN
		dinlast <= (others=>'0');
		din <= (0 =>'1',others=>'0');

		wait for 100 ns;
		FOR i IN 0 TO 10 LOOP
			din <= din +1;
			dinlast <= dinlast +1;
			wait for 100 ns;
		END LOOP;
		dinlast <= (others=>'0');
		din <= (1=>'1',others=>'0');

		wait for 100 ns;
		FOR i IN 0 TO 10 LOOP
			din <= din +2;
			dinlast <= dinlast +2;			wait for 100 ns;
		END LOOP;
		dinlast <= (others=>'0');
		din <= (0 =>'1',1=>'1',others=>'0');

		wait for 100 ns;
		FOR i IN 0 TO 10 LOOP
			din <= din +3;
			dinlast <= dinlast +3;			wait for 100 ns;
		END LOOP;
		wait;
	END PROCESS tb_din;

END dftb_top2;