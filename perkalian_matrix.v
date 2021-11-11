/* Multiplication function used in perkalian_matrix_tb.v
	Isa <isamaulana@windowslive.com>
	October 14, 2020 */

module perkalian_matrix(row_a,row_b,row_c,col_a,col_b,col_c,rst,clk,keluaran);

	input rst;
	input clk;
	input [15:0] row_a;
	input [15:0] col_a;
	input [15:0] row_b;
	input [15:0] col_b;
	input [15:0] row_c;
	input [15:0] col_c;

	output [15:0] keluaran;

	reg [15:0] result;
	
	always@(posedge clk or rst)
	begin
		if (rst == 0)  begin

			result = row_a*col_a + row_b*col_b + row_c*col_c;

			end
		else result = 0;

	end

			
	assign keluaran = result;

endmodule