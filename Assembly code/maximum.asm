data segment
	a db 50h,12h,5h,70h,2h,40h
	len db 6
	max db 0
	min db ?
data ends

code segment
assume	cs:code,ds:data
start:
	mov ax,data
	mov ds,ax
	lea bx,a
	mov cl,len
	mov ax,0h
	mov al,[bx]
	mov ah,[bx]
again:
	mov dl,[bx]
	inc bx
	cmp dl,al
	js again2
	mov al,dl
	
again2:
	cmp dl,ah
	jns again3
	mov ah,dl
	
again3:
	dec cl
	jnz again
	mov max,al
	mov min,ah
code ends
end start
	