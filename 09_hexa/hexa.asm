include \masm32\include\masm32rt.inc

.data?
my_counter DWORD ?
my_line_counter DWORD ?

.code
start:
	mov my_counter, 0
	mov my_line_counter, 0
	.WHILE my_counter <= 256
		printf("%02x ", my_counter)
		.IF my_line_counter == 15
			printf("\n")
			mov my_line_counter, -1
		.ENDIF
		inc my_counter
		add my_line_counter, 1
	.ENDW
	invoke ExitProcess, 0
END start
