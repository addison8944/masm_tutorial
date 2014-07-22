include \masm32\include\masm32rt.inc

.data
gMessage db "Hello World ",13, 10, 0

.code
start:
	mov eax, 1
	mov edx, 0
	mov ebx, 0
	div ebx
	invoke ExitProcess,eax
end start
