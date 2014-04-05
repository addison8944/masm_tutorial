include \masm32\include\masm32rt.inc

my_printf MACRO args:VARARG
	pushad
	printf args
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

	; MOVZX
	my_printf("MOVZX Example (operand with different size)\n");
	mov eax, -1
	mov ebx, -1
	mov bx, 32h
	show_reg "eax", eax
	show_reg "ebx", ebx
	my_printf("movzx eax, bx\n");
	movzx eax, bx
	show_reg "eax", eax


	; MOVSX
	my_printf("MOVSX Example (operand with different size)\n");
	mov eax, -1
	mov ebx, -1
	mov bx, 32h
	show_reg "eax", eax
	show_reg "ebx", ebx
	my_printf("movsx eax, bx\n");
	movsx eax, bx
	show_reg "eax", eax


	; MOVSB
	my_printf("MOVSB Example (memcopy)\n");
.data
	my_str db "Hello", 0
.data?
	mystr2 db 6 dup (?)
.code
	mov esi, offset my_str
	mov edi, offset mystr2
	cld               ; clear direction flag (forward)
	mov ecx,6
	rep movsb         ; copy six times
	my_printf("mystr2=%s\n", offset mystr2);

	; MOVSW
.data
	str3 db "aAbBcCdDeE", 0
.data?
	str3c db 10 dup (?)
.code
	mov esi, offset str3
	mov edi, offset str3c
	cld
	mov ecx,5
	rep movsw
	my_printf("str3c=%s\n", offset str3c);

	; MOVSD
.data
	str4 db "123412341234", 0
.data?
	str4c db 12 dup (?)
.code
	mov esi, offset str4
	mov edi, offset str4c
	cld
	mov ecx,3
	rep movsd
	my_printf("str4c=%s\n", offset str4c);


	; LEA Example
	my_printf("LEA Example\n");
	mov ebx, 1
	mov ecx, 2
	lea eax, [ebx+8*ecx+2]
	show_reg "eax", eax


	; XLAT
.data
	str5 db 50 dup ("guenego123"), 0
.data?
	str5c db 501 dup (?)
.code
	my_printf("XLAT test\n");
	my_printf("str5=\n%s\n", offset str5);
	mov ecx, 0
	mov ebx, offset str5
	mov esi, 0
	.WHILE ecx < 501
		mov eax, ecx
		xlat str5
		mov [offset str5c + esi], eax
		inc esi
		inc ecx
	.ENDW
	my_printf("str5c=\n%s\n", offset str5c);


;	show that xchg with var take far more long than with register.
;	because of the lock of the bus.
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