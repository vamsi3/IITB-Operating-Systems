#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>
#include <sys/types.h>
#include <sys/wait.h>

void signal_handler(int signal_number) {
	if (signal_number == SIGCHLD) {
		pid_t wpid;
		while (1) {
			wpid = waitpid(-1, NULL, WNOHANG);
			if (wpid == 0) break;
			else if (wpid == -1) exit(0); 
			else printf("Child %d exited\n", wpid);
		}
	}
}

int main(int argc, const char **argv) {
	int n = atoi(argv[1]);
	signal(SIGCHLD, signal_handler);

	for (int i=0; i<n; i++) {
		pid_t child_pid = fork();
		if (child_pid == 0) {
			int seedp = getpid();
			int x = rand_r(&seedp) / (RAND_MAX / 10) + 1;
			printf("Child %d is created (sleeps for %d seconds)\n", getpid(), x);
			sleep(x);
			exit(0);
		}
	}
	while (1);
}