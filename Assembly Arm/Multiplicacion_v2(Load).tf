		ORR		R1,R1,#69       ;PROVISIONALES PARA CARGAR LOS OPERANDOS DE MEM
		ORR		R2,R2,#91     ;PROVISIONALES PARA CARGAR LOS OPERANDOS DE MEM
		
		
		
		AND		R9,R9,#0        ;pone R9 en cero
		AND		R0,R0,#0        ;pone R0 en cero
		AND		R3,R3,#0		;pone el contador en cero
		ORR		R12,R12,#1      ;se guardaun 1 en R12
		ADD		R9,R9,#65536
		STR		R1,[R9]
		STR		R2,[R9,#4]
		LDR		R1,[R9]    	 ;Load operand 1
		LDR		R2,[R9,#4]	 ;Load operand 2
		
WHILE						 ;LOOP for Keep adding til done
		CMP		R2,R3		 ;Compare counter and operando 2
		ADDNE	R0,R0,R1		 ;If not equal then add 1 to the result
		ADDNE	R3 ,R3,R12      ;If not equal then add 1 to counter
		BNE		WHILE		 ;If not equal then branch to WHILE
		STR		R0, [R9,#8]	 ;When the flags indicate equal then store the result in memory
