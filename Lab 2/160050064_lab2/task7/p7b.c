#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <stdlib.h>

int main(int argc, const char **argv) {
	int n = atoi(argv[1]);
	fprintf(stdout, "Parent is : %d\n", getpid());
	fprintf(stdout, "Number of children: %d\n", n);
	for (int i=0; i<n; i++) {
		pid_t child_pid = fork();
		if (child_pid == 0) {
			int seedp = getpid();
			int x = rand_r(&seedp) / (RAND_MAX / 10) + 1;
			sleep(x);
			exit(0);
		}
		else {
			fprintf(stdout, "Child %d is created\n", child_pid);
		}
	}

	pid_t wpid;
	while ((wpid = wait(NULL)) > 0) {
		fprintf(stdout, "Child %d exited\n", wpid);
	}
	fprintf(stdout, "Parent exited\n");
}
