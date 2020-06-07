#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <stdlib.h>


int main() {
	pid_t pid = fork();
	if (pid == 0) {
		fprintf(stdout, "Child : My process ID is: %d\n", getpid());
		fprintf(stdout, "Child : The parent process ID is: %d\n", getppid());
		sleep(3);
		fprintf(stdout, "Child : My process ID is: %d\n", getpid());
		fprintf(stdout, "Child : The parent process ID is: %d\n", getppid());
		exit(0);
	}
	else {
		fprintf(stdout, "Parent : My process ID is: %d\n", getpid());
		fprintf(stdout, "Parent : The child process ID is: %d\n", pid);
		sleep(1);
		fprintf(stdout, "Parent : The parent has terminated.\n\n");
		exit(0);
	}
}
