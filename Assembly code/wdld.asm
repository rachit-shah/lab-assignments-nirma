COMMENT @
	IWM INNOVATIVE - WORD LADDER (MIN PATH FOLLOWED TO REACH TARGET WORD IN DICTIONARY)
	MADE BY: SAGAR VEGAD (14BCE097)
	RACHIT SHAH(14BCE110)
	*words need to be of same length
	EXAMPLE 1: DICTIONARY INPUT
	poon
	plee
	same
	poie
	plie
	plea
	poin
	
	Start word: toon
	target word: plea
	
	OUTPUT: Path length 7
	toon-->poon-->poin-->poie-->plie-->plee-->plea
	
	EXAMPLE 2: DICTIONARY INPUT
	ab
	ac
	dc
	
	
	Start word: toon
	target word: plea
	
	OUTPUT: Path length 7
	toon-->poon-->poin-->poie-->plie-->plee-->plea
	
	EXAMPLE 1: DICTIONARY INPUT
	poon
	plee
	same
	poie
	plie
	plea
	poin
	
	Start word: toon
	target word: plea
	
	OUTPUT: Path length 7
	toon-->poon-->poin-->poie-->plie-->plee-->plea
	
	EXAMPLE 2: DICTIONARY INPUT
	ab
	ac
	dc
	de
	fe
	fh
	gh
	
	
	Start word: bb
	target word: gh
	
	OUTPUT: Path length 8
	bb-->ab-->ac-->dc-->de-->fe-->fh-->gh
	
	EXAMPLE 3: DICTIONARY INPUT
	ab
	ac
	cd
	de
	ef
	fh
	hg
	
	
	Start word: bb
	target word: hg
	
	OUTPUT: Path not found
	bb-->ab-->ac-->??
@


;DATA INITIALIZATION
data segment
	dict db 7*10 dup(0) 			;dictionary of strings
	dicmsg db 'Enter dictionary$'
	lenarr db 7 dup(0)				;length array for each string
	charr db 7 dup(0)				;check if string is already traversed. Already traversed strings are 1 else 0
	tempstr db 10 dup('$')			;temporary string to store input
	inp db 10 dup('$')				;start string
	inpmsg db 'Enter start string$'
	target db 10 dup('$')			;target string
	tarmsg db 'Enter target string$'
	newline db 10,'$'				;newline string
	errmsg db 'PATH NOT FOUND$'
	foundmsg db 'FOUND. PATH LENGTH = $'
	pathmsg db 'Path followed:$'
	count dw ?						;path length
	
data ends

;STACK SEGMENT INITIALIZATION
stack_seg segment stack
		dw 100 dup(0)
tos label WORD
stack_seg ends

code segment
assume	cs:code,ds:data,es:data,ss:stack_seg
start:
	mov ax,data
	mov ds,ax
	mov ax,stack_seg
	mov ss,ax
	lea sp,tos
	mov ax,0
	mov cx,7
	mov di, offset dict		;starting address of dictionary in DI register
	lea bx,lenarr			;starting address of length array in BX register
	mov ah,09h
	lea dx,dicmsg 
	int 21h
	mov ah,09h
	lea dx,newline 
	int 21h
	
	input_dict:													;takes the input from user and stores the words in a dictionary
		mov ah,0ah
		lea dx,tempstr
		int 21h
		mov ah,09h
		lea dx,newline 
		int 21h
		lea si, tempstr
		mov al,[si+1]
		mov [bx],al
		inc bl
    
		more:													;insert the word into dictionary character by character till it encounters '$' 
			mov al, [si+2]
			mov [di], al
			inc si
			inc di
			cmp al, '$'
			jne more
			loop input_dict
	
	;print newline
	mov ah,09h	
	lea dx,newline 
	int 21h
	
	;print input message
	mov ax,0
	mov ah,09h
	lea dx,inpmsg 
	int 21h
	mov ah,09h
	lea dx,newline 
	int 21h
	
	;take input from user
	mov ah,0ah
	lea dx,inp
	int 21h
	mov ah,09h
	lea dx,newline 
	int 21h
	
	;print target message
	mov ah,09h
	lea dx,tarmsg 
	int 21h
	mov ah,09h
	lea dx,newline 
	int 21h
	;take input from user
	mov ah,0ah
	lea dx,target
	int 21h
	mov ah,09h
	lea dx,newline 
	int 21h

	mov cx,0		;counter for path length in CX initialized to 0
	mov bp,0		;counter for Breadth First Search (BFS) loop in BP initialized to 0
	
	mov ah,09h
	lea dx,pathmsg 
	int 21h
	mov ah,09h
	lea dx,newline 
	int 21h
	
	bfs:							; compares the start string and the first word in dictionary and finds that it is adjacent or not
		call getindex
		mov ah,0
		mov di,ax
		lea si, inp+2
		call adjacent
		cmp ah, 1
		je next_word
		cmp bp,6
		je not_found
		jmp bfs
		
	next_word:						; if yes(adjacent found), then delete the word from dictionary(by marking check array to 1), make the current word(di) the start word(si) and then make the next word, the current word(di)
		mov charr[bp],1		;mark word as traversed
		inc bp				;increment bfs counter
		mov si,di			;make current - start
		inc cx				;increment path length
		
		mov ah,09h
		lea dx,newline 
		int 21h
		
		mov ah,09h			;print intermediate word
		mov dx,si 
		int 21h
		
		mov bp,0				;reinitialize the bfs counter to 0 once intermediate node is found
		lea di, target+2			;first compare with the target if equal then found 
		call adjacent
		cmp ah,0
		je found
		call getindex					;else find next index and take next word
		mov ah,0
		mov di, ax
		cmp charr[bp],0
		je check_adjacent
		jmp already_traversed		 ;denotes that the current word is deleted from the dictionary
		
	check_adjacent:
		
		call adjacent
		cmp ah,1
		je next_word
		
	already_traversed:
		inc bp												
		cmp bp,7					;if there is no word in the dictionary that is adjacent then end the code
		je not_found
		call getindex
		mov ah,0
		mov di, ax
		cmp charr[bp],0
		je check_adjacent
		jmp already_traversed
		
		
		
	not_found:							;PRINT PATH NOT FOUND
		mov ah,09h
		lea dx,newline 
		int 21h
		mov ah,09h
		lea dx,errmsg 
		int 21h
		jmp endl
		
	found:								;PRINT PATH FOUND AND PATH LENGTH
		mov ah,09h
		lea dx,newline 
		int 21h
		inc cx
		mov count,cx
		mov ah,09h
		lea dx,foundmsg 
		int 21h
		
		mov al,cl						;displays the length of the path
		aam
		add ax, "00"
		xchg al,ah
		mov dx,ax
		mov ah,02h
		int 21h
		mov dl,dh
		int 21h
		
		jmp endl
		
		
	
	endl:					;END PROGRAM
		mov ah,4CH
		int 21h

;PROCEDURE TO FIND IF GIVEN TWO STRINGS IN SI AND DI ARE ADJACENT(1), EQUAL(0), OR NOT ADJACENT (-1) AND CHANGING AH ACCORDINGLY      OUTPUT IN AH REGISTER
;adjacent means the given two strings have a character differnece of 1 character
adjacent proc near											; compares the two string that they are adjacent or not
	push bx
	push si
	push di
	push cx
	mov bx,0h
	mov cx,0h

	
	char_cmp:												; compares character by character
		mov al,[si]
		cmp [di],al
		je continue
		inc cl
	continue:								
		inc si
		inc di
		cmp cl,1
		jg notadj											
		
		cmp byte ptr [di],'$'								; end of the string 
		jne char_cmp
		
		cmp cl,0									;if all character are same, then strings are equal
		je equal
		
		cmp cl,1									;if character difference is not one, then they are NOT ADJACENT
		jne notadj
		
	adj:
		mov ah,1
		jmp exit_adjacent
		
	notadj:
		mov ah, -1
		jmp exit_adjacent
		
	equal:
		mov ah,0
		jmp exit_adjacent
		
	exit_adjacent:
		pop cx
		pop di 
		pop si
		pop bx
		ret
			
adjacent endp


;PROCEDURE TO FIND THE STARTING ADDRESS(INDEX) OF A WORD IN THE DICTIONARY GIVEN INPUT THE POSITION(BP REGISTER) OF THE WORD IN THE DICTIONARY   OUTPUT IN AL REGISTER
;example moon.$spoon.$toon.$         the output of procedure will be 13 given input 2, i.e., toon has index 13
getindex proc near												; gets the starting address of the index specified in bp register into al 
	push bp		;index
    push si		;lenarr
    push cx
	lea si,lenarr
    mov cx,0h
    cmp bp,0
	je exit_getindex
    again: 
		mov al,[si]
		add cl,al
		add cl,2	;(. and $)
		dec bp
		inc si
		cmp bp,0
		jne again
          
    exit_getindex:
		mov al,cl
		pop cx
		pop si
		pop bp
		ret
          
getindex endp
	
code ends
end start