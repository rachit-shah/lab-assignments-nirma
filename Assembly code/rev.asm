data segment
	a db 30 dup('$')
	len dw ?
data ends

code segment
assume	cs:code,ds:data
start:
	mov ax,data
	mov ds,ax
	mov ax,0
	mov ah,0ah
	lea dx,a
	int 21h
	mov bx,0
	mov bl,[a+1]
	mov len,bx
	
	lea si,a+2
	mov di,si
	add di,len
	dec di
	
	call reverse_str
	endl:
		mov ah,09h
		lea dx,a+2
		int 21h
		mov ah,4ch
		int 21h	
	reverse_str proc near
		mov ax,len
		mov bl,2
		div bl
		mov cl,al	
		swap:
			mov bp,sp
			mov al,[si]
			xchg al,[di]
			mov [si],al
			inc si
			dec di
			loop swap		
		ret
			
	reverse_str endp
	
	
code ends

end start