data segment
	a db 36h,38h
	o db ?
	arr db ?,?
data ends

code segment
assume	cs:code,ds:data
start:
	mov ax,data
	mov ds,ax
	lea bx,a
	mov ax,0h
	mov ah, [bx]
	sub ah, 30h
	mov al, [bx+1]
	sub al, 30h
	shl al,4
	shr ax,4
	mov o,al
	
	mov bx,0h
	mov bl,o
	shl bx,4
	shr bl,4
	add bh,30h
	add bl,30h
	lea si,arr
	mov [si],bh
	mov [si+1],bl
	
	
	
code ends
end start