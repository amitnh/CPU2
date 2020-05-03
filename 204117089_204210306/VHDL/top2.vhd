LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE work.aux_package.all;
USE ieee.numeric_std.ALL;
-------------------------------------------------------------
entity top2 is
	generic (
		n : positive := 8 ;
		m : positive := 7 ;
		k : positive := 3
	); -- where k=log2(m+1)
	port(
		din : in std_logic_vector(n-1 downto 0);
		dinlast : in std_logic_vector(n-1 downto 0);
		cond : in integer range 0 to 3;
		rise:out STD_LOGIC;
		sum: out std_logic_vector (n-1 downto 0);
	    carry: out STD_LOGIC
	);
end top2;
------------- complete the top Architecture code --------------
architecture arc_sys of top2 is

	--adder:
	SIGNAL condInt: std_logic_vector (n-1 downto 0);
	Signal sumConnect: std_logic_vector (n-1 downto 0);
	Signal carryConnect: STD_LOGIC;
	
BEGIN


				
	condInt<=std_logic_vector(to_unsigned(cond,n));
	L0: Adder generic map(n) port map(dinlast,condInt,'1',sumConnect,carryConnect); --Adder: dinLast + cond + 1
	PROCESS (sumConnect,din,carryConnect) --combinatorial
	BEGIN		
		rise <='0';
		IF (carryConnect = '0' and sumConnect = din) THEN
			rise<='1';
		END IF;	
	end PROCESS;
	carry<= carryConnect;
	sum <= sumConnect;

	
end arc_sys;







