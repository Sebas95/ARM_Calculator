		ORR		R1,R1,#98       ;PROVISIONALES PARA CARGAR LOS OPERANDOS DE MEM
		ORR		R2,R2,#10       ;PROVISIONALES PARA CARGAR LOS OPERANDOS DE MEM





		AND       R9,R9,#0        ;pone R9 en cero
		AND       R0,R0,#0        ;pone R0 en cero
		AND		R3,R3,#0		 ;pone el contador en cero
		ADD		R9,R9,#65536
		STR		R1,[R9]
		STR		R2,[R9,#4]
		LDR		R1,[R9]    	 ;Load operand 1
		LDR		R2,[R9,#4]	 ;Load operand 2
		CMP		R2,#0           ;Check if operand 2 us zero
		BEQ		FIN             ;If true branch to end
WHILE
		CMP		R2,R1           ;Compare to check if R2 y less tan R1
		SUBLS	R1,R1,R2		 ;Sub the 2 operand to 1 operand
		BLS		WHILE		 ;Back to while as the condition apply
FIN
		ORR		R0,R1,R0        ;stores the result in R0
		STR		R0, [R9,#8]	 ;When the flags indicate equal then store the result in memory
