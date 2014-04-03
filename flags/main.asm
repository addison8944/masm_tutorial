include \masm32\include\masm32rt.inc

essai MACRO
	printf("hello\n");
ENDM


show_CF MACRO v1, v2
	mov a, v1
	mov b, v2
	mov eax, v1
	add eax, v2
	mov r, eax
	printf("adding 0x%08X (%i) and 0x%08X (%i) = 0x%08X (%i)\n", a, a, b, b, r, r);
	mov eax, v1
	add eax, v2
	pushf
	mov eax, [esp]
	and eax, 1
	mov my_eax, eax
	popf
	printf("flags=0x%08X (%i)\n", my_eax, my_eax);
ENDM

.data?
	my_eax DWORD ?
	a DWORD ?
	b DWORD ?
	r DWORD ?

.code
start:
	essai
	show_CF 0fffffffeh, 02h
	printf("my_eax=0x%08X (%i)\n", my_eax, my_eax);

	invoke ExitProcess, 0
end start