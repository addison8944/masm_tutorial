;include \masm32\include\masm32rt.inc

.386
.model flat,stdcall
option casemap:none

includelib c:\masm32\lib\msvcrt.lib
includelib c:\masm32\lib\kernel32.lib

ExitProcess PROTO :DWORD

; Use of printf macro:
; solution 1
; include \masm32\include\msvcrt.inc

; solution 2
c_msvcrt typedef PROTO C :VARARG
externdef _imp__printf:PTR c_msvcrt
crt_printf equ <_imp__printf>


include c:\masm32\macros\macros.asm

.data
	i DWORD 3

.code
start:
	printf("i=0x%08X (%i)\n", i, i);
	mov i, 151617h
	printf("i=0x%08X (%i)\n", i, i);
	invoke ExitProcess, 0
end start