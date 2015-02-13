include \masm32\include\masm32rt.inc
include test.inc

.data
gLoopMessage db "Doing a loop...",13, 10, 0

.code
;mon_label:
	TestWhile PROC
		LOCAL my_eax:DWORD
		printf("WHILE Example:\n")
		mov my_eax, 0
		.WHILE my_eax <= 10
			printf("eax is %i\n", my_eax)
			inc my_eax
		.ENDW
		ret
	TestWhile ENDP
END
