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
	f1();

	// Callback f2 using f1 address
	f2();
}
