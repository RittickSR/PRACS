DATA SEGMENT
    msg1 db 10,13,"ENTER THE NUMBER OF NUMBERS :$"
    msg2 db 10,13,"ENTER A NUMBER :$"
    msg3 db 10,13,"THE AVERAGE IS :$"
    msg4 db 10,13,"COUNT TAKEN$"
    count db ?
    total db ?
    result db ?
DATA ENDS
CODE SEGMENT
    assume cs:code,ds:data
    start:
    mov ax,data
    mov ds,ax
    
    mov ah,09h
    mov dx,offset msg1
    int 21h
    
    mov ah,01h
    int 21h
    sub al,'0'
    mov count,al
    
    
    mov cl,al
    mov bh,00h
    accept:
    mov ah,09h
    mov dx,offset msg4
    int 21h
    mov ah,09h
    mov dx,offset msg2
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
    add bh,bl
    mov total,bh
    dec cl
    cmp cl,00h
    jnz accept
    mov ax,0000h
    mov al,bh
    mov bl,count
    div bl
    mov result,al
    mov ah,09h
    mov dx,offset msg3
    int 21h
    mov ch,result
    and ch,0f0h
    ror ch,04h
    add ch,'0'
    mov dl,ch
    mov ah,02h
    int 21h
    mov ch,result
    and ch,0fh
    add ch,'0'
    mov dl,ch
    mov ah,02h
    int 21h
    
    mov ah,4ch
    int 21h
CODE ENDS
end start
    