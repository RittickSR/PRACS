DATA SEGMENT
    msg0 db 10,13,"ENTER THE NUMBER OF NUMBERS$"
    msg1 db 10,13,"ENTER A NUMBER$"
    msg2 db 10,13,"THE MAXIMUM NUMBER IS : $"
    count db ?
    max db ?
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
    mov count,al
    
    mov ah,09h
    mov dx,offset msg1
    int 21h
    
    mov ah,01h
    int 21h
    sub al,'0'
    mov bl,al
    rol bl,04h
    
    mov ah,01h
    int 21h
    sub al,'0'
    add bl,al
    
    mov max,bl
    mov bh,bl
    mov bh,max
    
    mov ch,0000h
    mov cl,count
    dec cl
    
    comp:
    mov bh,max
    mov ah,09h
    mov dx,offset msg1
    int 21h
    
    mov ah,01h
    int 21h
    sub al,'0'
    mov bl,al
    rol bl,04h
    
    mov ah,01h
    int 21h
    sub al,'0'
    add bl,al
    
    mov ah,max
    mov al,bl
    cmp ah,al
    jnc l
    mov max,al
    jmp b
    l:mov max,ah
    b:loop comp
    
    mov ah,09h
    mov dx,offset msg2
    int 21h
    
    mov bl,max
    and bl,0f0h
    ror bl,04h
    add bl,'0'
    mov dl,bl
    mov ah,02h
    int 21h
    
    mov bl,max
    and bl,0fh
    add bl,'0'
    mov dl,bl
    mov ah,02h
    int 21h
    
    mov ah,4ch
    int 21h
    
CODE ENDS
end start