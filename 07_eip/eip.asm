include \masm32\include\masm32rt.inc

show_reg MACRO my_string, my_register
	push eax
	mov my_var, my_register
	printf("%sxx=0x%08x\n", my_string, my_register);
	pop eax
ENDM

.data?
	my_var DWORD ?

.code
get_eip:
	mov eax, [esp]
	ret
start:
	call get_eip
	show_reg "eax", eax
	show_reg "eax", eax
	inkey
	invoke ExitProcess, 0
end start