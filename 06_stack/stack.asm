include \masm32\include\masm32rt.inc

.data
HelloWorld db "Hello World!", 13, 10, 0

.data?
	my_esp DWORD ?
	i DWORD ?
	my_edx DWORD ?
	my_pop DWORD ?
.code
start:
printf("Test push/pop--------------------\n");
mov my_esp, esp
printf("my_esp before push=0x%08X (%i)\n", my_esp, my_esp);
printf("push 13h\n");
push 13h
mov my_esp, esp
printf("my_esp after push=0x%08X (%i)\n", my_esp, my_esp);
printf("read stack content into edx\n");
mov edx, [esp] ; read the stack
mov my_edx, edx
printf("my_edx=0x%08X (%i)\n", my_edx, my_edx);

printf("poping my_pop\n");
pop my_pop
mov my_esp, esp
printf("my_esp=0x%08X (%i)\n", my_esp, my_esp);
printf("my_pop=0x%08X (%i)\n", my_pop, my_pop);

printf("Simulate push with sub and mov------------\n");

mov my_esp, esp
printf("my_esp before push=0x%08X (%i)\n", my_esp, my_esp);
printf("push 13h (sub esp, 4 then mov [esp], val):\n");
sub esp, 4h
mov eax, 13h
mov [esp], eax
mov my_esp, esp
printf("my_esp after push=0x%08X (%i)\n", my_esp, my_esp);
printf("read stack content into edx\n");
mov edx, [esp] ; read the stack
mov my_edx, edx
printf("my_edx=0x%08X (%i)\n", my_edx, my_edx);

printf("poping my_pop\n");
pop my_pop
mov my_esp, esp
printf("my_esp=0x%08X (%i)\n", my_esp, my_esp);
printf("my_pop=0x%08X (%i)\n", my_pop, my_pop);
printf("Simulate pop with mov and add------------\n");

mov my_esp, esp
printf("my_esp before push=0x%08X (%i)\n", my_esp, my_esp);
printf("push 13h\n");
push 13h
mov my_esp, esp
printf("my_esp after push=0x%08X (%i)\n", my_esp, my_esp);
printf("read stack content into edx\n");
mov edx, [esp] ; read the stack
mov my_edx, edx
printf("my_edx=0x%08X (%i)\n", my_edx, my_edx);

printf("poping my_pop with mov and add\n");
mov eax, [esp]
mov my_pop, eax
add esp, 4h
mov my_esp, esp
printf("my_esp=0x%08X (%i)\n", my_esp, my_esp);
printf("my_pop=0x%08X (%i)\n", my_pop, my_pop);
printf("End--------------------\n");


invoke ExitProcess, 0

end start