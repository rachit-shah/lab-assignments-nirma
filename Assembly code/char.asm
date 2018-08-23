data segment
	string db 'abhishah$'
	char db 'c$'
	found db 'FOUND$'
	notfound db 'NOT FOUND$'
data ends

code segment
start:assume ds:data,cs:code,es:data
mov ax,data
mov ds,ax
mov es,ax
lea di,string
mov al,char
mov cx,8
repne scasb
jz fo
jz terminate
fo: 
cmp cx,0
jz NotF
mov ah,09h
lea dx,found
int 21h
jmp terminate
NotF:
mov ah,09h
lea dx,notfound
int 21h
terminate:
mov ah,4ch
int 21h
code ends
end start