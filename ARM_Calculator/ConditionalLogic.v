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
    input [1:0]FlagW,//era de dos bits
    input PCS,
    input RegW,
    input MemW,
    input CLK,
    output wire PCSrc,
    output wire RegWrite,
    output wire MemWrite

    );
	 
	 wire CondEx;
	 reg [1:0]Flags3_2=0;
	 reg [1:0]Flags1_0=0;
	 
	 wire FlagWrite_0 = FlagW[0] & CondEx;
	 wire FlagWrite_1 = FlagW[1] & CondEx;
	 
	ConditionCheck condition_check(
		.Cond(Cond),
		.Flags({Flags3_2[1],Flags3_2[0],Flags1_0[1],Flags1_0[0]}),
		.CondEx(CondEx)
    );
 
		
	
	always @(posedge CLK)
	begin
		if(FlagWrite_1)
		begin
			Flags3_2<= {ALUFlags[3],ALUFlags[2]};
		end
		else
		begin
			Flags3_2<=Flags3_2;
	   end
	 end
	 
	always @(posedge CLK)
	begin
		if(FlagWrite_0)
		begin
			Flags1_0<= {ALUFlags[1],ALUFlags[0]};
		end
		else
		begin
			Flags1_0<=Flags1_0;
	   end
	 end 
	 
	 
	 
	 
	 //logica negativa
	 assign  PCSrc = PCS & CondEx;
	 assign  RegWrite = ~(RegW & CondEx);
	 assign  MemWrite = ~(MemW & CondEx);
	 
	 
	 
endmodule
