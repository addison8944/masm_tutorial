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
	mov ecx, 0
	.WHILE ecx < 2000000000
;		JLGDebug "Loop"
		mov eax, 0
		inc ecx
	.ENDW
;	JLGDebug "End"

	invoke ExitProcess, 0
end start

comment /*
  401000:       b9 00 00 00 00          mov    ecx,0x0
  401005:       eb 06                   jmp    0x40100d
  401007:       b8 00 00 00 00          mov    eax,0x0                     1
  40100c:       41                      inc    ecx                         1
  40100d:       81 f9 00 94 35 77       cmp    ecx,0x77359400              1
  401013:       72 f2                   jb     0x401007                    3
  401015:       6a 00                   push   0x0
  401017:       e8 00 00 00 00          call   0x40101c
  40101c:       ff 25 00 20 40 00       jmp    DWORD PTR ds:0x402000
*/