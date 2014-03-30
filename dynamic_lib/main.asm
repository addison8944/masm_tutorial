.386
.model flat,stdcall
option casemap:none

Hello             PROTO C :DWORD
Hello2            PROTO C :DWORD
ExitProcess       PROTO :DWORD

includelib my_lib.lib
includelib c:\masm32\lib\kernel32.lib

.data
gName db "Jean-Louis ", 0


.code
start:
	invoke Hello, addr gName
	invoke Hello2, addr gName
	invoke ExitProcess, 0
end start
