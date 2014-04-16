.386
.MMX
.model flat,stdcall
option casemap:none


includelib c:\masm32\lib\msvcrt.lib
includelib c:\masm32\lib\kernel32.lib

includelib \masm32\lib\masm32.lib

include \masm32\include\masm32.inc
include \masm32\include\msvcrt.inc
include c:\masm32\macros\macros.asm

my_printf MACRO args:VARARG
	;pushad
	;printf args
	;popad
ENDM

.data
gHello db "MMX", 13, 10, 0

.code

MyJLGDLLEntryPoint PROC STDCALL hInstDLL:DWORD, reason:DWORD, unused:DWORD
	mov eax, 1
	ret
MyJLGDLLEntryPoint endp

add_array PROC C parray:DWORD, plength:DWORD, pincrement:BYTE
	LOCAL lincrement:QWORD
	my_printf("parray=%08x\n", parray);
	my_printf("plength=%d\n", plength);
	xor eax, eax
	mov al, pincrement
	my_printf("pincrement=%08x\n", eax);

	xor ecx, ecx
	.WHILE ecx < 8
		mov byte ptr [lincrement + ecx], al
		inc ecx
	.ENDW
	invoke StdOut, addr gHello
	mov ebx, parray
	xor eax, eax
	xor ecx, ecx
	.WHILE ecx < plength
		my_printf("ecx=%d\n", ecx);
		my_printf("plength=%d\n", plength);
		movq mm0, qword ptr [ebx + ecx]

		PADDUSB mm0, lincrement
		movq qword ptr [ebx + ecx], mm0
		add ecx, 8
	.ENDW
	my_printf("ecx=%d\n", ecx);
	my_printf("plength=%d\n", plength);

	invoke StdOut, addr gHello
	ret
add_array endp

End MyJLGDLLEntryPoint