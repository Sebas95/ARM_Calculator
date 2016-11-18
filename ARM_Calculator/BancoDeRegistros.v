
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date:    16:34:09 09/15/2016 
// 
// Restricciones:
//    - Tienen dos entradas de un bit para habilitación de escritura y lectura (REG_W y REG_R respectivamente)
//			Las entradas A_R,B_R,C_w indican direcciones de 0a 32 por lo que son de 5 bits
//			DI es una entrada de 32 bits para escribir el registro DI
//			Las salidas DA,DB son la salida de registros de 32 bits
// Entradas:	
//    - 3.3V para alto, 0V para bajo 
// Salidas: 
//    - 3.3V para alto, 0V para bajo 
// Tiempo de retardo:  Maximum output required time after clock: 3.597ns
// Consumo de Energía: 21 mW
//
// Área:

//  Number of Slice Registers:                 1,024 
//  Number of Slice LUTs:                        664 
//  Number of occupied Slices:                   342
//  Number of MUXCYs used:                         0 
//  Number of LUT Flip Flop pairs used:        1,304
//  Number of bonded IOBs:                       113
//////////////////////////////////////////////////////////////////////////////////
module BancoDeRegistros(
	//entradas
	input clk,
	input WE3,
	input [3:0]A1,
	input [3:0]A2,
	input [3:0]A3,
	input [31:0]WD3,
	input [31:0]r15,
	//salidas
	output reg [31:0]RD1=0,
	output reg [31:0]RD2=0

	
    );
//se declaran todos los 32 registros del banco de registros de 32 bits
//se inicializan en cero
	reg [31:0] R0 = 0;
	reg [31:0] R1 = 0; 
	reg [31:0] R2 = 0; 
	reg [31:0] R3 = 0;
	reg [31:0] R4 = 0; 
	reg [31:0] R5 = 0; 
	reg [31:0] R6 = 0; 
	reg [31:0] R7 = 0;
	reg [31:0] R8 = 0;
	reg [31:0] R9 = 0;
	reg [31:0] R10 = 0;
	reg [31:0] R11 = 0;
	reg [31:0] R12 = 0;
	reg [31:0] R13 = 0;
	reg [31:0] R14 = 0;
	reg [31:0] R15 = 0;
	
	//------------------------------------- LECTURA -----------------------------------------------------------
	always @(posedge clk)//en el flanco positivo de REG_R se leen DA y DB
	begin
			case(A1)//se pregunta cual es la dirección del registro que se requiere
				4'b0000:		RD1= R0;
				4'b0001:		RD1= R1;
				4'b0010:		RD1= R2;
				4'b0011:		RD1= R3;
				4'b0100:		RD1= R4;
				4'b0101:		RD1= R5;
				4'b0110:		RD1= R6;
				4'b0111:		RD1= R7;
				4'b1000:		RD1= R8;
				4'b1001:		RD1= R9;
				4'b1010:		RD1= R10;
				4'b1011:		RD1= R11;
				4'b1100:		RD1= R12;
				4'b1101:		RD1= R13;
				4'b1110:		RD1= R14;
				4'b1111:		RD1= R15;
			endcase	
		
	end
	
		//------------------------------------- LECTURA de2 -----------------------------------------------------------
	always @(*)//en el flanco positivo de REG_R se leen DA y DB
	begin
			case(A2)//se pregunta cual es la dirección del registro que se requiere
				4'b0000:		RD2= R0;
				4'b0001:		RD2= R1;
				4'b0010:		RD2= R2;
				4'b0011:		RD2= R3;
				4'b0100:		RD2= R4;
				4'b0101:		RD2= R5;
				4'b0110:		RD2= R6;
				4'b0111:		RD2= R7;
				4'b1000:		RD2= R8;
				4'b1001:		RD2= R9;
				4'b1010:		RD2= R10;
				4'b1011:		RD2= R11;
				4'b1100:		RD2= R12;
				4'b1101:		RD2= R13;
				4'b1110:		RD2= R14;
				4'b1111:		RD2= R15;
			endcase
		
		
	end
////---------------------------------------ESCRITURA----------------------------------------------------------
	always @(negedge clk ) 

	
		if(~WE3) //write enable 
		begin
	/*	R0<= 32'bz; 
		R1<= 32'bz; 
		R2<= 32'bz; 
		R3<= 32'bz;
		R4<= 32'bz;
		R5<=32'bz;
		R6<= 32'bz;
		R7<=32'bz;
		R8<= 32'bz;
		R9<= 32'bz;
		R10<= 32'bz;
		R11<= 32'bz;
		R12<= 32'bz;
		R13<=32'bz;
		R14<= 32'bz;
		RD2<= 32'bz;
		RD1<= 32'bz;*/
			R15= r15;//siempre se escribe en r15
			case(A3)//se pregunta cual es la dirección del registro que se requiere
				4'b0000: 	R0= WD3; 
				4'b0001:		R1= WD3; 
				4'b0010:		R2= WD3; 
				4'b0011:		R3= WD3;
				4'b0100:		R4= WD3;
				4'b0101:		R5= WD3;
				4'b0110:		R6= WD3;
				4'b0111:		R7= WD3;
				4'b1000:		R8= WD3;
				4'b1001:		R9= WD3;
				4'b1010:		R10= WD3;
				4'b1011:		R11= WD3;
				4'b1100:		R12= WD3;
				4'b1101:		R13= WD3;
				4'b1110:		R14= WD3;
				4'b1111:		R15= r15;
			endcase
		end //end del if
		else     ////  se mantiene el dato igual
		begin
			
			R15= r15;//siempre se escribe en r15
			case(A3)
				4'b0000:		R0= R0;
				4'b0001:		R1= R1;
				4'b0010:		R2= R2;
				4'b0011:		R3= R3;
				4'b0100:		R4= R4;
				4'b0101:		R5= R5;
				4'b0110:		R6= R6;
				4'b0111:		R7= R7;
				4'b1000:		R8= R8;
				4'b1001:		R9= R9;
				4'b1010:		R10= R10;
				4'b1011:		R11= R11;
				4'b1100:		R12= R12;
				4'b1101:		R13= R13;
				4'b1110:		R14= R14;
				//4'b1111:		R15<= R15;
			endcase

		end//end del else
	

endmodule
