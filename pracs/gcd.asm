DATA SEGMENT
    msg0 db 10,13,"ENTER FIRST NUMBER : $"
    msg1 db 10,13,"ENTER SECOND NUMBER : $"
    msg2 db 10,13,"GCD IS : $"
    msg3 db 10,13,"LCM IS : $"
    num1 db ?
    num2 db ?
    gcd db ?
    lcm db ?
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
    mov bl,al
    rol bl,04h
    
    mov ah,01h
    int 21h
    sub al,'0'
    add bl,al
    mov num1,bl
    
    mov ah,09h
    mov dx,offset msg1
    int 21h
    
    mov ah,01h
    int 21h
    sub al,'0'
    mov cl,al
    rol cl,04h
    
    mov ah,01h
    int 21h
    sub al,'0'
    add cl,al
    mov num2,cl
    
    back:cmp bl,cl
    jc sec
    first:sub bl,cl
    jmp check
    sec:sub cl,bl
    check:cmp bl,cl
    jnz back
    mov gcd,bl
    
    mov cl,gcd
    mov al,num1
    mov bl,num2
    mul bl
    div cl
    mov lcm,al
    
    
    mov ah,09h
    mov dx,offset msg2
    int 21h
    
    mov bl,gcd
    and bl,0f0h
    ror bl,04h
    add bl,'0'
    mov dl,bl
    mov ah,02h
    int 21h
    
    mov bl,gcd
    and bl,0fh
    add bl,'0'
    mov dl,bl
    mov ah,02h
    int 21h
    
    mov ah,09h
    mov dx,offset msg3
    int 21h
    
    mov bl,lcm
    and bl,0f0h
    ror bl,04h
    add bl,'0'
    mov dl,bl
    mov ah,02h
    int 21h
    
    mov bl,lcm
    and bl,0fh
    add bl,'0'
    mov dl,bl
    mov ah,02h
    int 21h
    
    mov ah,4ch
    int 21h
    
CODE ENDS
end start