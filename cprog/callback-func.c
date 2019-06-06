#include <stdio.h>
#include <stdlib.h>

void f1()
{
	printf("I am f1\n");
}

void f2()
{
	printf("I am f2\n");
}

// This calls functions f1 and f2 whenever it is required using function pointer
void call(void (*callback)())
{
	callback();
}

int main()
{
	// Callback f1 using f1 address
	call(f1);

	// Callback f2 using f1 address
	call(f2);

	// Print addresses of f1 and f2
	printf("f1 address: %x [%x] \nf2 address: %x [%x]\n",f1,&f1,f2,&f2);
}
