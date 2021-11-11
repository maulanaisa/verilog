/* ALU 16-bit written in verilog
	Isa <isamaulana@windowslive.com>
	September 29, 2020 */


module ALU (A, B, Select, Y, Carry);
	input [15:0] A;  //First input
	wire [15:0] A;
	input [15:0] B; //Second input
	wire [15:0] B;
	input [3:0] Select; //Operation selector
	output [15:0] Y; //Result
	reg [15:0] Y; 
	output Carry; //Keep carry value
	reg Carry;
	reg [16:0] temp;
	always @ ( A,B,Select )
		begin
			//Addition
			if ( Select == 4'b0000)
			begin
				temp = {0,A} + {0,B};
				Y = temp [15:0];
				Carry = temp [16];
			end
			//Subtraction
			else if ( Select == 4'b0001)
			begin
				temp = {0,A} - {0,B};
				Y = temp [15:0];
				Carry = temp [16];
			end
			//multiplication
			else if ( Select == 4'b0010)
			begin
				temp = {0,A} * {0,B};
				Y = temp [15:0];
				Carry = temp [16];
			end
			else
			begin
				temp = 16'bzzzzzzzzzzzzzzzz;
				Y  = temp [15:0];
				Carry  = temp [16];
			end
		end		

endmodule
