DATA SEGMENT
    msg0 db 10,13,"ENTER NUMBER$"
    msg1 db 10,13,"FACTORIAL IS$"
    num db ?
DATA ENDS
CODE SEGMENT
    assume cs:code, ds:data
    start:
    mov ax,data
    mov ds,ax
    
    mov ah,09h
    mov dx,offset msg0
    int 21h
    
    mov ah,01h
    int 21h
    sub al,'0'
    
    mov num,al
    
    mov bl,al
    mov al,01h
    mov ah,0000h
    loop1:
    mul bl
    dec bl
    cmp bl,01h
    jnz loop1
    
    mov cl,al
    mov ch,ah
    mov bl,al
    mov bh,ah
    
    mov dx,offset msg1
    mov ah,09h
    int 21h
    
    and ch,0f0h
    ror ch,04h
    add ch,'0'
    mov dl,ch
    mov ah,02h
    int 21h
    
    mov ch,bh
    and ch,0fh
    add ch,'0'
    mov dl,ch
    mov ah,02h
    int 21h
    and cl,0f0h
    ror cl,04h
    add cl,'0'
    mov dl,cl
    mov ah,02h
    int 21h
    
    mov cl,bl
    and cl,0fh
    add cl,'0'
    mov dl,cl
    mov ah,02h
    int 21h
    
    mov ah,4ch
    int 21h
    
CODE ENDS
end start