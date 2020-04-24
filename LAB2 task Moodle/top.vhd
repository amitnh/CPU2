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
	SIGNAL count: std_logic_vector (n-1 downto 0);
	SIGNAL rise: STD_LOGIC;

	--adder:
	SIGNAL condInt: std_logic_vector (n-1 downto 0);
	SIGNAL sum: std_logic_vector (n-1 downto 0);
	SIGNAL carry: STD_LOGIC;
	
BEGIN

  PROCESS (clk, rst) --sequntial
  BEGIN
	IF (rst='1') THEN
		din <= (others => '0');
	ELSIF (clk'EVENT and clk='1') THEN
		IF (ena = '1') THEN
			din <= din;
		END IF;
   END IF;
  END PROCESS;
				
	condInt<=std_logic_vector(to_unsigned(cond,n));
	L0: Adder generic map(n) port map(din,condInt,'1',sum,carry); --Adder: din + cond + 1
	PROCESS (din,cond) --combinatorial 
	BEGIN		
		rise <='0';
		IF (carry = '0' and sum = din) THEN
			rise<='1';
		END IF;	
	end PROCESS;
	
	PROCESS  --combinatorial
	BEGIN
		detector<='0';
		IF (count = m+1) THEN
			detector<='1';
		END IF;
	END PROCESS;
	

	PROCESS (clk, rst)  --sequntial
	  BEGIN
		IF (rst='1') THEN
			count <= (others => '0');
		ELSIF (clk'EVENT and clk='1') THEN
			IF (ena = '1') THEN
				IF (rise ='0')
					count<= '0';
				ELSIF(count < m+2) 	THEN
					count <=count + 1;
				ELSE 
					count <= count;
				END IF;
			END IF;
	   END IF;
	  END PROCESS;
	  

	
	
end arc_sys;






