.386
.model flat, stdcall
option casemap :none

MessageBoxA   PROTO :DWORD, :DWORD, :DWORD, :DWORD
ExitProcess  PROTO :DWORD

.data
gMessage db "Hello World ",13, 10, 0
gMessage2 db "Coucou World ",13, 10, 0

.code
start:
	push 4
	push OFFSET gMessage
	push OFFSET gMessage2
	push 0
	call MessageBoxA
	push eax
	call ExitProcess
end start
