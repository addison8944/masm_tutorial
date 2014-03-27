include \masm32\include\masm32rt.inc

Hello proto :LPSTR

.data
gMessage db "Hello ", 0
gName db "Jean-Louis", 0
gEndLine db 13, 10, 0

.data?
gCommandLine LPSTR ?

.code
start:
	invoke GetCommandLine
	mov gCommandLine,eax
	invoke Hello, ADDR gName
	invoke Hello, gCommandLine
	invoke ExitProcess,eax

Hello proc pName:DWORD
	invoke StdOut, ADDR gMessage
	invoke StdOut, pName
	invoke StdOut, ADDR gEndLine
	ret
Hello endp
end start
