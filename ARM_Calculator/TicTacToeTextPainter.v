// Listing 14.6
module CalculatorPainter
   (
    input wire  clk, 
	 input wire  clk1Hz, 
	 input wire ceSS,
    input wire [9:0] pix_x, pix_y,
	 input wire [7:0] font_word,
	 input wire pixel_tick,	 
	 input wire [9:0] xm, ym,
    output wire [31:0] text_on,
    output reg  [2:0] text_rgb =0,
	 output wire [10:0] rom_addr
   );

   // signal declaration---------------------------------------------------------------------
	
	//Declaration of the column of the characters
	
   reg  [6:0] char_addr=0, char_addr_ss=0, char_addr_s = 0, char_addr_st = 0, char_addr_rt = 0,  char_addr_e = 0, 
	char_addr_xo1 = 0, char_addr_xo2 = 0, char_addr_xo3 = 0, char_addr_xo4 = 0, char_addr_xo5 = 0,
	char_addr_xo6 = 0, char_addr_xo7 = 0,char_addr_xo8 = 0;
	
   reg  [3:0] row_addr=0; 
	
	//Declaration for the row of the characters
	
	wire  [3:0] row_addr_rt, row_addr_ss, row_addr_st, row_addr_e,row_addr_xo1, row_addr_xo2, 
	row_addr_xo3,  row_addr_xo4,  row_addr_xo5,  row_addr_xo6,  row_addr_xo7,  row_addr_xo8;
   reg  [2:0] bit_addr=0; 
	
	//Declaration for the bit of each row of the ROMM
   
	wire [2:0] bit_addr_ss,bit_addr_st, bit_addr_rt, bit_addr_e, bit_addr_xo1, bit_addr_xo1, 
	bit_addr_xo1, bit_addr_xo1 , bit_addr_xo1 ,bit_addr_xo1, bit_addr_xo1, bit_addr_xo1, bit_addr_xo1;
   wire font_bit, score_on;
	
	reg state_on = 0;
	reg [2:0] nextRGB = 3'b000;
	
	//Mouse register
	
	//Initial value
	reg [9:0] mouse_x = 245;
	reg [9:0] mouse_y = 245;
	
	
	//Auxulir value
	wire [9:0] mouse_x_coor;
	wire [9:0] mouse_y_coor;
	
	//Wire to know when the elements are on the screen
	wire 	bar_v1_on, bar_v2_on, bar_h1_on, bar_h2_on, restart_on, erase_on, restart_underline_on, mouse_on;
	wire xo0_on, xo1_on, xo2_on, xo3_on, xo4_on, xo5_on, xo6_on, xo7_on, xo8_on, playing_on_ss;
	
	wire third_bar_on_v;
	wire third_bar_on_v
	
	//Colores Constantes
	localparam BLACK 		= 3'b000;
	localparam RED   		= 3'b100;
	localparam GREEN 		= 3'b010;
	localparam BLUE      = 3'b001;
	localparam WHITE     = 3'b111;
	localparam PINK      = 3'b101;
	localparam YELLOW    = 3'b110;
	localparam LIGHTBLUE = 3'b011;
	
	
	//Constantes de la posición de las x's y o's
	
	localparam X_O_LOCATION = 2;
	
	localparam X_O_SEPARATION = 1;
	
	//Ancho de las casillas
	localparam ANCHOCASILLAS = 80;
	
	//Ancho y largo de las barras	
	localparam ANCHOBARRAS = 2;
	localparam LARGOBARRAS = ANCHOCASILLAS * 3;
	
	//Constantes de la ubicación de las barras
	
	//Ubicacion del GATO 
	
	localparam NUMERAL_X = 150;
	localparam NUMERAL_Y = 100;
	

	
	//Barra vertical 1
	localparam  1_BAR_V_START_X = NUMERAL_X + ANCHOCASILLAS;
	localparam  1_BAR_V_FINAL_X = NUMERAL_X + ANCHOCASILLAS + ANCHOBARRAS + 1;
	
	//Barra vertical 2
	localparam  2_BAR_V_START_X = NUMERAL_X + 2*ANCHOCASILLAS;
	localparam  2_BAR_V_FINAL_X = NUMERAL_X + 2*ANCHOCASILLAS + ANCHOBARRAS + 1;
	
	//Barra vertical 3
	localparam  3_BAR_V_START_X = NUMERAL_X + 3*ANCHOCASILLAS;
	localparam  3_BAR_V_FINAL_X = NUMERAL_X + 3*ANCHOCASILLAS + ANCHOBARRAS + 1;	
	
	//Barra vertical 4
	localparam  4_BAR_V_START_X = NUMERAL_X + 4*ANCHOCASILLAS;
	localparam  4_BAR_V_FINAL_X = NUMERAL_X + 4*ANCHOCASILLAS + ANCHOBARRAS + 1;		

	//Barra vertical 5
	localparam  5_BAR_V_START_X = NUMERAL_X + 5*ANCHOCASILLAS;
	localparam  5_BAR_V_FINAL_X = NUMERAL_X + 5*ANCHOCASILLAS + ANCHOBARRAS + 1;		
	
	//Barras verticales largo
	localparam  BAR_VERTICAL_START_Y = NUMERAL_Y;
	localparam  BAR_VERTICAL_FINAL_Y = NUMERAL_Y + LARGOBARRAS;

	//1 Barra horizontal 
	localparam  1_BAR_H_START_Y = NUMERAL_Y + ANCHOCASILLAS;
	localparam  1_BAR_H_FINAL_Y = NUMERAL_Y + ANCHOCASILLAS + ANCHOBARRAS;

	//2 Barra horizontal 
	localparam  2_BAR_H_START_Y = NUMERAL_Y + 2*ANCHOCASILLAS;
	localparam  2_BAR_H_FINAL_Y = NUMERAL_Y + 2*ANCHOCASILLAS + ANCHOBARRAS;

	//3 Barra horizontal 
	localparam  3_BAR_H_START_Y = NUMERAL_Y + 3*ANCHOCASILLAS;
	localparam  3_BAR_H_FINAL_Y = NUMERAL_Y + 3*ANCHOCASILLAS + ANCHOBARRAS;	

	
	//Barras horizontales largo
	localparam  BAR_HORIZONTAL_START_X = NUMERAL_X;
	localparam  BAR_HORIZONTAL_FINAL_X = NUMERAL_X + LARGOBARRAS;
  

	//Asigno cuando las barras deben ser pintadas
	

	
	assign bar_v1_on =  (pix_x > 1_BAR_V_START_X) && 
								 (pix_x < 1_BAR_V_FINAL_X) &&
								 (pix_y > BAR_VERTICAL_START_Y) &&
								 (pix_y < BAR_VERTICAL_FINAL_Y);
								
	assign bar_v2_on =  (pix_x > 2_BAR_V_START_X) && 
								 (pix_x < 2_BAR_V_FINAL_X) &&
								 (pix_y > BAR_VERTICAL_START_Y) &&
								 (pix_y < BAR_VERTICAL_FINAL_Y);
								 
	assign bar_v3_on = (pix_x > 3_BAR_V_START_X) && 
								 (pix_x < 3_BAR_V_FINAL_X) &&
								 (pix_y > BAR_VERTICAL_START_Y) &&
								 (pix_y < BAR_VERTICAL_FINAL_Y);

	assign bar_v4_on = (pix_x > 4_BAR_V_START_X) && 
								 (pix_x < 4_BAR_V_FINAL_X) &&
								 (pix_y > BAR_VERTICAL_START_Y) &&
								 (pix_y < BAR_VERTICAL_FINAL_Y);	
								 
	assign bar_v5_on = (pix_x > 5_BAR_V_START_X) && 
								 (pix_x < 5_BAR_V_FINAL_X) &&
								 (pix_y > BAR_VERTICAL_START_Y) &&
								 (pix_y < BAR_VERTICAL_FINAL_Y);								 
								 
	assign bar_h1_on =    (pix_y > 1_BAR_H_START_Y) && 
								 (pix_y < 1_BAR_H_FINAL_Y) &&
								 (pix_x > BAR_HORIZONTAL_START_X) &&
								 (pix_x < BAR_HORIZONTAL_FINAL_X);								 

	assign bar_h2_on =  (pix_y > 2_BAR_H_START_Y) && 
								 (pix_y < 2_BAR_H_FINAL_Y) &&	
								 (pix_x > BAR_HORIZONTAL_START_X) &&
								 (pix_x < BAR_HORIZONTAL_FINAL_X);
								 
	assign bar_h3_on =  (pix_y > 3_BAR_H_START_Y) && 
								 (pix_y < 3_BAR_H_FINAL_Y) &&	
								 (pix_x > BAR_HORIZONTAL_START_X) &&
								 (pix_x < BAR_HORIZONTAL_FINAL_X);
							 

								
	assign mouse_on = (pix_x > xm) && (pix_x <xm + 5) && 
							(pix_y > ym) && (pix_y <ym + 5);					

   //-------------------------------------------
   // Temporizador
   //  - Seccion donde se despliega el temporizador
   //  - escala  16-32 
   //-------------------------------------------
   /*assign score_on = (pix_y[9:5]==7) && (pix_x[9:4]<32  && pix_x[9:4]>15);
   assign row_addr_s = pix_y[4:1];
   assign bit_addr_s = pix_x[3:1];
   always @*
      case (pix_x[7:4])	
			4'h0: char_addr_s = 7'h00; //		
			4'h1: char_addr_s = 7'h00; //			
         4'h2: char_addr_s = {3'b011,dig0}; //Aqui escojo segun el digito entrante el que coloco en pantalla
         4'h3: char_addr_s = {3'b011,dig1}; //Aqui escojo segun el digito entrante el que coloco en pantalla		
         4'h4: char_addr_s = 7'h3a; // :
         4'h5: char_addr_s = {3'b011,dig2}; //Aqui escojo segun el digito entrante el que coloco en pantalla
         4'h6: char_addr_s = {3'b011,dig3}; //Aqui escojo segun el digito entrante el que coloco en pantalla
			4'h7: char_addr_s = 7'h00; //
			4'h8: char_addr_s = 7'h00; //
			4'h9: char_addr_s = 7'h00; //
			4'ha: char_addr_s = 7'h00; //
			4'hb: char_addr_s = 7'h00; //
			4'hc: char_addr_s = 7'h00; //
			4'hd: char_addr_s = 7'h00; //
			4'he: char_addr_s = 7'h00; //
			4'hf: char_addr_s = 7'h00; //
			default : char_addr_s = 7'h00;			
      endcase*/
		
		
   //-------------------------------------------
	// -Despliega:
   //   X|_|_
	//	  _|_|_	 
	//    | |
   // -Escala  32-64 
   //-------------------------------------------
	
	localparam X_O_LOCATION_Y = 6;
   assign row_addr_xo1 = pix_y[5:2];
   assign bit_addr_xo1 = pix_x[4:2];
	assign xo0_on = (pix_y[9:6]== X_O_LOCATION ) && (pix_x[9:5]==6);
	assign xo1_on = (pix_y[9:6]== X_O_LOCATION ) && (pix_x[9:5]==8);
	assign xo2_on = (pix_y[9:6]== X_O_LOCATION ) && (pix_x[9:5]==10);
	assign xo3_on = (pix_y[9:6]== X_O_LOCATION + X_O_SEPARATION) && (pix_x[9:5]==6);
	assign xo4_on = (pix_y[9:6]== X_O_LOCATION + X_O_SEPARATION ) && (pix_x[9:5]==8);
	assign xo5_on = (pix_y[9:6]== X_O_LOCATION + X_O_SEPARATION ) && (pix_x[9:5]==10);
	assign xo6_on = (pix_y[9:6]== X_O_LOCATION + 2*X_O_SEPARATION ) && (pix_x[9:5]==6);
	assign xo7_on = (pix_y[9:6]== X_O_LOCATION + 2*X_O_SEPARATION ) && (pix_x[9:5]==8);
	assign xo8_on = (pix_y[9:6]== X_O_LOCATION + 2*X_O_SEPARATION ) && (pix_x[9:5]==10);
	
	//Decido si pintar X o Y
   /*always @*
		begin
			char_addr_xo1 = 7'h0;
			//CUADRO ARRIBA IZQUIERDA
			if(xo0_on)
				if(x_matrix[0])
					char_addr_xo1 = 7'h58;
				else if(o_matrix[0])
					char_addr_xo1 = 7'h4f;			
			//CUADRO ARRIBA CENTRO
			if(xo1_on)
				if(x_matrix[1])
					char_addr_xo1 = 7'h58;
				else if(o_matrix[1])
					char_addr_xo1 = 7'h4f;	
			//CUADRO ARRIBA DERECHA				
			if(xo2_on)
				if(x_matrix[2])
					char_addr_xo1 = 7'h58;
				else if(o_matrix[2])
					char_addr_xo1 = 7'h4f;	
			//CUADRO ARRIBA IZQUIERDA				
			if(xo3_on)
				if(x_matrix[3])
					char_addr_xo1 = 7'h58;
				else if(o_matrix[3])
					char_addr_xo1 = 7'h4f;	
			//CUADRO ARRIBA CENTRO				
			if(xo4_on)
				if(x_matrix[4])
					char_addr_xo1 = 7'h58;
				else if(o_matrix[4])
					char_addr_xo1 = 7'h4f;	
			//CUADRO ARRIBA DERECHA				
			if(xo5_on)
				if(x_matrix[5])
					char_addr_xo1 = 7'h58;
				else if(o_matrix[5])
					char_addr_xo1 = 7'h4f;	
			//CUADRO ARRIBA IZQUIERDA				
			if(xo6_on)
				if(x_matrix[6])
					char_addr_xo1 = 7'h58;
				else if(o_matrix[6])
					char_addr_xo1 = 7'h4f;	
			//CUADRO ARRIBA CENTRO				
			if(xo7_on)
				if(x_matrix[7])
					char_addr_xo1 = 7'h58;
				else if(o_matrix[7])
					char_addr_xo1 = 7'h4f;	
			//CUADRO ARRIBA DERECHA				
			if(xo8_on)
				if(x_matrix[8])
					char_addr_xo1 = 7'h58;
				else if(o_matrix[8])
					char_addr_xo1 = 7'h4f;		
		end		*/
		
  
   //-------------------------------------------
   // Titulo
   //  - Despliega en el label Restart Match
   //  - Escala  16-32 
   //-------------------------------------------
	assign row_addr_rt = pix_y[4:1];
   assign bit_addr_rt = pix_x[3:1];
   assign restart_on = (pix_y[9:5]==13) && (pix_x[9:4]>7) &&(pix_x[9:4]<21);
	always @*
	begin
		char_addr_rt = 7'h00;
		begin				
			case (pix_x[7:4])
				
				4'h0: char_addr_rt = 7'h4d; // M
				4'h1: char_addr_rt = 7'h61; // a
				4'h2: char_addr_rt = 7'h74; // t
				4'h3: char_addr_rt = 7'h63; // c
				4'h4: char_addr_rt = 7'h68; // h
				4'h5: char_addr_rt = 7'h00; // 
				4'h6: char_addr_rt = 7'h00; // 
				4'h7: char_addr_rt = 7'h00; // 
				4'h8: char_addr_rt = 7'h52; // R
				4'h9: char_addr_rt = 7'h65; // e
				4'ha: char_addr_rt = 7'h73; // s
				4'hb: char_addr_rt = 7'h74; // t
				4'hc: char_addr_rt = 7'h61; // a			
				4'hd: char_addr_rt = 7'h72; // r
				4'he: char_addr_rt = 7'h74; // t				
				default : char_addr_rt = 7'h00;
			endcase			
		end
	end	


 //-------------------------------------------
   // Titulo
   //  - Despliega en el label Restart Match
   //  - Escala  16-32 
   //-------------------------------------------
	assign row_addr_e = pix_y[4:1];
   assign bit_addr_e = pix_x[3:1];
   assign erase_on = (pix_y[9:5]==13) && (pix_x[9:4]>21) &&(pix_x[9:4]<33);
	always @*
	begin
		char_addr_e = 7'h00;
		begin				
			case (pix_x[7:4])
				
				4'h0: char_addr_e = 7'h65; // e
				4'h1: char_addr_e = 7'h00; // 
				4'h2: char_addr_e = 7'h00; // 
				4'h3: char_addr_e = 7'h00; // 
				4'h4: char_addr_e = 7'h00; // 
				4'h5: char_addr_e = 7'h00; // 
				4'h6: char_addr_e = 7'h45; // E
				4'h7: char_addr_e = 7'h72; // r
				4'h8: char_addr_e = 7'h61; // a
				4'h9: char_addr_e = 7'h73; // s
				4'ha: char_addr_e = 7'h65; // e
				4'hb: char_addr_e = 7'h00; // 
				4'hc: char_addr_e = 7'h53; // S
				4'hd: char_addr_e = 7'h63; // c
				4'he: char_addr_e = 7'h6f; // o				
				4'hf: char_addr_e = 7'h72; // r
				default : char_addr_e = 7'h00;
			endcase			
		end
	end	


   //-------------------------------------------
   // Titulo
   //  - Despliega en el titulo "Start Playing"
   //  - Escala  32-64 
   //-------------------------------------------
   assign row_addr_ss = pix_y[5:2];
   assign bit_addr_ss = pix_x[4:2];
	assign playing_on_ss = (pix_y[9:6]==1) && ((pix_x[9:5]>2) && (pix_x[9:5]<18));
   always @*
	begin		
		char_addr_ss = 7'h00;
		begin				
			case (pix_x[8:5])
				4'h3: char_addr_ss = 7'h53; // S
				4'h4: char_addr_ss = 7'h74; // t
				4'h5: char_addr_ss = 7'h61; // a
				4'h6: char_addr_ss = 7'h72; // r
				4'h7: char_addr_ss = 7'h74; // t
				4'h8: char_addr_ss = 7'h00; // 
				4'h9: char_addr_ss = 7'h50; // P
				4'ha: char_addr_ss = 7'h6c; // l
				4'hb: char_addr_ss = 7'h61; // a
				4'hc: char_addr_ss = 7'h79; // y
				4'hd: char_addr_ss = 7'h69; // i
				4'he: char_addr_ss = 7'h6e; // n
				4'hf: char_addr_ss = 7'h67; // g
				default : char_addr_ss = 7'h00;
			endcase			
		end
	end


//	Pinta el mouse


	
//-------------------------------------------
// Aqui se escoge cual color enviar a colocar mientras se encuentre cada elemento encima
//-------------------------------------------
   always @*
		begin //Para sincronizar con el pixy evitar indeseados erroes
			if(pixel_tick)
				begin
					text_rgb = 3'b000;  // fonodo negro
					if(mouse_on)
						begin
							text_rgb = GREEN;
						end					
					else if (bar_v2_on || bar_v1_on || bar_h1_on || bar_h2_on) //Si la barra vertical derecha se encuentra encima
						text_rgb = LIGHTBLUE; 
					else if(xo8_on || xo7_on || xo6_on || xo5_on || xo4_on || xo3_on || xo2_on || xo1_on || xo0_on)
						begin
							char_addr = char_addr_xo1;
							row_addr = row_addr_xo1;
							bit_addr = bit_addr_xo1;		
							if(font_bit)
								text_rgb = WHITE;	
							else 
								text_rgb = BLACK;	
						end					
					else
							text_rgb = BLACK;
				end			
				
		end
	


   assign text_on = { xo8_on, mouse_on, xo7_on, xo6_on,xo5_on,xo4_on, xo3_on,xo2_on,xo1_on, xo0_on,
								 bar_v1_on, bar_v2_on, bar_h1_on, bar_h2_on};
   //-------------------------------------------
   // Direccion de la rom para escoger el numero deseado
   //-------------------------------------------
   assign rom_addr = {char_addr, row_addr};
   assign font_bit = font_word[~bit_addr];
		

endmodule
