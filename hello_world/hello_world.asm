include \masm32\include\masm32rt.inc

.data
gMessage db "Hello World ",13, 10, 0

.code
start:
	invoke StdOut, OFFSET gMessage
	invoke ExitProcess,eax
end start
