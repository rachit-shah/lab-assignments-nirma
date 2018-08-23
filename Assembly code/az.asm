data segment
	o dw 1234h
	arr db ?,?,?,?
data ends

code segment
assume	cs:code,ds:data
start:
	mov ax,data
	mov ds,ax
	mov bx, o
	mov ax,0h
	mov al, bh
	mov cl, bl
	
	shl ax,4
	shr al,4
	shl cx,4
	shr cl,4
	
	add ah,30h
	add al,30h
	add ch,30h
	add cl,30h
	
	lea bx,arr
	mov [bx],ah
	mov [bx+1],al
	mov [bx+2],ch
	mov [bx+3],cl
	
	
	
	
	
	
code ends
end start