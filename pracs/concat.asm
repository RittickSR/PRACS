DATA SEGMENT
    msg0 db 10,13,"ENTER STRING 1$"
    msg1 db 10,13,"ENTER STRING 2$"
    msg2 db 10,13,"CONCATENED STRING IS $"
    len1 db ?
    len2 db ?
    len3 db ?
DATA ENDS
CODE SEGMENT
    assume cs:code, ds:data
    start:
    mov ax,data
    mov ds,ax
    
    mov ah,09h
    mov dx,offset msg0
    int 21h
    
    mov si,1000h
    mov cx,0000h
    
    l1:mov ah,01h
    int 21h
    cmp al,0dh
    je l1e
    mov [si],al
    inc cl
    inc si
    jmp l1
    l1e:mov len1,cl
    
    mov ah,09h
    mov dx,offset msg1
    int 21h
    
    mov si,2000h
    mov cx,0000h
    
    l2:mov ah,01h
    int 21h
    cmp al,0dh
    je l2e
    mov [si],al
    inc cl
    inc si
    jmp l2
    l2e:mov len2,cl
    
    mov si,1000h
    mov ch,0000h
    mov di,4000h
    mov cl,len1
    mov dh,0000h
    
    l3:mov dl,[si]
    xchg [di],dl
    inc si
    inc di
    inc dh
    loop l3
    
    mov si,2000h
    mov ch,0000h
    mov cl,len2
    
    l4:mov dl,[si]
    xchg [di],dl
    inc si
    inc di
    inc dh
    loop l4
    
    mov len3,dh
    mov ah,09h
    mov dx,offset msg2
    int 21h
    
    mov di,4000h
    mov ch,0000h
    mov cl,len3
    l5:mov dl,[di]
    mov ah,02h
    int 21h
    inc di
    loop l5
    
    mov ah,4ch
    int 21h
    
    output proc
    mov bl,dh
    and bl,0f0h
    ror bl,04h
    add bl,'0'
    mov dl,bl
    mov ah,02h
    int 21h
    
    mov bl,dh
    and bl,0fh
    add bl,'0'
    mov dl,bl
    mov ah,02h
    int 21h
    ret
    endp
CODE ENDS
end start