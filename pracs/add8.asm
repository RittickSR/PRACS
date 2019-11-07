DATA SEGMENT
    msg0 db 10,13,"1.ADDITION$"
    msg1 db 10,13,"2.SUBTRACTION$"
    msg2 db 10,13,"ENTER YOUR CHOICE :$"
    msg3 db 10,13,"Enter number 1 :$"
    msg4 db 10,13,"Enter number 2 :$"
    msg5 db 10,13,"Result is : $"
    num1 db ?
    num2 db ?
    choice db ?
    result db ?
DATA ENDS
CODE SEGMENT
    assume cs:code,ds:data
  start:
  mov ax,data
  mov ds,ax
  mov dx,offset msg0
  mov ah,09h
  INT 21h
  
  mov dx,offset msg1
  mov ah,09h
  INT 21h
  
  mov dx,offset msg2
  mov ah,09h
  INT 21h
  
  mov ah,01h
  int 21h
  sub al,'0'
  mov choice,al
  
  cmp choice,03
  jnz laba
  labe:
  mov ah,4ch
  int 21h
  
  laba:
  mov dx,offset msg3
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
  mov num1,bl
  
  mov ah,09h
  mov dx,offset msg4
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
  
  cmp choice,01h
  jnz labs
  mov bl,num1
  mov cl,num2
  add bl,cl
  mov result,bl
  
  mov ah,09h
  mov dx,offset msg5
  int 21h
  
  and bl,0f0h
  ror bl,04h
  add bl,'0'
  mov dl,bl
    mov ah,02h
    int 21h
  
  mov bl,result
  and bl,0fh
  add bl,'0'
  mov dl,bl
    mov ah,02h
    int 21h
  
  jmp labe
  labs:
  mov bl,num1
  mov cl,num2
  sub bl,cl
  mov result,bl
  
  mov dx,offset msg5
  mov ah,09h
  int 21h
  
  and bl,0f0h
  ror bl,04h
  call output
  
  mov bl,result
  and bl,0fh
  call output
  
  jmp labe
  
input proc
cmp al,41h
jc labz
sub al,07h
labz:
sub al,30h
ret
endp


output proc
cmp bl,0ah
jc laby
add bl,07h
laby:
add bl,30h
mov dl,bl
mov ah,02h
int 21h
ret
endp

CODE ENDS
end start