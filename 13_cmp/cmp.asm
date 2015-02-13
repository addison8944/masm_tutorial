include \masm32\include\masm32rt.inc

.data?
v1 DWORD ?
v2 DWORD ?

.code
start:
	printf("Hello\n")
	;replace the "immediate" values by what you wish to test.
	mov eax, 1
	mov ebx, 1
	cmp eax, ebx
	;replace ja by the jump you wish to test.
	je my_equal

my_exit:
	printf("Exit\n")
	invoke ExitProcess, 0
my_equal:
	printf("Equal\n")
	jmp my_exit
END start
