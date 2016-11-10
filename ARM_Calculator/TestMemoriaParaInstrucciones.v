`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:45:09 11/09/2016
// Design Name:   MemoriaParaIntrucciones
// Module Name:   C:/Users/Giovanni/Documents/GitHub/ARM_Calculator/ARM_Calculator/TestMemoriaParaInstrucciones.v
// Project Name:  ARM_Calculator
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MemoriaParaIntrucciones
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TestMemoriaParaInstrucciones;

	// Inputs
	reg [31:0] address = 32'd0;

	// Outputs
	wire [31:0] dataOutput;

	// Instantiate the Unit Under Test (UUT)
	MemoriaParaIntrucciones uut (
		.address(address), 
		.dataOutput(dataOutput)
	);

	initial begin
		// Initialize Inputs
		address = 32'd8;
		// Wait 100 ns for global reset to finish
		#100;
		address = 32'd104;
		// Wait 100 ns for global reset to finish
		#100;
		address = 32'd100;
		// Wait 100 ns for global reset to finish
		#100;
		address = 32'd2;
		// Wait 100 ns for global reset to finish
		#100;
		address = 32'd16;
		// Wait 100 ns for global reset to finish
		#100;		
		address = 32'd112;
		// Wait 100 ns for global reset to finish
		#100;		
		address = 32'd108;		
		// Wait 100 ns for global reset to finish		
		#100;		
		address = 32'd0;		
		
		
        
		// Add stimulus here

	end
      
endmodule

