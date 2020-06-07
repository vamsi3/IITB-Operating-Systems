#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <stdlib.h>

void create_child(int n, int iter) {
	if (iter == n) return;
	pid_t pid = fork();
	if (pid == 0) {
		create_child(n, ++iter);
		exit(0);
	}
	else {
		fprintf(stdout, "Child %d is created\n", pid);
		pid_t child = wait(NULL);
		fprintf(stdout, "Child %d exited\n", child);
		if (iter == 0) {
			fprintf(stdout, "Parent exited\n");
			exit(0);
		}
	}
}

int main(int argc, const char **argv) {
	int n = atoi(argv[1]);
	fprintf(stdout, "Parent is : %d\n", getpid());
	fprintf(stdout, "Number of children: %d\n", n);
	create_child(n, 0);
}
