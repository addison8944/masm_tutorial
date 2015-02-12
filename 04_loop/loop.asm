.386
.model flat,stdcall
option casemap:none

ExitProcess proto :DWORD
StdOut proto :DWORD

includelib c:\masm32\lib\masm32.lib
includelib c:\masm32\lib\kernel32.lib

JLGDebug macro message
	local szText
.data
	szText byte message, 13, 10, 0
.code
	push ecx
	invoke StdOut, ADDR szText
	pop ecx
endm

.data

.code
start:
;	JLGDebug "Start(mov)"
	mov ecx, 2000000000
myloop:
;		xor eax, eax
		mov eax, 0             ;1
		loop myloop            ;6
;	JLGDebug "End"
	invoke ExitProcess, 0
end start
