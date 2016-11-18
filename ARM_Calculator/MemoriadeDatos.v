`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:39:21 11/01/2016 
// Design Name: 
// Module Name:    MemoriadeDatos 
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
module MemoriadeDatos(
    input clk,
    input writeEnable,
    input [31:0] dataInput,
	 input [31:0] address,
    output reg [31:0] dataOutput
    );
	 	 
	 reg [31:0] RAM_0 = 32'b0;
	 reg [31:0] RAM_4 = 32'b0;
	 reg [31:0] RAM_8 = 32'b0;
	 reg [31:0] RAM_12 = 32'b0;
	 reg [31:0] RAM_16 = 32'b0;
	 reg [31:0] RAM_20 = 32'b0;
	 reg [31:0] RAM_24_ = 32'b0;
	 reg [31:0] RAM_28 = 32'b0;
	 reg [31:0] RAM_32 = 32'b0;
	 reg [31:0] RAM_36 = 32'b0;
	 reg [31:0] RAM_40 = 32'b0;
	 reg [31:0] RAM_44 = 32'b0;
	 reg [31:0] RAM_48 = 32'b0;
	 reg [31:0] RAM_52 = 32'b0;
	 reg [31:0] RAM_56 = 32'b0;
	 reg [31:0] RAM_60 = 32'b0;
	 reg [31:0] RAM_64 = 32'b0;
	 reg [31:0] RAM_2000 = 32'b0;
	 
	 //Cada negedge si el writeEnlable está activo entonces escribe el dato
	 always@(posedge clk)
	 begin
		if(~writeEnable)
			begin
				case(address)
					32'h0: RAM_0 = dataInput;
					32'h4: RAM_4 = dataInput;
					32'h8: RAM_8 = dataInput;
					32'hC: RAM_12 = dataInput;
					32'h10: RAM_16 = dataInput;
					32'h14: RAM_20 = dataInput;
					32'h18: RAM_24_ = dataInput;
					32'h1C: RAM_28 = dataInput;
					32'h20: RAM_32 = dataInput;
					32'h24: RAM_36 = dataInput;
					32'h28: RAM_40 = dataInput;
					32'h2C: RAM_44 = dataInput;
					32'h30: RAM_48 = dataInput;
					32'h34: RAM_52 = dataInput;
					32'h38: RAM_56 = dataInput;
					32'h3C: RAM_60 = dataInput;
					32'h40: RAM_64 = dataInput;
					default: RAM_2000 = 32'b0;
				endcase
			end
		
	 end //end del always
	 //Cada posedge dejo salir el dato en el valor de address actual
	 always@(posedge clk)
			begin
				case(address)
					32'h0: dataOutput = RAM_0;
					32'h4: dataOutput = RAM_4;
					32'h8: dataOutput = RAM_8;
					32'hC: dataOutput = RAM_12;
					32'h10: dataOutput = RAM_16;
					32'h14: dataOutput = RAM_20;
					32'h18: dataOutput = RAM_24_;
					32'h1C: dataOutput = RAM_28;
					32'h20: dataOutput = RAM_32;
					32'h24: dataOutput = RAM_36;
					32'h28: dataOutput = RAM_40;
					32'h2C: dataOutput = RAM_44;
					32'h30: dataOutput = RAM_48;
					32'h34: dataOutput = RAM_52;
					32'h38: dataOutput = RAM_56;
					32'h3C: dataOutput = RAM_60;
					32'h40: dataOutput = RAM_64;
					default: dataOutput = 32'b0;
				endcase
			end
endmodule
