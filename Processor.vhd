library ieee;
use ieee.std_logic_1164.all;

entity Processor is
	port (clk1		:	in	std_logic;
			clk2		:	in std_logic;
			reg0		:	out std_logic_vector(7 downto 0);
			reg1		:	out std_logic_vector(7 downto 0);		
			reg2		:	out std_logic_vector(7 downto 0);
			reg3		:	out std_logic_vector(7 downto 0);
			instr		:	out std_logic_vector(7 downto 0);
			opcode	:	out std_logic_vector(1 downto 0)
	);
end Processor;

architecture Structural of Processor is
	component ProgramCounter is
		port (clk	:	in	std_logic;
				pc		:	out std_logic_vector(1 downto 0)
		);
	end component;
	
	component InstructionMemory is
		port (pc		:	in std_logic_vector(1 downto 0);
				instr	:	out std_logic_vector(7 downto 0)
		);
	end component;
	
	component RegisterFile is
		port (clk 			:	in std_logic;
				write_en		:	in std_logic;
				write_reg	:	in std_logic_vector(1 downto 0);
				read_reg_1	:	in std_logic_vector(1 downto 0);
				read_reg_2	:	in std_logic_vector(1 downto 0);
				write_data	:	in std_logic_vector(7 downto 0);
				read_data_1	:	out std_logic_vector(7 downto 0);
				read_data_2	:	out std_logic_vector(7 downto 0);
				reg0			:	out std_logic_vector(7 downto 0);
				reg1			:	out std_logic_vector(7 downto 0);
				reg2			:	out std_logic_vector(7 downto 0);
				reg3			:	out std_logic_vector(7 downto 0)
		);
	end component;
	
	component Alu is
		port (in_1		:	in std_logic_vector(7 downto 0);
				in_2		:	in std_logic_vector(7 downto 0);
				result	:	out std_logic_vector(7 downto 0)
		);
	end component;
	
	component DataMemory is
		port (clk 			:	in std_logic;
				write_en		:	in std_logic;
				access_addr	:	in std_logic_vector(7 downto 0);
				write_data	:	in std_logic_vector(7 downto 0);
				read_data	:	out std_logic_vector(7 downto 0)
		);
	end component;
	
	component ControlUnit is
		port (opcode	:	in std_logic_vector(1 downto 0);
				RegWrite	:	out std_logic;
				AluSrc	:	out std_logic;
				MemWrite	:	out std_logic;
				MemtoReg	:	out std_logic
		);
	end component;
	
	component Mux is
		Port( sel	:	in  std_logic;
				a, b	:	in  std_logic_vector(7 downto 0);
				y		:	out std_logic_vector(7 downto 0)
				);
	end component;
	
	component SignExtend is
		port (a	:	in std_logic_vector(1 downto 0);
				b	:	out std_logic_vector(7 downto 0)
		);
	end component;
	
	signal temp0	:	std_logic_vector(1 downto 0);
	signal temp1	:	std_logic_vector(7 downto 0);
	signal temp_0, temp_1, temp_2, temp_3	:	std_logic;
	signal temp2	:	std_logic_vector(7 downto 0); --***
	signal temp3	:	std_logic_vector(7 downto 0);
	signal temp4	:	std_logic_vector(7 downto 0);
	signal temp5	:	std_logic_vector(7 downto 0); --***
	signal temp6	:	std_logic_vector(7 downto 0);
	signal temp7	:	std_logic_vector(7 downto 0);
	signal temp8	:	std_logic_vector(7 downto 0);
	
begin
	U0: ProgramCounter
		port map (clk1, temp0);
	U1: InstructionMemory
		port map (temp0, temp1);
	U2: ControlUnit
		port map (temp1(7 downto 6), temp_0, temp_1, temp_2, temp_3);
	U3: RegisterFile
		port map (clk2, temp_0, temp1(1 downto 0), temp1(5 downto 4), temp1(3 downto 2), temp2, temp3, temp4,
					 reg0, reg1, reg2, reg3);
	U4: Alu
		port map (temp3, temp5, temp6);
	U5: DataMemory
		port map (clk2, temp_2, temp6, temp5, temp7);
	U6: SignExtend
		port map (temp1(3 downto 2), temp8);
	U7: Mux
		port map (temp_1, temp4, temp8, temp5);
	U8: Mux
		port map (temp_3, temp6, temp7, temp2);

	instr <= temp1;
	opcode <= temp1(7 downto 6);
end Structural;
