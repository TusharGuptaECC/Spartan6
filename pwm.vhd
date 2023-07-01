library ieee;
use ieee.std_logic_1164.all;
entity pwm is
port
( clk,inc,dec : in std_logic;
pwm_out : out std_logic
);
end entity;

architecture rtl of pwm is
begin
process (clk)
variable count : integer range 0 to 500;
variable duty_cycle : integer range 100 to 500;
variable i : integer range 0 to 500;

begin
if (rising_edge(clk)) then
count:= count+1;
	if (count = duty_cycle) then
	pwm_out <= '1';
	end if;
	if (count = 500) then
		pwm_out <= '0';
		count:= 0;
		if(inc = '1' and duty_cycle < 450) then

		i:=i+1;

		if i = 500 then
		duty_cycle:= duty_cycle+1;

		i:=0;

		end if;

		else

		duty_cycle:= duty_cycle;

		end if;



		if (dec = '1' and duty_cycle > 50) then

		i:=i+1;

		if i = 500 then
		duty_cycle:= duty_cycle-1;

		i:=0;

		end if;

		else

		duty_cycle:= duty_cycle;
		end if;


end if;
end if;
end process;
end rtl;
