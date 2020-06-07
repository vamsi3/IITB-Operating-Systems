#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <stdlib.h>
#include <fcntl.h>
#include <string.h>

int main(int argc, const char **argv) {
	int fd = open(argv[1], O_RDWR | O_CREAT);
	fprintf(stdout, "Parent: File opened: fd=%d.\n", fd);
	pid_t pid = fork();
	if (pid == 0) {
		fprintf(stdout, "Child %d: writing to file %d\n", getpid(), fd);
		const char *hello_child = "hello world! I am the child\n";
		write(fd, hello_child, strlen(hello_child));
		exit(0);
	}
	else {
		fprintf(stdout, "Parent %d: writing to file %d\n", getpid(), fd);
		const char *hello_parent = "hello world! I am the parent\n";
		write(fd, hello_parent, strlen(hello_parent));
		pid_t child = wait(NULL);
		fprintf(stdout, "Parent : The child has terminated.\n");
		exit(0);
	}
}
