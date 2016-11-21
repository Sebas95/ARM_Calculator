`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:39:00 11/17/2016 
// Design Name: 
// Module Name:    NumberMemory 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module NumberMemory(
    input clk,
	 input newDigit,
	 input leyendoResultado,
	 input [31:0] resultado,
	 input [3:0] digit,
	 input guardandoReg2,
	 input guardandoReg1,
	 input guardandoOP,

    output wire [31:0] numActual,
	 output wire [31:0] num1,
	 output wire [31:0] num2,
	 output wire [3:0] Operation,
	 output wire [3:0] counterTotal
    );	 
	 reg [31:0] num1Aux = 0;
	 reg [31:0] num2Aux = 0;
	 //reg [3:0] OPAux = 0;
	 reg [3:0] counterTotalAux1 = 0;
	 reg [3:0] counterTotalAux2 = 0;
	 reg [3:0] Operation_Aux = 0;
	 reg entro = 1'b0;
	 
	 always @(posedge clk)
		begin
			if(newDigit & guardandoReg1 & ~guardandoReg2 &~ guardandoOP &~entro)
				begin
					entro = 1'b1;
					counterTotalAux1 = counterTotalAux1 + 1'b1;
					num1Aux = num1Aux << 4;
					num1Aux[3:0] = digit;			
					Operation_Aux = 32'b0;
				end
			else if(newDigit & guardandoReg2 & ~guardandoReg1 &~ guardandoOP & ~entro)
				begin
					entro = 1'b1;				
					counterTotalAux2 = counterTotalAux2 + 1'b1;
					num2Aux = num2Aux << 4;
					num2Aux[3:0] = digit;
					Operation_Aux = 32'b0;
				end
			else if(guardandoOP)
				begin
					Operation_Aux = digit;		
				end
			else
				begin
					if(leyendoResultado)
						begin
							num1Aux = 32'b0;
							num2Aux = 32'b0;
							Operation_Aux = 32'b0;
							counterTotalAux1 = 32'b0;
							counterTotalAux2 = 32'b0;
						end
					else
						if(newDigit)
							entro = 1'b1;
						else
							entro = 1'b0;
				end
		end			
		
	assign numActual = (guardandoReg1 & ~guardandoReg2 &~ guardandoOP) ? num1Aux:
							 (guardandoReg2 & ~guardandoReg1 &~ guardandoOP) ? num2Aux:
							 (leyendoResultado)  ? resultado:
							 32'd15;
							 
	assign counterTotal = (guardandoReg1 & ~guardandoReg2 &~ guardandoOP) ?  counterTotalAux1:
								 (guardandoReg2 & ~guardandoReg1 &~ guardandoOP) ?  counterTotalAux2:
								 (leyendoResultado)  ? 4'b1111:
								 4'b0;
								 
	assign num1 = num1Aux;
	assign num2 = num2Aux;
	assign Operation = Operation_Aux;								 
								

endmodule
