DATA SEGMENT
    msg0 db 10,13,"1.ADDITION"
         db 10,13,"2.SUBTRACTION"
         db 10,13,"3.EXIT"
         db 10,13,"ENTER YOUR CHOICE$"
    msg1 db 10,13,"ENTER FIRST OPERAND$"
    msg2 db 10,13,"ENTER SECOND OPERAND$"
    msg3 db 10,13,"RESULT IS : $"
    choice db ?
    num1 dd ?
    num2 dd ?
    result dd ?
DATA ENDS
CODE SEGMENT
    assume cs:code,ds:data
    start:
    mov ax,data
    mov ds,ax
    
    l1:mov ah,09h
    mov dx,msg0
    int 21h
    
    mov ah,01h
    int 21h
    sub al,'0'
    mov choice,al
    
    cmp al,03h
    jne labs
    mov ah,4ch
    int 21h
    
    labs:mov ah,09h
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
    mov bh,bl
    
    mov ah,01h
    int 21h
    sub al,'0'
    rol al,04h
    mov bl,al
    
    mov ah,01h
    int 21h
    sub al,'0'
    add bl,al
    rol ebx,16
    
    mov ah,01h
    int 21h
    sub al,'0'
    rol al,04h
    mov bl,al
    
    mov ah,01h
    int 21h
    sub al,'0'
    add bl,al
    mov bh,bl
    
    mov ah,01h
    int 21h
    sub al,'0'
    rol al,04h
    mov bl,al
    
    mov ah,01h
    int 21h
    sub al,'0'
    add bl,al
    mov num1,ebx
    
    mov ebx,num1
    ror ebx,24
    and bl,0f0h
    ror bl,04h
    add bl,'0'
    mov dl,bl
    mov ah,02h
    int 21h
    
    mov ebx,num1
    ror ebx,24
    and bl,0fh
    add bl,'0'
    mov dl,bl
    mov ah,02h
    int 21h
    
    mov ebx,num1
    ror ebx,16
    and bl,0f0h
    ror bl,04h
    add bl,'0'
    mov dl,bl
    mov ah,02h
    int 21h
    
    mov ebx,num1
    ror ebx,16
    and bl,0fh
    add bl,'0'
    mov dl,bl
    mov ah,02h
    int 21h
    
    mov ebx,num1
    ror ebx,8
    and bl,0f0h
    ror bl,04h
    add bl,'0'
    mov dl,bl
    mov ah,02h
    int 21h
    
    mov ebx,num1
    ror ebx,8
    and bl,0fh
    add bl,'0'
    mov dl,bl
    mov ah,02h
    int 21h
    
    mov ebx,num1
    and bl,0f0h
    ror bl,04h
    add bl,'0'
    mov dl,bl
    mov ah,02h
    int 21h
    
    mov ebx,num1
    and bl,0fh
    add bl,'0'
    mov dl,bl
    mov ah,02h
    int 21h
    
    mov ah,4ch
    int 21h
    
CODE ENDS
end start