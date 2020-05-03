LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE work.aux_package.all;
USE ieee.numeric_std.ALL;
-------------------------------------------------------------
entity top4 is
	generic (
		n : positive := 8 ;
		m : positive := 7 ;
		k : positive := 3
	); -- where k=log2(m+1)
	port(
		count: in std_logic_vector (k downto 0);
		detector : out std_logic
	);
end top4;
------------- complete the top Architecture code --------------
architecture arc_sys of top4 is

	
BEGIN
	
	PROCESS (count) --combinatorial
	BEGIN		
		detector<='0';
				IF (count = m+1) THEN
					detector<='1';
				END IF;
	end PROCESS;
	
end arc_sys;







