#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <stdlib.h>

int main(int argc, const char **argv) {
	int n = atoi(argv[1]);
	fprintf(stdout, "Parent is : %d\n", getpid());
	fprintf(stdout, "Number of children: %d\n", n);
	pid_t child_pids[n];
	for (int i=0; i<n; i++) {
		child_pids[i] = fork();
		if (child_pids[i] == 0) {
			int seedp = getpid();
			int x = rand_r(&seedp) / (RAND_MAX / 10) + 1;
			sleep(x);
			exit(0);
		}
		else {
			fprintf(stdout, "Child %d is created\n", child_pids[i]);
		}
	}
	for (int i=n-1; i>=0; i--) {
		pid_t wpid = waitpid(child_pids[i], NULL, 0);
		fprintf(stdout, "Child %d exited\n", wpid);
	}
	fprintf(stdout, "Parent exited\n");
}
