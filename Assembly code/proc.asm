data segment
	a db '45$'
data ends

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
	mov ax,0
	push word ptr a 
	call far ptr str_int
	
	push bx
	call far ptr int_str
	
	mov ah,4ch
	int 21h
code ends

code2 segment
assume cs:code2
str_int proc far
	mov bp,sp
	add bp, 4
	mov bl, [bp]
	inc bp
	mov bh, [bp]
	xchg bl,bh
	sub bl,30h
	sub bh,30h
	shl bl,4
	shr bx,4
	ret
str_int endp

int_str proc far
	mov bp,sp
	add bp, 4
	mov bx, [bp]
	shl bx,4
	shr bl,4
	
	add bl,30h
	add bh,30h
	ret
int_str endp

code2 ends
end start