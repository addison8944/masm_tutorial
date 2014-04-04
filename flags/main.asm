include \masm32\include\masm32rt.inc

show_flags MACRO f, p_mask
	pushf
	mov eax, [esp]
	and eax, p_mask
	mov my_eax, eax
	popf
	cld
	printf("%s=0x%08X (%i)\n", f, my_eax, my_eax);
ENDM

show_add_CF MACRO v1, v2
	printf("Checking carry flag.\n");
	mov a, v1
	mov b, v2
	mov eax, v1
	add eax, v2
	mov r, eax
	printf("0x%08X (%i) plus 0x%08X (%i) = 0x%08X (%i)\n", a, a, b, b, r, r);
	mov eax, v1
	add eax, v2
	show_flags "CF", 1
ENDM

show_sub_CF MACRO v1, v2
	printf("Checking carry flag.\n");
	mov a, v1
	mov b, v2
	mov eax, v1
	sub eax, v2
	mov r, eax
	printf("0x%08X (%i) minus 0x%08X (%i) = 0x%08X (%i)\n", a, a, b, b, r, r);
	mov eax, v1
	sub eax, v2
	show_flags "CF", 1
ENDM

show_add_PF MACRO v1, v2
	printf("Checking parity flag.\n");
	mov a, v1
	mov b, v2
	mov eax, v1
	add eax, v2
	mov r, eax
	printf("adding 0x%08X (%i) add 0x%08X (%i) = 0x%08X (%i)\n", a, a, b, b, r, r);
	mov eax, v1
	add eax, v2
	show_flags "PF", 4
ENDM

show_add_AF MACRO v1, v2
	printf("Checking adjust flag (BCD).\n");
	mov a, v1
	mov b, v2
	mov eax, v1
	add eax, v2
	daa
	mov r, eax
	printf("adding 0x%08X (%i) bcd add 0x%08X (%i) = 0x%08X (%i)\n", a, a, b, b, r, r);
	mov eax, v1
	add eax, v2
	show_flags "AF", 10h
ENDM

show_add_ZF MACRO v1, v2
	printf("Checking Zero Flag.\n");
	mov a, v1
	mov b, v2
	mov eax, v1
	add eax, v2
	mov r, eax
	printf("adding 0x%08X (%i) add 0x%08X (%i) = 0x%08X (%i)\n", a, a, b, b, r, r);
	mov eax, v1
	add eax, v2
	show_flags "ZF", 40h
ENDM

show_add_SF MACRO v1, v2
	printf("Checking Sign Flag.\n");
	mov a, v1
	mov b, v2
	mov eax, v1
	add eax, v2
	mov r, eax
	printf("adding 0x%08X (%i) add 0x%08X (%i) = 0x%08X (%i)\n", a, a, b, b, r, r);
	mov eax, v1
	add eax, v2
	show_flags "SF", 80h
ENDM

show_TF MACRO
	printf("Checking Trap Flag.\n");
	show_flags "TF", 100h
ENDM

show_IF MACRO
	printf("Checking Interrupt Flag.\n");
	show_flags "IF", 200h
ENDM

show_DF MACRO
	printf("Checking Direction Flag.\n");
	show_flags "DF", 400h
ENDM

show_add_OF MACRO v1, v2
	printf("Checking overflow flag with add.\n");
	mov a, v1
	mov b, v2
	mov eax, v1
	add eax, v2
	mov r, eax
	printf("0x%08X (%i) plus 0x%08X (%i) = 0x%08X (%i)\n", a, a, b, b, r, r);
	mov eax, v1
	add eax, v2
	show_flags "OF", 800h
ENDM

show_sub_OF MACRO v1, v2
	printf("Checking overflow flag with sub.\n");
	mov a, v1
	mov b, v2
	mov eax, v1
	sub eax, v2
	mov r, eax
	printf("0x%08X (%i) minus 0x%08X (%i) = 0x%08X (%i)\n", a, a, b, b, r, r);
	mov eax, v1
	sub eax, v2
	show_flags "OF", 800h
ENDM

.data?
	my_eax DWORD ?
	a DWORD ?
	b DWORD ?
	r DWORD ?

.code
start:
	show_add_CF 0FFFFFFFEh, 2
	show_add_CF 56, -66
	show_sub_CF 56, 66

	show_add_PF 1, 2
	show_add_PF 4, 2
	show_add_PF 4, 3
	show_add_PF 0FFFFFF00h, 34h

	show_add_AF 4, 2
	show_add_AF 4, 8
	show_add_AF 4, 13

	show_add_ZF 4, -4
	show_add_ZF 1, 0

	show_add_SF 1, 1
	show_add_SF 1, -2
	show_add_SF 1, -1

	show_TF
	show_IF

	show_DF
	cld
	show_DF
	std
	show_DF
	cld

	show_add_OF 07FFFFFFFh, 1
	show_add_OF 07FFFFFFEh, 1
	show_sub_OF -07FFFFFFFh, 1
	show_sub_OF -07FFFFFFFh, 2

	invoke ExitProcess, 0
end start