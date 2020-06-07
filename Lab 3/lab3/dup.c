// dup.c

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <string.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>


int main()
{

	int fd1, fd2, fd3, fd4;

	// on successful call, open returns the lowest unused file descriptor
	fd1 = open("test.txt", O_CREAT |  O_RDWR, S_IRWXU);
	if(fd1 < 0)
	{
		printf("open failed \n");
		exit(1);
	}

	printf("File 'test.txt' is opened. fd1 = %d \n", fd1);
	write(fd1, "This is written using fd1 \n", 28);

	// dup creates a copy of the file descriptor fd1 using 
	// the lowest unused file descriptor
	fd2 = dup(fd1);
	printf("fd1 is duplicated to fd2. fd2 = %d \n", fd2);
	write(fd2, "This is written using fd2 \n", 28);

	// closes the file descriptor fd1, so that it no longer
	// refers to any file
	close(fd1);
	printf("fd1 is closed \n");

	fd3 = dup(fd2);
	printf("fd2 is duplicated to fd3. fd3 = %d \n", fd3);
	write(fd3, "This is written using fd3 \n", 28);


	// dup2 creates a copy of the file descriptor fd2 using 
	// the descriptor number specified in call.
	fd4 = dup2(fd2, 10);
	printf("fd 10 is duplicated to fd4. fd4 = %d \n", fd4);
	write(fd4, "This is written using fd4 \n", 28);

	return 0;
}
