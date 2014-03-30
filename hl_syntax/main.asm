include \masm32\include\masm32rt.inc
include test.inc

.data
gMessage db "Hello World ",13, 10, 0

.code
start:
	; Example of IF THEN ELSE
	printf("IF THEN ELSE Example:\n")
	invoke crt_printf, addr gMessage
	mov eax, 0
	.IF eax == 23
		printf("eax is 23\n")
	.ELSE
		printf("eax is not 23\n")
	.ENDIF
	invoke TestWhile
	invoke TestWhile

	invoke ExitProcess,0
end start
