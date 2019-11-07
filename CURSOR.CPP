#include<stdio.h>
#include<conio.h>
void main()
{
clrscr();
int a,cho;
do
{
printf("ENTER THE VALUE");
scanf("%d",&a);
printf("1.INCREMENT\n2.DECREMENT\n3.DISABLE\n4.EXIT");
scanf("%d",&cho);
switch(cho)
{
case 1:asm{mov cx,a
mov ah,01h
inc cl
int 10h
}
break;
case 2:asm{mov cx,a
mov ah,01h
dec cl
int 10h
}
break;
case 3:asm{mov ah,01h
int 10h}
break;
case 4:break;
case 5:printf("Wrong choice");
}
}while(cho!=4);
}