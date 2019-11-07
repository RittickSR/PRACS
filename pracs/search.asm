DATA SEGMENT
    msg0 db 10,13,"ENTER LENGTH OF ARRAY$"
    msg1 db 10,13,"ENTER ELEMENT$"
    msg2 db 10,13,"DESCENDING ORDER IS$"
    len db ?
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
    
    mov len,al
    
    mov si,1000h
    mov cl,len
    mov ch,0000h
    
    takeip:
    mov dx,offset msg1
    mov ah,09h
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
    
    mov [si],bl
    inc si
    loop takeip
    mov ch,0000h
    mov cl,len
    mov si,1000h
    
    
    mov bl,len
    mov dh,00h
    dec bl
    loop1:
    mov si,1000h
    mov ch,0000h
    mov cl,len
    dec cl
    loop2:
    mov ah,[si]
    inc si
    mov al,[si]
    cmp ah,al
    jnc l
    xchg ah,al
    dec si
    mov [si],ah
    inc si
    mov [si],al
    l:
    loop loop2
    
    inc dh
    cmp dh,bl
    jnz loop1
    
    mov ah,09h
    mov dx,offset msg2
    int 21h
    
    mov ch,0000h
    mov cl,len
    mov si,1000h
    
    print:
    mov bh,[si]
    and bh,0f0h
    ror bh,04h
    add bh,'0'
    mov dl,bh
    mov ah,02h
    int 21h
    mov bh,[si]
    and bh,00fh
    add bh,'0'
    mov dl,bh
    mov ah,02h
    int 21h
    inc si
    loop print
    
    mov ah,4ch
    int 21h
    
    
CODE ENDS
end start