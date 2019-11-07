#include<stdio.h>
#include<conio.h>
void main()
{
clrscr();
int len,num,i;
printf("ENTER THE NUMBER OF NUMBERS");
scanf("%d",&len);
int max,min;
printf("Enter a number");
scanf("%d",&num);
max=num;
min=num;
for(i=1;i<len;i++)
{
printf("Enter a number");
scanf("%d",&num);
asm{mov ax,max;
mov bx,num;
cmp ax,bx;
jc sec;
mov max,ax
jmp l1;
}
sec:
asm{mov max,bx;}
l1:
asm{mov ax,min;
mov bx,num;
cmp ax,bx;
jnc sec2;
mov min,ax;
jmp l2;
}
sec2:
asm{mov min,bx;}
l2:
asm{}
}
printf("Maximum is : %d",max);
printf("Minimum is : %d",min);
getch();
}