include \masm32\include\masm32rt.inc

show_reg MACRO my_string, my_register
	pushad
	mov my_var, my_register
	printf("%s=0x%08x\n", my_string, my_register);
	popad
ENDM

.data
	byte_tbl db 02h,0B3h,16h,22h, 23h, 24h ; Table of bytes

.data?
	my_var DWORD ?

.code
start:
	; IMMEDIATE ADDRESSING
	; --------------------
	; mov immediate value
	mov eax, -1
	mov ax, 0
	show_reg "eax", eax

	; mov immediate value (hexa)
	mov eax, -1
	mov ax, 010Ch
	show_reg "eax", eax

	; mov immediate value (hexa)
	mov eax, -1
	mov ax, [1234h]
	show_reg "eax", eax

	; DIRECT MEMORY ADDRESSING
	; ------------------------
	; mov var content
	mov eax, -1
	mov al, byte_tbl[1]
	show_reg "eax", eax

	; mov var content (byte_tbl = byte_tbl[0])
	mov eax, -1
	mov al, byte_tbl
	show_reg "eax", eax

	; mov var content word
	mov eax, -1
	mov ax, word ptr byte_tbl
	show_reg "eax", eax

	; mov var content dword
	mov eax, -1
	mov eax, dword ptr byte_tbl
	show_reg "eax", eax

	; mov var content dword and offset
	mov eax, -1
	mov eax, dword ptr byte_tbl[1]
	show_reg "eax", eax

	; mov var content dword and offset
	mov eax, -1
	mov eax, dword ptr [byte_tbl+2]
	show_reg "eax", eax

	; REGISTRY ADDRESSING
	; -------------------
	; mov memory content
	mov eax, -1
	mov ebx, 00401000h
	mov eax, ebx
	show_reg "eax", eax

	; REGISTRY INDIRECT (BASE)
	; -----------------

	; mov memory content
	mov eax, -1
	mov ebx, 00401000h
	mov al, byte ptr [ebx]
	show_reg "eax", eax

	; REGISTRY INDIRECT (BASE + DISPLACEMENT)
	; -----------------

	; mov memory content
	mov eax, -1
	mov ebx, 00401000h
	mov al, byte ptr [ebx + 5]
	show_reg "eax", eax

	; REGISTRY INDIRECT (BASE + INDEX + DISPLACEMENT)
	; -----------------

	; mov memory content
	mov eax, -1
	mov ebx, 00401000h
	mov ecx, 1
	mov eax, word ptr [ebx + ecx + 5]
	show_reg "eax", eax



	invoke ExitProcess, 0
end start