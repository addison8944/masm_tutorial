include \masm32\include\masm32rt.inc
include \masm32\include\debug.inc
includelib \masm32\lib\debug.lib

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
	JLGDebug "Start(xor)"
	mov ecx, 2000000000
myloop:
;	xor eax, eax
	mov eax, 0
	loop myloop
	JLGDebug "End"
	invoke ExitProcess, 0
end start
