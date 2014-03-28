.386
.model flat,stdcall
option casemap:none

StdOut       PROTO STDCALL :DWORD


includelib c:\masm32\lib\masm32.lib
includelib c:\masm32\lib\kernel32.lib

.data
gHello db "Hello ", 0
gEndLine db 13, 10, 0

.code

MyJLGDLLEntryPoint proc hInstDLL:DWORD, reason:DWORD, unused:DWORD
	mov eax, 1
	ret
MyJLGDLLEntryPoint endp

Hello proc message:DWORD
	invoke StdOut, addr gHello
	invoke StdOut, message
	invoke StdOut, addr gEndLine
	ret
Hello endp

End MyJLGDLLEntryPoint