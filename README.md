# verilog
simple verilog example projects

## ALU-16bit.v
Verilog code to simulate simple ALU (addition, subtraction and multiplication) for 16-bit input. Model run on Modelsim.

Input and output using decimal


## barrelshifter.v ; barrelshifter_tb.v
Verilog code to simulate barrel shifter for 16-bit input


## perkalian_matrix.v ; perkalian_matrix_tb.v
Verilog code to simulate matrix 3x3 to 3x1 which input comes from external file and output stored in external file

Where it is done sequentially, every clock posted, the ALU will calculate
the output of the 3 input matrix M 3x3 (i-th row) and 3 input matrix N 3x1 (1st column)
```
Mem_out = 
𝑴𝟏𝟏 𝑴𝟏𝟐 𝑴𝟏𝟑
𝑴𝟐𝟏 𝑴𝟐𝟐 𝑴𝟐𝟑
𝑴𝟏𝟑 𝑴𝟐𝟑 𝑴𝟑𝟑
x
𝑵𝟏𝟏
𝑵𝟐𝟏
𝑵𝟑𝟏
```
 
every 40 ns after ALU calculation with output temp_out , Mem-out[i] will receive result
output ALU temp_out , then at the end of the process will be written to memory_out.list.

The clock has a period of 40 ns.

The reset button will result in the value of temp_out = 0
So it can be said that the process of importing data from memory_in.list is done directly
while the Mem_out output of the third address is done sequentially every running hour
from one list temp_out.
