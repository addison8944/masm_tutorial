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

timer_reset MACRO
	rdtsc
	mov dword ptr [my_reset], eax
	mov dword ptr [my_reset+4], edx
ENDM

timer_cycle MACRO
	rdtsc
	sub eax, dword ptr [my_reset]
	sbb edx, dword ptr [my_reset+4]
	mov dword ptr [my_cycle], eax
	mov dword ptr [my_cycle+4], edx
	my_printf("my_cycle=%I64d\n", my_cycle);
ENDM

long_minus MACRO result, a, b
	mov eax, dword ptr [a]
	mov edx, dword ptr [a+4]
	sub eax, dword ptr [b]
	sbb edx, dword ptr [b+4]
	mov dword ptr [result], eax
	mov dword ptr [result+4], edx
	my_printf("%I64d - %I64d =%I64d\n", a, b, result);
	my_printf("0x%I64x - 0x%I64x = 0x%I64x\n", a, b, result);
ENDM


.data
	my_reset dq 0
	my_cycle dq 0
	a dq 123456789123456789
	b dq 123456789123456790
	result QWORD 0
.code
start:
	long_minus result, a, b
	timer_reset
	;xor eax, eax
	mov eax, 0
	timer_cycle
	invoke ExitProcess,0
end start
