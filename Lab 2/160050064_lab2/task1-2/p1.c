#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <stdlib.h>


int main() {
	pid_t pid = fork();
	if (pid == 0) {
		fprintf(stdout, "Child : My process ID is: %d\n", getpid());
		fprintf(stdout, "Child : The parent process ID is: %d\n", getppid());
		exit(0);
	}
	else {
		// sleep(1);
		fprintf(stdout, "Parent : My process ID is: %d\n", getpid());
		fprintf(stdout, "Parent : The child process ID is: %d\n", pid);
		fflush(stdout); sleep(1);
		exit(0);
	}
}
