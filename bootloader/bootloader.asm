.286
.model TINY

.code
	cli
	mov ax,cs               ; Setup segment registers
	mov ds,ax               ; Make DS correct
	mov es,ax               ; Make ES correct
	mov ss,ax               ; Make SS correct
	mov bp,7c00h
	mov sp,7c00h            ; Setup a stack
	sti

	; clear screen
	mov al, 02h
	mov ah, 00h
	int 10h

	; show cursor
	mov cx, 0007h
	mov ah, 01h
	int 10h

	; print msg
	mov si, offset msg
putloop:
	mov al,[si]
	add si,1
	cmp al,0
	je finish
	mov ah,0eh
	mov bx,15
	int 10h
	jmp putloop
finish:
	hlt
	jmp finish
msg:
	db "Hello SUPER OS!",13,10,0

	org 1beh
	p1 db 80h, 01h,01h,00h, 07h, 01h,01h,00h, 00h,08h,00h,00h,00h,60h,6fh,74h

	org 1feh
	signature dw 0AA55h

END
