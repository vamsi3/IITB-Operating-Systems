#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

#define ARRAY_SIZE 2000000
int main()
{
	int array[ARRAY_SIZE];
	int i;

	printf("\n\nProgram : 'memory_2'\n");
	printf("____________________\n");
	printf ("\n\nPID : %d \n",getpid());
	printf( "Size of int : %ld \n",sizeof(int));

	printf("\nPress Enter Key to exit.\n");

	getchar();    
	return 0;
}