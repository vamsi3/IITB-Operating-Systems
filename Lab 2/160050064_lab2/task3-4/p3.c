#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <stdlib.h>

int main() {
	pid_t pid = fork();
	if (pid == 0) {
		char *args[] = {NULL};
		execvp("./mycat", args);
		exit(0);
	}
	else {
		pid_t child = wait(NULL);
		fprintf(stdout, "Parent : The child has terminated.\n");
		exit(0);
	}
}
