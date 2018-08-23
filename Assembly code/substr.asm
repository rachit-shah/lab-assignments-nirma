data segment
 string db 'shah'
 len equ $-string
 substring db 'se'
 len2 equ $-substring
 found db 'FOUND$'
 notfound db 'NOT FOUND$'
data ends

stack_seg segment stack
     dw 100 dup(0)
	 TOS label word
stack_seg ends

code segment 
start: assume ds:data,cs:code,es:data
mov ax,data
mov ds,ax
mov es,ax
lea sp,TOS
lea si,string
lea di,substring
push si
push di
call search
mov ah,4ch
int 21h

search proc near
	push bp
	mov bp,sp
	push si
	push di
	push cx
	push dx
	push ax
	mov cx,len
	mov dx,len2
	mov si,[bp+6]
	mov di,[bp+4]
again:
	mov al,[di]
	cmp [si],al
	jz again2
	dec cx
	jz notF
	inc si
	mov di,[bp+4]
	mov dx,len2
	jmp again
again2:
	dec dx
	jz fo
	dec cx
	jz notF
	inc si
	inc di
	jmp again
fo:
	mov ah,09h
	lea dx,found
	int 21h
	jmp again3
notF:
	mov ah,09h
	lea dx,notfound
	int 21h
again3:
	pop ax
	pop dx
	pop cx
	pop di
	pop si
	pop bp
ret
search endp

code ends
end start