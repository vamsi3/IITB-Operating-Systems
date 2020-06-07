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
		char c = getc(stdin);
		exit(0);
	}
	else {
		fprintf(stdout, "Parent : My process ID is: %d\n", getpid());
		fprintf(stdout, "Parent : The child process ID is: %d\n", pid);
		pid_t child = wait(NULL);
		fprintf(stdout, "\nParent : The parent has terminated.\n");
		exit(0);
	}
}
