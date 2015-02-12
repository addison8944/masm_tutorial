.386
.model flat, stdcall
option casemap :none

StdOut       PROTO :DWORD
ExitProcess  PROTO :DWORD

.data
gMessage db "Hello World ",13, 10, 0

.code
start:
	push OFFSET gMessage
	call StdOut
	push eax
	call ExitProcess
end start
