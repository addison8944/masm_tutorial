include \masm32\include\masm32rt.inc

my_printf MACRO format:REQ, args:VARARG
	pushad
	printf format, args
	popad
ENDM

show_reg MACRO my_string, my_register
	my_printf("%s=0x%08x\n", my_string, my_register);
ENDM

.data
	byte_tbl db 02h,0B3h,16h,22h, 23h, 24h ; Table of bytes

.data?
	my_var DWORD ?

.code
start:
	xor eax, eax
	xor eax, eax
	mov my_var, 0
	inc my_var
	xor eax, eax
	xor eax, eax
	xor eax, eax
	; MOV
	mov eax, -1
	show_reg "eax", eax
	mov ax, 0
	show_reg "eax", eax

	; XCHG
	mov eax, 0
	mov ebx, 3
	xchg eax, ebx
	show_reg "eax", eax
	show_reg "ebx", ebx

	; CMPXCHG
	mov eax, 0123h
	mov edx, 0456h
	mov my_var, 0123h
	show_reg "eax", eax
	show_reg "edx", edx
	show_reg "my_var", my_var
	pushad
	printf("cmpxchg my_var, edx\n");
	popad
	cmpxchg my_var, edx
	.IF ZERO?
		pushad
		printf("zero flag set\n");
		popad
	.ELSE
		pushad
		printf("zero flag not set\n");
		popad
	.ENDIF
	show_reg "eax", eax
	show_reg "edx", edx
	show_reg "my_var", my_var



;	mov eax, 0
;	mov edx, 0
;	mov ebx, 3
;	mov my_var, 0
;	mov ecx, 0
;	.WHILE ecx < 1000000000
;		xchg my_var, ebx
;		xchg edx, ebx
;		inc ecx
;	.ENDW

	invoke ExitProcess, 0
end start