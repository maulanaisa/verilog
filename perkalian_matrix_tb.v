/* 3x3 Matrix multiplication testbench, input imported from memory_in.list and output exported to memory_out.list
	Isa <isamaulana@windowslive.com>
	October 14, 2020 */

//Set the timescale
`timescale 1 ns/100 ps

module perkalian_matrix_tb();

//input
reg reset;
reg [15:0] Mx1;
reg [15:0] Mx2;
reg [15:0] Mx3;
reg [15:0] N11;
reg [15:0] N21;
reg [15:0] N31;
reg clock;

//output
wire [15:0] temp_out;

//memory
reg [15:0] mem_in [11:0];
reg [15:0] mem_out [2:0];

//port connection
perkalian_matrix add(
	.rst(reset),
  	.col_a(Mx1),
  	.col_b(Mx2),
  	.col_c(Mx3),
  	.row_a(N11),
	.row_b(N21),
	.row_c(N31),
  	.clk(clock),
	.keluaran(temp_out)
 );


initial begin
	N11 = mem_in[9];
	N21 = mem_in[10];
	N31 = mem_in[11];
	reset = 0;
	clock = 0;
	#40;
	Mx1 = mem_in[0]; 
	Mx2 = mem_in[1]; 
	Mx3 = mem_in[2];
	N11 = mem_in[9];
	N21 = mem_in[10];
	N31 = mem_in[11];
	#40;
	mem_out[0] = temp_out; 
	Mx1 = mem_in[3]; 
	Mx2 = mem_in[4]; 
	Mx3 = mem_in[5];
	N11 = mem_in[9];
	N21 = mem_in[10];
	N31 = mem_in[11];
	#40; 
	mem_out[1] = temp_out;
	Mx1 = mem_in[6]; 
	Mx2 = mem_in[7]; 
	Mx3 = mem_in[8];
	N11 = mem_in[9];
	N21 = mem_in[10];
	N31 = mem_in[11];
	mem_out[2] = temp_out;
	#40;
	mem_out[2] = temp_out;
	//write output into memory_out.list
	$writememh ("memory_out.list", mem_out);
	end

//40 ns clock
always #20 clock = !clock; 


initial begin
	$monitor("time = %8d, \n 
	Input\n 
	Mx1 = %4d, Mx2 =%4d, Mx3 =%4d, N11 = %4d, N21 = %4d, N31 = %4d,    \n
	Output\n
	temp_out = %4d", 
	$time, Mx1, Mx2, Mx3, N11, N21, N31, temp_out);
	end

//reading data
initial begin
	$readmemh ("memory_in.list", mem_in);
	end

endmodule