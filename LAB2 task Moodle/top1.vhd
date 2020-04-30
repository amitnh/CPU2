LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE work.aux_package.all;
USE ieee.numeric_std.ALL;
-------------------------------------------------------------
entity top1 is
	generic (
		n : positive := 8 ;
		m : positive := 7 ;
		k : positive := 3
	); -- where k=log2(m+1)
	port(
		rst,ena,clk : in std_logic;
		din : in std_logic_vector(n-1 downto 0);
	    dinLast: out std_logic_vector (n-1 downto 0)

	);
end top1;
------------- complete the top Architecture code --------------
architecture arc_sys of top1 is

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
				

	
end arc_sys;







