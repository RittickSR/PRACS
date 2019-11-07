DATA SEGMENT
    msg0 db 10,13,"ENTER NUMBER OF BITS$"
    msg1 db 10,13,"ENTER A BIT$"
    msg2 db 10,13,"TWO's COMPLEMENT OF ENTERED BITS IS : $"
    len db ?
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
    mov len,bl
    
    mov si,1000h
    mov ch,0000h
    mov cl,len
    
    takeip:mov ah,09h
    mov dx,offset msg1
    int 21h
    
    mov ah,01h
    int 21h
    sub al,'0'
    mov [si],al
    inc si
    loop takeip
    
    mov si,1000h
    mov ch,0000h
    mov cl,len
    
    conv:cmp [si],0001h
    jc sec
    first:mov [si],0000h
    inc si
    sec:mov [si],0001h
    inc si
    loop conv
    
    mov si,1000h
    mov ch,0000h
    mov cl,len
    
    disp:mov ah,09h
    mov dx,offset msg2
    int 21h
    
    mov bl,[si]
    and bl,0fh
    add bl,'0'
    mov dl,bl
    mov ah,02h
    int 21h
    
    inc si
    
    loop disp
    
    mov ah,4ch
    int 21h
CODE ENDS
end start