data segment
	a db 50h,12h,5h,70h,2h,40h
	len db 5
data ends

code segment
assume	cs:code,ds:data
start:
	mov ax,data
	mov ds,ax
	lea bx,a
	mov cl,len
	mov ch,len
	mov ax,0h

loop1:
	mov cl,len
	lea bx,a
loop2:
	mov al,[bx]
	mov ah,[bx+1]
	cmp al,ah
	js again
	mov dl,[bx]
	xchg [bx+1],dl
	mov [bx],dl

again:
	inc bx
	dec cl
	jnz loop2
	dec ch
	jnz loop1
	
	
code ends
end start
	