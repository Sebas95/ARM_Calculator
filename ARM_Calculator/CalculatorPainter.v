// Listing 14.6
module CalculatorPainter
   (
    input wire  clk, 
	 input wire  clk100Hz, 
	 input wire ceSS,
	 input wire [3:0] counterTotal,
	 input wire [39:0] numActual,
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
	wire 	bar_left_on, bar_right_on, bar_up_on, bar_down_on, restart_on, erase_on, restart_underline_on, mouse_on;
	wire xo0_on, xo1_on, xo2_on, xo3_on, xo4_on, xo5_on, xo6_on, xo7_on, xo8_on, playing_on_ss;
	
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
	
	localparam X_O_LOCATION = 3;
	
	localparam X_O_SEPARATION = 1;
	
	//Ancho de las casillas
	localparam ANCHOCASILLAS = 63;
	
	//Ancho y largo de las barras	
	localparam ANCHOBARRAS = 2;
	localparam LARGOBARRAS = ANCHOCASILLAS * 3;
	localparam LARGOBARRASH = ANCHOCASILLAS * 5;
	
	//Constantes de la ubicación de las barras
	
	//Ubicacion del GATO 
	
	localparam NUMERAL_X = 175;
	localparam NUMERAL_Y = 190;
	
	//Barra vertical mas izquierda cero
	localparam  BAR_LEFT0_START_X = NUMERAL_X ;
	localparam  BAR_LEFT0_FINAL_X = NUMERAL_X + ANCHOBARRAS + 1;	
	
	//Barra vertical izquierda
	localparam  BAR_LEFT_START_X = NUMERAL_X + ANCHOCASILLAS;
	localparam  BAR_LEFT_FINAL_X = NUMERAL_X + ANCHOCASILLAS + ANCHOBARRAS + 1;
	
	//Barra vertical derecha
	localparam  BAR_RIGHT_START_X = NUMERAL_X + 2*ANCHOCASILLAS;
	localparam  BAR_RIGHT_FINAL_X = NUMERAL_X + 2*ANCHOCASILLAS + ANCHOBARRAS + 1;
	
	//Barra vertical derecha 2
	localparam  BAR_RIGHT2_START_X = NUMERAL_X + 3*ANCHOCASILLAS;
	localparam  BAR_RIGHT2_FINAL_X = NUMERAL_X + 3*ANCHOCASILLAS + ANCHOBARRAS + 1;	
	
	//Barra vertical derecha 3
	localparam  BAR_RIGHT3_START_X = NUMERAL_X + 4*ANCHOCASILLAS;
	localparam  BAR_RIGHT3_FINAL_X = NUMERAL_X + 4*ANCHOCASILLAS + ANCHOBARRAS + 1;		
	
	//Barra vertical derecha 3
	localparam  BAR_RIGHT4_START_X = NUMERAL_X + 5*ANCHOCASILLAS;
	localparam  BAR_RIGHT4_FINAL_X = NUMERAL_X + 5*ANCHOCASILLAS + ANCHOBARRAS + 1;		
	
	//Barras verticales largo
	localparam  BAR_VERTICAL_START_Y = NUMERAL_Y;
	localparam  BAR_VERTICAL_FINAL_Y = NUMERAL_Y + LARGOBARRAS;
	
	//---------------------------------------------------------
	
	//Barra horizontal arriba cero
	localparam  BAR_UP0_START_Y = NUMERAL_Y ;
	localparam  BAR_UP0_FINAL_Y = NUMERAL_Y + ANCHOBARRAS;	

	//Barra horizontal arriba
	localparam  BAR_UP_START_Y = NUMERAL_Y + ANCHOCASILLAS;
	localparam  BAR_UP_FINAL_Y = NUMERAL_Y + ANCHOCASILLAS + ANCHOBARRAS;

	//Barra horizontal abajo
	localparam  BAR_DOWN_START_Y = NUMERAL_Y + 2*ANCHOCASILLAS;
	localparam  BAR_DOWN_FINAL_Y = NUMERAL_Y + 2*ANCHOCASILLAS + ANCHOBARRAS;
	
	//Barra horizontal mas abajo
	localparam  BAR_DOWN2_START_Y = NUMERAL_Y + 3*ANCHOCASILLAS;
	localparam  BAR_DOWN2_FINAL_Y = NUMERAL_Y + 3*ANCHOCASILLAS + ANCHOBARRAS;	
	
	//Barra horizontal mas abajo
	localparam  BAR_DOWN3_START_Y = NUMERAL_Y + 4*ANCHOCASILLAS;
	localparam  BAR_DOWN3_FINAL_Y = NUMERAL_Y + 4*ANCHOCASILLAS + ANCHOBARRAS;		
	
	//Barras horizontales largo
	localparam  BAR_HORIZONTAL_START_X = NUMERAL_X;
	localparam  BAR_HORIZONTAL_FINAL_X = NUMERAL_X + LARGOBARRASH  ;

	//Asigno cuando las barras deben ser pintadas
	
	assign bar_left0_on =  (pix_x > BAR_LEFT0_START_X) && 
								 (pix_x < BAR_LEFT0_FINAL_X) &&
								 (pix_y > BAR_VERTICAL_START_Y) &&
								 (pix_y < BAR_VERTICAL_FINAL_Y + ANCHOCASILLAS);

	
	assign bar_left_on =  (pix_x > BAR_LEFT_START_X) && 
								 (pix_x < BAR_LEFT_FINAL_X) &&
								 (pix_y > BAR_VERTICAL_START_Y) &&
								 (pix_y < BAR_VERTICAL_FINAL_Y + ANCHOCASILLAS);
								
	assign bar_right_on = (pix_x > BAR_RIGHT_START_X) && 
								 (pix_x < BAR_RIGHT_FINAL_X) &&
								 (pix_y > BAR_VERTICAL_START_Y) &&
								 (pix_y < BAR_VERTICAL_FINAL_Y);
								 
	assign bar_right2_on = (pix_x > BAR_RIGHT2_START_X) && 
								 (pix_x < BAR_RIGHT2_FINAL_X) &&
								 (pix_y > BAR_VERTICAL_START_Y) &&
								 (pix_y < BAR_VERTICAL_FINAL_Y);
								 
	assign bar_right3_on = (pix_x > BAR_RIGHT3_START_X) && 
								 (pix_x < BAR_RIGHT3_FINAL_X) &&
								 (pix_y > BAR_VERTICAL_START_Y) &&
								 (pix_y < BAR_VERTICAL_FINAL_Y);	
								 
	assign bar_right4_on = (pix_x > BAR_RIGHT4_START_X) && 
								 (pix_x < BAR_RIGHT4_FINAL_X) &&
								 (pix_y > BAR_VERTICAL_START_Y) &&
								 (pix_y < BAR_VERTICAL_FINAL_Y);								 
//--------------------------------------------								 
								 
	assign bar_up0_on =   (pix_y > BAR_UP0_START_Y) && 
								 (pix_y < BAR_UP0_FINAL_Y) &&
								 (pix_x > BAR_HORIZONTAL_START_X) &&
								 (pix_x < BAR_HORIZONTAL_FINAL_X);									 

	assign bar_up_on =    (pix_y > BAR_UP_START_Y) && 
								 (pix_y < BAR_UP_FINAL_Y) &&
								 (pix_x > BAR_HORIZONTAL_START_X) &&
								 (pix_x < BAR_HORIZONTAL_FINAL_X);								 

	assign bar_down_on =  (pix_y > BAR_DOWN_START_Y) && 
								 (pix_y < BAR_DOWN_FINAL_Y) &&	
								 (pix_x > BAR_HORIZONTAL_START_X) &&
								 (pix_x < BAR_HORIZONTAL_FINAL_X);
								 
	assign bar_down2_on =  (pix_y > BAR_DOWN2_START_Y) && 
								 (pix_y < BAR_DOWN2_FINAL_Y) &&	
								 (pix_x > BAR_HORIZONTAL_START_X) &&
								 (pix_x < BAR_HORIZONTAL_FINAL_X);		

	assign bar_down3_on =  (pix_y > BAR_DOWN3_START_Y) && 
								 (pix_y < BAR_DOWN3_FINAL_Y) &&	
								 (pix_x > BAR_HORIZONTAL_START_X) &&
								 (pix_x < NUMERAL_X + ANCHOCASILLAS + 2);									 

								 

	//Para mostrar siempre el mouse en pantalla
								 
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
	
   assign row_addr_xo1 = pix_y[5:2];
   assign bit_addr_xo1 = pix_x[4:2];
	assign xo7_on = (pix_y[9:6]== X_O_LOCATION ) && (pix_x[9:5]==6);
	assign xo8_on = (pix_y[9:6]== X_O_LOCATION ) && (pix_x[9:5]==8);
	assign xo9_on = (pix_y[9:6]== X_O_LOCATION ) && (pix_x[9:5]==10);
	assign xo4_on = (pix_y[9:6]== X_O_LOCATION + X_O_SEPARATION) && (pix_x[9:5]==6);
	assign xo5_on = (pix_y[9:6]== X_O_LOCATION + X_O_SEPARATION ) && (pix_x[9:5]==8);
	assign xo6_on = (pix_y[9:6]== X_O_LOCATION + X_O_SEPARATION ) && (pix_x[9:5]==10);
	assign xo1_on = (pix_y[9:6]== X_O_LOCATION + 2*X_O_SEPARATION ) && (pix_x[9:5]==6);
	assign xo2_on = (pix_y[9:6]== X_O_LOCATION + 2*X_O_SEPARATION ) && (pix_x[9:5]==8);
	assign xo3_on = (pix_y[9:6]== X_O_LOCATION + 2*X_O_SEPARATION ) && (pix_x[9:5]==10);
	assign xo0_on = (pix_y[9:6]== X_O_LOCATION + 3*X_O_SEPARATION ) && (pix_x[9:5]==6);
	
	assign mult_on= (pix_y[9:6]== X_O_LOCATION   ) && (pix_x[9:5]==12);
	assign div_on = (pix_y[9:6]== X_O_LOCATION ) && (pix_x[9:5]==14);
	assign sum_on = (pix_y[9:6]== X_O_LOCATION + X_O_SEPARATION ) && (pix_x[9:5]==12);	
	assign sub_on = (pix_y[9:6]== X_O_LOCATION + X_O_SEPARATION ) && (pix_x[9:5]==14);	
	assign equal_on = (pix_y[9:6]== X_O_LOCATION + 2*X_O_SEPARATION ) && (pix_x[9:5]==14);
	

	
	wire num_on,num_on1,num_on2,num_on3,num_on4,num_on5,num_on6,num_on7,num_on8,
		num_on9,num_on10;
	localparam firstNum = 14;

	assign num_on1 = (pix_y[9:6]== 1) && (pix_x[9:5]==firstNum);
	assign num_on2 = (pix_y[9:6]== 1) && (pix_x[9:5]==firstNum - 1);
	assign num_on3 = (pix_y[9:6]== 1) && (pix_x[9:5]==firstNum - 2);
	assign num_on4 = (pix_y[9:6]== 1) && (pix_x[9:5]==firstNum - 3);
	assign num_on5 = (pix_y[9:6]== 1) && (pix_x[9:5]==firstNum - 4);
	assign num_on6 = (pix_y[9:6]== 1) && (pix_x[9:5]==firstNum - 5);
	assign num_on7 = (pix_y[9:6]== 1) && (pix_x[9:5]==firstNum - 6);
	assign num_on8 = (pix_y[9:6]== 1) && (pix_x[9:5]==firstNum - 7);
	assign num_on9 = (pix_y[9:6]== 1) && (pix_x[9:5]==firstNum - 8);
	assign num_on10 = (pix_y[9:6]== 1) && (pix_x[9:5]==firstNum - 9);
	
	assign num_on = num_on1 || num_on2 || num_on3 || num_on4 || num_on5 || num_on6 ||
				num_on7 || num_on8 || num_on9 || num_on10;
	
	//Decido si pintar X o Y
   always @*
		begin
			char_addr_xo1 = 11'b0;
			//CUADRO ARRIBA IZQUIERDA
			if(num_on1 && (counterTotal > 0) )
					char_addr_xo1 = {3'b011,numActual[3:0]};
			if(num_on2 && (counterTotal > 1))
					char_addr_xo1 = {3'b011,numActual[7:4]};
			if(num_on3 && (counterTotal > 2))
					char_addr_xo1 = {3'b011,numActual[11:8]};
			if(num_on4 && (counterTotal > 3))
					char_addr_xo1 = {3'b011,numActual[15:12]};
			if(num_on5 && (counterTotal > 4))
					char_addr_xo1 = {3'b011,numActual[19:16]};
			if(num_on6 && (counterTotal > 5))
					char_addr_xo1 = {3'b011,numActual[23:20]};
			if(num_on7 && (counterTotal > 6))
					char_addr_xo1 = {3'b011,numActual[27:24]};	
			if(num_on8 && (counterTotal > 7))
					char_addr_xo1 = {3'b011,numActual[31:28]};	
			if(num_on9 && (counterTotal > 8))
					char_addr_xo1 = {3'b011,numActual[35:32]};	
			if(num_on10 && (counterTotal > 9))
					char_addr_xo1 = {3'b011,numActual[39:36]};					
			if(xo0_on)
					char_addr_xo1 = 11'h30;
			//CUADRO ARRIBA CENTRO
			if(xo1_on)
					char_addr_xo1 = 11'h31;
			//CUADRO ARRIBA DERECHA				
			if(xo2_on)
					char_addr_xo1 = 11'h32;
			//CUADRO ARRIBA IZQUIERDA				
			if(xo3_on)
					char_addr_xo1 = 11'h33;
			//CUADRO ARRIBA CENTRO				
			if(xo4_on)
					char_addr_xo1 = 11'h34;
			//CUADRO ARRIBA DERECHA				
			if(xo5_on)
					char_addr_xo1 = 11'h35;
			//CUADRO ARRIBA IZQUIERDA				
			if(xo6_on)
					char_addr_xo1 = 11'h36;
			//CUADRO ARRIBA CENTRO				
			if(xo7_on)
					char_addr_xo1 = 11'h37;	
			//CUADRO ARRIBA DERECHA				
			if(xo8_on)		
					char_addr_xo1 = 11'h38;
			//CUADRO ARRIBA DERECHA						
			if(xo9_on)
					char_addr_xo1 = 11'h39;
			if(div_on)
					char_addr_xo1 = 11'h25;
			if(mult_on)
					char_addr_xo1 = 11'h78;					
			if(sum_on)
					char_addr_xo1 = 11'h2b;
			if(sub_on)
					char_addr_xo1 = 11'h2d;
			if(equal_on)
					char_addr_xo1 = 11'h40;
					
		end		
  
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
					else if (bar_right_on || bar_left_on || bar_up_on || bar_down_on ||bar_down2_on
						|| bar_up0_on ||bar_left0_on || bar_right2_on || bar_right4_on || bar_right3_on
							|| bar_down3_on) //Si la barra vertical derecha se encuentra encima
						if(pix_x < NUMERAL_X + 3*ANCHOCASILLAS)
						text_rgb = LIGHTBLUE; 
						else 
						text_rgb = PINK;
					else if(xo9_on || xo8_on || xo7_on || xo6_on || xo5_on || xo4_on || xo3_on || 
									xo2_on || xo1_on || xo0_on || mult_on || sum_on || div_on || sub_on
										||equal_on || num_on)
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
	


   assign text_on = {num_on, xo9_on,xo8_on, mouse_on, xo7_on, xo6_on,xo5_on,xo4_on, xo3_on,xo2_on,xo1_on, xo0_on,
								 bar_left_on, bar_right_on, bar_up_on, bar_down_on,bar_down2_on,
								 bar_up0_on,bar_left0_on,bar_right2_on,
								 mult_on,div_on,sum_on,sub_on,equal_on,bar_right4_on,bar_right3_on,
									bar_down3_on};
   //-------------------------------------------
   // Direccion de la rom para escoger el numero deseado
   //-------------------------------------------
   assign rom_addr = {char_addr, row_addr};
   assign font_bit = font_word[~bit_addr];
		

endmodule
