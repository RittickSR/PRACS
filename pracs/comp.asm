DATA SEGMENT
    msg0 db 10,13,"ENTER NUMBER OF BITS$"
    msg1 db 10,13,"ENTER A BIT$"
    msg2 db 10,13,"TWO's COMPLEMENT OF ENTERED BITS IS : $"
    msg3 db 10,13,"FIRST CONDITION$"
    msg4 db 10,13,"SECOND CONDITION$"
    len db ?
    bin dw ?
DATA ENDS
CODE SEGMENT
    assume cs:code,ds:data
    start:
    mov ax,data
    mov ds,ax
    
    xor bx,bx
    mov ch,0000h
    mov cl,16
    mov si,1000h
    mov si,00000000b
    
    takeip:mov ah,09h
    mov dx,offset msg1
    int 21h
    
    mov ah,01h
    int 21h
    cmp al,0dh
    je stop
    inc [si]
    and al,0fh
    shl bx,1
    or bl,al
    loop takeip
    stop:
    
    mov bin,bx
    
    neg bx
    mov si,1000h
    mov ch,0000h
    mov cl,[si]
    sub cl,8
    l1:shl bx,1
    loop l1
    
    mov ch,0000h
    mov cl,[si]
    
    disp:shl bx,1
    jnc zero
    mov dl,31h
    jmp disp2
    zero:mov dl,30h
    disp2:mov ah,02h
    int 21h
    loop disp
    mov ah,4ch
    int 21h
CODE ENDS
end start