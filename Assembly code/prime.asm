data segment
	num dw 57
	newline db 10,'$'
	evenmsg db 'NUM IS EVEN$'
	oddmsg db 'NUM IS ODD$'
	primemsg db 'NUM IS PRIME$'
	notprime db 'NOT PRIME$'
data ends

;STACK SEGMENT INITIALIZATION
stack_seg segment stack
		dw 100 dup(0)
tos label WORD
stack_seg ends

code segment
assume	cs:code,ds:data,ss:stack_seg
start:
	mov ax,data
	mov ds,ax
	mov ax,stack_seg
	mov ss,ax
	lea sp,tos
	
	mov ax,num
	
	call far ptr poe
	
	
	mov ah,4CH
	int 21h
	
code ends



code2 segment
assume cs:code2

poe proc far
	push bx
	push ax
	push cx
	mov cx,ax
	mov bl,2
	div bl
	cmp ah,0
	je evennum
	jmp oddnum
	
	
	evennum:
		mov ah,09h
		lea dx,newline 
		int 21h
		mov ah,09h
		lea dx,evenmsg 
		int 21h
		jmp prime_not
		
	oddnum:
		mov ah,09h
		lea dx,newline 
		int 21h
		mov ah,09h
		lea dx,oddmsg 
		int 21h
	
		mov bl,3
	checkprime:
		mov ax,cx
		cmp bl,cl
		je prime
		div bl
		cmp ah,0
		je prime_not
		inc bl
		jmp checkprime
		
	prime:
		mov ah,09h
		lea dx,newline 
		int 21h
		mov ah,09h
		lea dx,primemsg 
		int 21h
		jmp endl
		
	prime_not:
		mov ah,09h
		lea dx,newline 
		int 21h
		mov ah,09h
		lea dx,notprime 
		int 21h
		
	endl:
		pop cx
		pop ax
		pop bx
		ret

poe endp
code2 ends
end start

