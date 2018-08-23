data segment
	a db 1h,2h,3h,4h,5h
	len db 5h
	avg dw ?
data ends

code segment
assume	cs:code,ds:data,es:data
start:
	mov ax,data
	mov ds,ax
	lea bx,a
	mov cl,len
	mov ax,0h
	clc
again:
	adc al,[bx]
	adc ah,0
	inc bx
	loop again
	
	mov bl,5h
	div bl
	mov avg,ax
	
	mov ah,4CH
	int 21h
	
	
code ends
end start