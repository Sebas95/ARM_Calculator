`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:30:50 08/31/2016 
// Design Name: 
// Module Name:    FrecuencyDivider 
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
module FrecuencyDivider(
   clk_100MHz,
	clk_1Hz,
	counter[26:0]
	
	);
	
	input clk_100MHz;
	output clk_1Hz;
	output [26:0]counter;
	reg [26:0]counter=0;
	reg  clk_1Hz; 
	  
	always @(posedge clk_100MHz)
	begin 
		
		//if(counter>4'd8)
		if(counter>27'd99999998)
		begin
		counter<=27'b0;
		clk_1Hz<=1;
		end 
		else if (counter<27'd50000000)
		begin
			 clk_1Hz<=0;
			 counter<=counter + 1;
		end
		else  
		begin
			clk_1Hz <=1; 
			counter<=counter + 1;
		end
		
	end		

	
	
	

endmodule
