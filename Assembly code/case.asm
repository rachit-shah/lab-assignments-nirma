data segment
	a db 10 dup('$')
	b db 10 dup('$')
	newline db 10,'$'
data ends

code segment
assume	cs:code,ds:data,es:data
start:
	mov ax,data
	mov ds,ax
	mov es,ax
	mov ah,0ah
	lea dx,a
	int 21h
	lea si,a+2
	lea di,b
	mov cl,[a+1]
	mov ch,0h
	
again:	
	lodsb
	mov bl,al
	sub bl,96
	js upper
	
lower:
	sub al,32
	jmp skip
	
upper:	
	add al,32
	
skip:
	stosb
	loop again
	

	mov ah,09h
	lea dx,newline
	int 21h
	lea dx,b
	int 21h
	
	mov ah,4CH
	int 21h
	
code ends
end start