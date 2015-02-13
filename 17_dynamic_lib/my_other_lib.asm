.data
gHello2 db "Hello2 ", 0


.code


Hello2 PROC message:DWORD
	invoke StdOut, addr gHello2
	invoke StdOut, message
	invoke StdOut, addr gEndLine
	ret
Hello2 endp