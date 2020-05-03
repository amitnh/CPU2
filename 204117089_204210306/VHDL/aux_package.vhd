LIBRARY ieee;
USE ieee.std_logic_1164.all;


package aux_package is
-----------------------------------------------------------------
	component top is
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
	end component;
-----------------------------------------------------------------
	component top1 is
		generic (
			n : positive := 8 ;
			m : positive := 7 ;
			k : positive := 3
		); -- where k=log2(m+1)
		port(
			rst,ena,clk : in std_logic;
			din : in std_logic_vector(n-1 downto 0);
			dinlast : out std_logic_vector(n-1 downto 0)
		);
	end component;
-----------------------------------------------------------------
component top2 is
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
end component;
-----------------------------------------------------------------
component top3 is
	generic (
		n : positive := 8 ;
		m : positive := 7 ;
		k : positive := 3
	); -- where k=log2(m+1)
	port(
		rst,ena,clk : in std_logic;		
		rise: in STD_LOGIC;
		count: out std_logic_vector (k downto 0)
	);
end component;
-----------------------------------------------------------------
component top4 is
	generic (
		n : positive := 8 ;
		m : positive := 7 ;
		k : positive := 3
	); -- where k=log2(m+1)
	port(
		count: in std_logic_vector (k downto 0);
		detector : out std_logic
	);
end component;
-----------------------------------------------------------------

	component Adder IS
		GENERIC (length : INTEGER := 8);
		PORT ( a, b: IN STD_LOGIC_VECTOR (length-1 DOWNTO 0);
			cin: IN STD_LOGIC;
            s: OUT STD_LOGIC_VECTOR (length-1 DOWNTO 0);
			cout: OUT STD_LOGIC);
	END component;
-----------------------------------------------------------------






  
  
  
  
end aux_package;

