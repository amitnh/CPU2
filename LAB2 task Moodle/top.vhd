LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE work.aux_package.all;
USE ieee.numeric_std.ALL;
-------------------------------------------------------------
entity top is
	generic (
		n : positive := 8 ;
		m : positive := 7 ;
		k : positive := 3
	); -- where k=log2(m+1)
	port(
		rst,ena,clk : in std_logic;
		din : in std_logic_vector(n-1 downto 0);
		cond : in integer range 0 to 3;
		detector : out std_logic

	);
end top;
------------- complete the top Architecture code --------------
architecture arc_sys of top is
	SIGNAL dinLast: std_logic_vector (n-1 downto 0);
	SIGNAL count: std_logic_vector (n-1 downto 0);
	SIGNAL c: std_logic_vector (n-1 downto 0);
	SIGNAL rise: STD_LOGIC;

	--adder:
	SIGNAL condInt: std_logic_vector (n-1 downto 0);
	SIGNAL sum: std_logic_vector (n-1 downto 0);
	SIGNAL carry: STD_LOGIC;
	
BEGIN

  PROCESS (clk, rst) --sequntial
  BEGIN
	IF (rst='1') THEN
		dinLast <= (others => '0');
	ELSIF (clk'EVENT and clk='1') THEN
		IF (ena = '1') THEN
			dinLast <= din;
		END IF;
   END IF;
  END PROCESS;
				
	condInt<=std_logic_vector(to_unsigned(cond,n));
	L0: Adder generic map(n) port map(dinLast,condInt,'1',sum,carry); --Adder: dinLast + cond + 1
	PROCESS (din) --combinatorial
	BEGIN		
		rise <='0';
		IF (carry = '0' and sum = din) THEN
			rise<='1';
		END IF;	
	end PROCESS;
	
	PROCESS (count) --combinatorial
	BEGIN		
		detector<='0';
				IF (count = m + 1) THEN
					detector<='1';
				END IF;
	end PROCESS;
	

	PROCESS (clk, rst)  --sequntial
	  BEGIN
		IF (rst='1') THEN
			c <= (others=>'0');
		ELSIF (clk'EVENT and clk='1') THEN
			IF (ena = '1') THEN
	
				IF (rise ='0') THEN
					c <= (others=>'0');
				ELSIF(c <= m) 	THEN
					c <=c + 1;
				ELSE 
					c <= c;
				END IF;
			END IF;
	   END IF;
	  END PROCESS;
	  count <= c;
	  

	
	
end arc_sys;







