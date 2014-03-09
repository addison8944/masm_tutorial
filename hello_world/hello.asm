include \masm32\include\masm32rt.inc

.data
HelloWorld db "Hello World!", 13, 10, 0

.data?
	i DWORD ?
	my_esp DWORD ?
	my_value DWORD ?
.code
start:
;mov eax, 1
;mov ebx, 1
;mov ecx, 1
;mov edx, 1
;mov esp, 1
;mov ebp, 1
;mov edi, 1
;mov esi, 1
;mov eax, 2
;mov ebx, 2
;mov ecx, 2
;mov edx, 2
;mov esp, 2
;mov ebp, 2
;mov edi, 2
;mov esi, 2
;
;mov ax, 1
;mov bx, 1
;mov cx, 1
;mov dx, 1
;mov sp, 1
;mov bp, 1
;mov di, 1
;mov si, 1
;mov ax, 2
;mov bx, 2
;mov cx, 2
;mov dx, 2
;mov sp, 2
;mov bp, 2
;mov di, 2
;mov si, 2
;
;mov ah, 1
;mov bh, 1
;mov ch, 1
;mov dh, 1
;mov al, 2
;mov bl, 2
;mov cl, 2
;mov dl, 2




mov i, 15h
mov my_esp, esp
printf("i=%08X (%i)\n", i, i);
printf("my_esp=%08X (%i)\n", my_esp, my_esp);

push 13h
mov my_esp, esp
printf("my_esp=%08X (%i)\n", my_esp, my_esp);

mov edx, [esp] ; read the stack
mov my_value, edx
printf("my_value=%08X (%i)\n", my_value, my_value);


pop my_value
mov my_esp, esp
printf("my_esp=%08X (%i)\n", my_esp, my_esp);
printf("my_value=%08X (%i)\n", my_value, my_value);

printf("--------------------\n");


mov my_esp, esp
printf("my_esp=%08X (%i)\n", my_esp, my_esp);
;push 112h
printf("About to push manually 1h on the stack (mov+sub)\n");

sub esp, 4h
mov eax, 1h
mov [esp], eax
;push 1h
mov my_esp, esp
printf("my_esp=%08X (%i)\n", my_esp, my_esp);

printf("About to push 14h on the stack (push)\n");
push 14h
mov my_esp, esp
printf("my_esp=%08X (%i)\n", my_esp, my_esp);

printf("About to pop manually from the stack (mov [esp], add)\n");
mov edx, [esp] ; read the stack
mov my_value, edx
printf("my_value=%08X (%i)\n", my_value, my_value);
add esp, 4h
mov my_esp, esp
printf("my_esp=%08X (%i)\n", my_esp, my_esp);

printf("About to pop from the stack (pop)\n");
pop my_value
mov my_esp, esp
printf("my_esp=%08X (%i)\n", my_esp, my_esp);
printf("my_value=%08X (%i)\n", my_value, my_value);


invoke StdOut, addr HelloWorld
invoke ExitProcess, 0

end start