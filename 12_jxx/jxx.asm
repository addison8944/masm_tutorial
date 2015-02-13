include \masm32\include\masm32rt.inc

.data?
v1 DWORD ?
v2 DWORD ?

.code
start:
	printf("Hello\n")
	;replace the "immediate" values by what you wish to test.
	mov eax, 2
	add eax, 3
	;CF == 0
	;replace ja by the jump you wish to test.
	ja truc

my_exit:
	printf("Exit\n")
	invoke ExitProcess, 0
truc:
	printf("Truc\n")
	jmp my_exit
END start
