loop:				; Define a label 'loop', that will allow us
                                ; to jumb back to here to create a loop

	jmp loop		; This instruction jumps to a new memory
				; address refernced by 'loop'. ie. it will
				; run in a loop

times 510 -( $ - $$ ) db 0	; This is a assembler directives.  
				; When compiled, our program must fit 
			        ; into 512 bytes, with the last two bytes 
				; being the magic number, so here, tell our 
				; assembly compiler to pad out our program 
				; with enough zero bytes (db 0) to bring us 
				; to the 510th byte
