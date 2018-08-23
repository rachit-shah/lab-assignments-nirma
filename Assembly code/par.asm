data segment
	a dw 10100111b
	eve db 'Parity-Even$'
	odd db 'Parity-Odd$'
data ends

code segment
assume	cs:code,ds:data
start:
	mov ax,data
	mov ds,ax
	mov bx,a
	mov ax,0h
	mov cl,8h
again:
	shr bx,1
	adc al,0h
	loop again
	
	mov bl,2
	div bl
	
	cmp ah,0
	jz ev
	mov ah,09h
	lea dx,odd
	int 21h
	jmp skip

ev:
	mov ah,09h
	lea dx, eve
	int 21h
	
	
skip:
	mov ah,4CH
	int 21h
	
code ends
end start