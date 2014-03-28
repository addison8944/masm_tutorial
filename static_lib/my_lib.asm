.386
.model flat,stdcall
option casemap:none

StdOut       PROTO :DWORD


includelib c:\masm32\lib\masm32.lib

.data
gHello db "Hello ", 0
gEndLine db 13, 10, 0

.code
lib:
Hello proc message:DWORD
	invoke StdOut, addr gHello
	invoke StdOut, message
	invoke StdOut, addr gEndLine
	ret
Hello endp
end lib
