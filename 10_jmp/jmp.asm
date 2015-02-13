include \masm32\include\masm32rt.inc

.data?
my_counter DWORD ?
my_line_counter DWORD ?

.code
start:
	printf("Hello\n")
jump:
	printf("Jump\n")
	jmp truc

my_exit:
	printf("Exit\n")
	invoke ExitProcess, 0
truc:
	printf("Truc\n")
	jmp my_exit
END start
