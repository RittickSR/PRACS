#include<stdio.h>
#include<conio.h>
void main()
{int len,num,sum,avg,i;
clrscr();
printf("ENTER NUMBER OF NUMBERS");
scanf("%d",&len);
sum=0;
avg=0;
for(i=0;i<len;i++)
{
printf("Enter a number ");
scanf("%d",&num);
asm{mov ax,sum;
mov bx,num;
add ax,bx;
mov sum,ax;}
}
asm{mov ax,sum;
mov cx,len;
div cx;
mov avg,ax;}
printf("AVERAGE IS : %d",avg);
getch();
}