#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <stdlib.h>
#include <fcntl.h>

int main(int argc, const char **argv) {
	close(0);
	int fd = open(argv[1], O_RDWR | O_CREAT);
	fprintf(stdout, "Parent: File opened: fd=%d.\n", fd);
	pid_t pid = fork();
	if (pid == 0) {
		char *args[] = {NULL};
		execvp("./mycat", args);
		exit(0);
	}
	else {
		pid_t child = wait(NULL);
		fprintf(stdout, "\nParent : The child has terminated.\n");
		exit(0);
	}
}
