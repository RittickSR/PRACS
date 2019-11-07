DATA SEGMENT
    msg0 db 10,13,"ENTER THE DIVIDEND$"
    msg1 db 10,13,"ENTER THE DIVISOR$"
    msg2 db 10,13,"QUOTIENT IS : $"
    msg3 db 10,13,"REMAINDER IS : $"
    divi db ?
    divs db ?
    qo db ?
    rem db ?
DATA ENDS
CODE SEGMENT
    assume cs:code,ds:data
    start:
    mov ax,data
    mov ds,ax
    
    mov ah,09h
    mov dx,offset msg0
    int 21h
    
    mov ah,01h
    int 21h
    sub al,'0'
    rol al,04h
    mov bl,al
    
    mov ah,01h
    int 21h
    sub al,'0'
    add bl,al
    mov divi,bl
    
    mov ah,09h
    mov dx,offset msg1
    int 21h
    
    mov ah,01h
    int 21h
    sub al,'0'
    rol al,04h
    mov bl,al
    
    mov ah,01h
    int 21h
    sub al,'0'
    add bl,al
    mov divs,bl
    
    mov ch,0000h
    mov cl,0000h
    mov al,divi
    back:mov bl,divs
    sub al,bl
    inc cl
    cmp al,bl
    jnc back
    mov qo,cl
    mov rem,al
    
    mov ah,09h
    mov dx,offset msg2
    int 21h
    
    mov bl,qo
    and bl,0f0h
    ror bl,04h
    add bl,'0'
    mov dl,bl
    mov ah,02h
    int 21h
    
    mov bl,qo
    and bl,0fh
    add bl,'0'
    mov dl,bl
    mov ah,02h
    int 21h
    
    mov ah,09h
    mov dx,offset msg3
    int 21h
    
    mov bl,rem
    and bl,0f0h
    ror bl,04h
    add bl,'0'
    mov dl,bl
    mov ah,02h
    int 21h
    
    mov bl,rem
    and bl,0fh
    add bl,'0'
    mov dl,bl
    mov ah,02h
    int 21h
    
    mov ah,4ch
    int 21h
    
CODE ENDS
end start