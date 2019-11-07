DATA SEGMENT
    msg0 db 10,13,"1.ACCEPT"
         db 10,13,"2.DISPLAY"
         db 10,13,"3.LENGTH"
         db 10,13,"4.REVERSE"
         db 10,13,"5.PALINDROME"
         db 10,13,"6.EXIT$"
    msg1 db 10,13,"ENTER YOUR STRING$"
    msg2 db 10,13,"ENTERED STRING IS : $"
    msg3 db 10,13,"LENGTH OF STRING IS : $"
    msg4 db 10,13,"REVERSE STRING IS : $"
    msg5 db 10,13,"PALINDROME$"
    msg6 db 10,13,"NOT PALINDROME$"
    len db ?
    choice db ?
DATA ENDS
CODE SEGMENT
    assume cs:code,ds:data
    start:
    mov ax,data
    mov ds,ax
    
    
    labn:mov ah,09h
    mov dx,offset msg0
    int 21h
    
    mov ah,01h
    int 21h
    sub al,'0'
    mov choice,al
    
    cmp al,06h
    jnz labs
    mov ah,4ch
    int 21h
    
    labs:cmp choice,01h
    jnz labd
    mov ah,09h
    mov dx,offset msg1
    int 21h
    call accept
    
    labd:cmp choice,02h
    jnz labl
    mov ah,09h
    mov dx,offset msg2
    int 21h
    call disp1
    
    labl:cmp choice,03h
    jnz labr
    mov ah,09h
    mov dx,offset msg3
    int 21h
    
    mov bl,len
    and bl,0f0h
    ror bl,04h
    add bl,'0'
    mov dl,bl
    mov ah,02h
    int 21h
    
    mov bl,len
    and bl,0fh
    add bl,'0'
    mov dl,bl
    mov ah,02h
    int 21h
    
    labr:cmp choice,04h
    jnz labp
    mov ah,09h
    mov dx,offset msg4
    int 21h
    call disp2
    
    labp:cmp choice,05h
    jnz labe
    call pali
    
    labe:jmp labn
    
    accept proc
    mov si,1000h
    mov cx,0000h
    
    back:
    mov ah,01h
    int 21h
    cmp al,0dh
    je comp
    inc cl
    mov [si],al
    inc si
    jmp back
    
    comp:mov len,cl
    ret
    endp
    
    disp1 proc
    mov cl,len
    mov ch,0000h
    mov si,1000h
    
    disp:
    mov dl,[si]
    mov ah,02h
    int 21h
    inc si
    loop disp
    ret
    endp
    
    
    disp2 proc
    mov cl,len
    mov ch,0000h
    mov si,1000h
    mov di,2000h
    add si,cx
    dec si
    dispo:
    mov dl,[si]
    mov ah,02h
    int 21h
    mov [di],dl
    dec si
    inc di
    loop dispo
    ret
    endp
    
    
    pali proc
    mov si,1000h
    mov di,2000h
    mov cl,len
    mov ch,0000h
    l:mov dl,[si]
    mov dh,[di]
    cmp cl,0
    je l1
    cmp dl,dh
    jne l2
    inc di
    inc si
    dec cl
    jmp l
    l1:mov ah,09h
    mov dx,offset msg5
    int 21h
    ret
    endp
    l2:mov ah,09h
    mov dx,offset msg6
    int 21h
    ret
    endp
CODE ENDS
end start