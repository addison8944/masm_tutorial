.686
.model flat, stdcall
option casemap :none

include \masm32\include\kernel32.inc
includelib \masm32\lib\kernel32.lib

include \masm32\include\msvcrt.inc
includelib \masm32\lib\msvcrt.lib

include \masm32\macros\macros.asm

my_printf MACRO args:VARARG
	pushad
	printf args
	popad
ENDM

show_fpu_status MACRO
	pushad
	my_printf("\nFPU picture:\n");
	fsave my_env
	frstor my_env
	xor eax, eax
	mov ax, word ptr my_env[0]
	my_printf("FPU control word=0x%04x\n", eax);
	xor eax, eax
	mov ax, word ptr my_env[4]
	my_printf("FPU status word=0x%04x\n", eax);
	xor eax, eax
	mov ax, word ptr my_env[8]
	my_printf("FPU tag word=0x%04x\n", eax);
	xor eax, eax
	mov eax, dword ptr my_env[12]
	my_printf("FPU instruction pointer=0x%08x\n", eax);
	xor eax, eax
	mov ax, word ptr my_env[16]
	my_printf("FPU code segment=0x%04x\n", eax);
	xor eax, eax
	mov eax, dword ptr my_env[20]
	my_printf("FPU operand address=0x%08x\n", eax);
	xor eax, eax
	mov ax, word ptr my_env[24]
	my_printf("FPU data segment=0x%04x\n", eax);

	mov ecx, 0
	mov eax, 28
	.WHILE ecx < 8
		push dword ptr my_env[eax]
		pop part1
		push dword ptr my_env[eax + 4]
		pop part2
		xor edx, edx
		mov dx, word ptr my_env[eax + 8]
		my_printf("FPU ST(%d)=0x%04x%08x%08x\n", ecx, edx, part2, part1);
		inc ecx
		add eax, 10
	.ENDW
	popad
ENDM

.data
	;x QWORD 0 3FF0 0000 0000 0000h
	x REAL8 1.0
	y REAL8 2.0
	z REAL8 0.0
	my_env db 108 dup (0)
	part1 dd 0
	part2 dd 0
.data?
	my_word dw ?

.code
start:
	my_printf("Number format:\n");
	my_printf("x=0x%I64x\n", x);
	my_printf("x=%f\n", x);
	my_printf("y=0x%I64x\n", y);
	my_printf("y=%f\n", y);

	finit
	show_fpu_status
	fld x
	show_fpu_status
	fld y
	show_fpu_status
	fadd
	show_fpu_status
	fstp z
	show_fpu_status
	my_printf("z=0x%I64x\n", z);
	my_printf("z=%f\n", z);

	; store 2 in st0
	fld y
	fsqrt
	fstp z
	my_printf("z=0x%I64x\n", z);
	my_printf("z=%f\n", z);

	invoke ExitProcess,0
end start
