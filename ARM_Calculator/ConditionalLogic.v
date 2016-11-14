`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:13:19 11/10/2016 
// Design Name: 
// Module Name:    ConditionalLogic 
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
module ConditionalLogic(
    input [3:0] Cond,
    input [3:0] ALUFlags,
    input FlagW,//era de dos bits
    input PCS,
    input RegW,
    input MemW,
    input CLK,
    output wire PCSrc,
    output wire RegWrite,
    output wire MemWrite
	 
    );
	 
	 wire CondEx;
	 reg [3:0]Flags;
	 reg Flag_Write;
	 
	ConditionCheck condition_check(
		.Cond(Cond),
		.Flags(Flags),
		.CondEx(CondEx)
    );
 
		 
	always @*
	begin
		Flag_Write <= FlagW & CondEx;
	end
	
	always @(posedge CLK)
	begin
		if(Flag_Write)
		begin
			Flags<=ALUFlags;
		end
		else
		begin
			Flags<=Flags;
	   end
		
	 end
	 
	 //logica negativa
	 assign  PCSrc = ~(PCS & CondEx);
	 assign  RegWrite = ~(RegW & CondEx);
	 assign  MemWrite = ~(MemW & CondEx);
	 
	 
	 
endmodule
