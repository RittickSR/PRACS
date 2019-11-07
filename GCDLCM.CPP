#include<stdio.h>
#include<conio.h>
void main()
{
int a,b,c;
printf("ENTER THE FIRST NUMBER");
scanf("%d",&a);
printf("ENTER THE SECOND NUMBER");
scanf("%d",&b);
asm{
	mov ax,a;
	mov bx,b;}
	back:
	asm{cmp ax,bx;
	jc sec;
	sub ax,bx;
	jmp co;
	}
	sec:
	asm{sub bx,ax;}
	co:
	asm{cmp ax,bx;
	jnz back;
	mov c,ax;}
	printf("THE GCD IS : %d",c);
}