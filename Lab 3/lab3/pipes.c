// pipes.c

#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<sys/types.h>
#include<string.h>
#include<sys/wait.h>

int main()
{
		int fd1[2];  // Used to store two ends of first pipe
		int fd2[2];  // Used to store two ends of second pipe

		char str[100]="";
		pid_t p;

		if ((pipe(fd1)==-1) || (pipe(fd2)==-1))
		{
				fprintf(stderr, "Pipe Failed" ); return 1;
		}

		p = fork();

		// Parent process
		if (p > 0)
		{
				// both pipes (fd1 and fd2) open in both the parent and the child
				// the parent wants to write to the pipe, close read end

				close(fd1[0]);  // close reading end of first pipe

				// write input string and close writing end of first pipe
				write(fd1[1], "hello child", 11);
				close(fd1[1]);

				// Wait for child to send a string
				wait(NULL);

				close(fd2[1]); // close writing end of second pipe

				// read string from child, print it and close
				// reading end.
				read(fd2[0], str, 100);
				printf("Message received at parent: %s\n", str);
				close(fd2[0]); // done with reading end of pipe, close it
		}

		// child process
		else
		{
				// pipe fd2 being used for reading, close the writing end
				close(fd1[1]);  // close writing end of first pipe

				// read a string using first pipe
				read(fd1[0], str, 100);

				// close both reading ends, fd2 write end of pipe to be used
				close(fd1[0]);
				close(fd2[0]);

				// write concatenated string and close writing end
				write(fd2[1], "hello parent", 12);
				close(fd2[1]);

				printf("Message received at child: %s\n",str);

				exit(0);
		}
	return 0;
}
