
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reducedstate is
  Port ( 
        X1, X2, RESET: in std_logic;
        Y1, Y2, Y3: inout std_logic;
        X1_LED, X2_LED, Z: out std_logic
  );
end reducedstate;

architecture Behavioral of reducedstate is

begin

        Y1 <= ((x2 and y1 and y2 and not(y3)) 
                or (x1 and x2 and y2 and not(y3)) 
                or (x1 and x2 and y1 and not(y3))
                or (x1 and y1 and y2 and not(y3))
                or (x2 and y2 and y3)
                or (x2 and y1 and y2)
                or (x1 and x2 and y2)) and reset;

        Y2 <= ((x1 and not(x2) and not(y1))
                or (not(x1) and x2 and not(y1) and y3)
                or (y2 and y3)
                or (x1 and y2)
                or (not(x2) and y2)) and reset;
                
         Y3 <= ((x1 and x2 and not(y2))
                or (x2 and not(y1) and y3)
                or (x2 and not(y2) and y3)
                or (not(x1) and x2 and y3)
                or (not(x2) and y1 and y3)
                or (y1 and not(y2) and y3)
                or (not(x1) and y1 and y3)
                or (x1 and not(y2) and y3)) and reset;
                
        Z <= (x1 and x2 and not(y3)) 
                or (x1 and y1 and y2 and not(y3)) 
                or (x1 and x2 and not(y2));
        
        x1_led <= x1;
        x2_led <= x2;
        
end Behavioral;
