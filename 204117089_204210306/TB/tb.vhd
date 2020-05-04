LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;
USE work.aux_package.ALL;
ENTITY tb_top IS
	generic (
		n : positive := 8 ;
		m : positive := 7 ;
		k : positive := 3);
END tb_top;

ARCHITECTURE dftb_top OF tb_top IS

	SIGNAL rst,ena,clk : std_logic;
	SIGNAL din : std_logic_vector(n-1 downto 0);
	SIGNAL cond : integer range 0 to k;
	SIGNAL detector : std_logic;
	
begin
	tester : top generic map(n, m, k) port map(rst,ena,clk,din,cond,detector);
	-- run for 3600 ns
	--------- start of stimulus section ------------------	
	tb_clk : PROCESS
	BEGIN
		clk <= '0' ;
		WAIT FOR 50 ns;
		clk <= '1'; 
		WAIT FOR 50 ns;
	END PROCESS tb_clk;

	tb_rst : PROCESS
	BEGIN
		rst <= '1';
		wait for 100 ns;
		rst <= '0';
		wait;
	END PROCESS tb_rst;
	
		tb_ena : PROCESS
	BEGIN
		ena <= '0', '1' after 200 ns;
		wait;
	END PROCESS tb_ena;
	
	

	tb_cond : PROCESS
	BEGIN
		cond <= 0;
		WAIT FOR 1200 ns;
		cond <= 1;
		wait for 1200 ns;
		cond <= 2;
		wait;
	END PROCESS tb_cond;
	
	
	tb_din : PROCESS
	BEGIN
		din <= (others=>'0');
		wait for 100 ns;
		FOR i IN 0 TO 10 LOOP
			din <= din +1;
			wait for 100 ns;
		END LOOP;
		din <= (others=>'0');
		wait for 100 ns;
		FOR i IN 0 TO 10 LOOP
			din <= din +2;
			wait for 100 ns;
		END LOOP;
		din <= (others=>'0');
		wait for 100 ns;
		FOR i IN 0 TO 9 LOOP
			din <= din +3;
			wait for 100 ns;
		END LOOP;
		wait;
	END PROCESS tb_din;

END dftb_top;