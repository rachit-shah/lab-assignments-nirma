data segment
	string db 5 dup('$')
	a db 5 dup('$')
	b db 5 dup('$')
data ends
extrn convert_reverse:far

stack_seg segment stack
	dw 100 dup(0)
tos label word
stack_seg ends

code segment
start:
	assume cs:code,ds:data,ss:stack_seg
	mov ax,data
	mov ds,ax
	mov ax,stack_seg
	mov ss,ax
	mov sp,tos
	mov al,0
	mov bl,1
	mov si,10
	push ax
	call far ptr convert_reverse
	mov ah,09h
	xchg ch,cl
	mov word ptr string,cx
	lea dx,string
	int 21h
	mov al,0
	mov bl,1
again:
	mov a,al
	mov b,bl
	
	push bx
	call far ptr convert_reverse
	mov ah,09h
	xchg ch,cl
	mov word ptr string,cx
	mov byte ptr string+2,' '
	lea dx,string
	int 21h
	
	mov al,a
	mov bl,b
	add al,bl
	daa
	xchg al,bl
	dec si
	jnz again
	
	mov ah,4CH
	int 21h

code ends
end start