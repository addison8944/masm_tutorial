include \masm32\include\masm32rt.inc

my_printf MACRO args:VARARG
	;pushad
	;printf args
	;popad
ENDM

.data
gHello db "Hello", 13, 10, 0

.code

MyJLGDLLEntryPoint PROC STDCALL hInstDLL:DWORD, reason:DWORD, unused:DWORD
	mov eax, 1
	ret
MyJLGDLLEntryPoint endp

add_array PROC C parray:DWORD, plength:DWORD, pincrement:BYTE
	my_printf("parray=%08x\n", parray);
	my_printf("plength=%d\n", plength);
	xor eax, eax
	mov al, pincrement
	my_printf("pincrement=%08x\n", eax);
	invoke StdOut, addr gHello
	mov ebx, parray
	xor eax, eax
	xor ecx, ecx
	.WHILE ecx < plength
		my_printf("ecx=%d\n", ecx);
		my_printf("plength=%d\n", plength);
		mov al, byte ptr [ebx + ecx]
		add al, pincrement
		mov byte ptr [ebx + ecx], al
		inc ecx
	.ENDW
	my_printf("ecx=%d\n", ecx);
	my_printf("plength=%d\n", plength);

	invoke StdOut, addr gHello
	ret
add_array endp

End MyJLGDLLEntryPoint