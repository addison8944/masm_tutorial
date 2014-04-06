include \masm32\include\masm32rt.inc

my_printf MACRO args:VARARG
	pushad
	printf args
	popad
ENDM

show_reg MACRO my_string, my_register
	my_printf("%s=0x%08x\n", my_string, my_register);
ENDM

.data?
	my_ebp dd ?
	my_esp dd ?

.code
start:
	mov my_ebp, ebp
	mov my_esp, esp
	my_printf("1.0: my_ebp=%08x (%d)\n", my_ebp, my_ebp);
	my_printf("1.0: my_esp=%08x (%d)\n", my_esp, my_esp);
	mov eax, my_ebp
	sub eax, my_esp
	my_printf("eax=%02i\n", eax);

;	enter 0, 5
	push ebp
	mov ebp, esp
	sub esp, 20 ; 5 * 4

	mov my_ebp, ebp
	mov my_esp, esp
	my_printf("2.0: my_ebp=%08x (%d)\n", my_ebp, my_ebp);
	my_printf("2.0: my_esp=%08x (%d)\n", my_esp, my_esp);
	mov eax, my_ebp
	sub eax, my_esp
	my_printf("eax=%02i\n", eax);

;	leave
	mov esp, ebp
	pop ebp


	mov my_ebp, ebp
	mov my_esp, esp
	my_printf("3.0: my_ebp=%08x (%d)\n", my_ebp, my_ebp);
	my_printf("3.0: my_esp=%08x (%d)\n", my_esp, my_esp);
	mov eax, my_ebp
	sub eax, my_esp
	my_printf("eax=%02i\n", eax);

	invoke ExitProcess, 0
end start