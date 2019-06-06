// THIS PROGRAM EXPLAINS FORK(): CREATING A PROCESS
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h> 
#include <unistd.h>

int main()
{
	/*
	 * Negative Value: creation of a child process was unsuccessful.
	 * Zero: Returned to the newly created child process.
	 * Positive value: Returned to parent or caller. The value contains process ID of newly created child process.
	 */
	// make two process which run same 
	// program after this instruction 
	fork(); 
	fork(); 

	printf("\n[%d] Hello world!\n",getpid()); 
	return 0;
}
