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
			else if (wpid == -1) continue;
			else printf("Parent %d: Child %d is exited\n", getpid(), wpid);
		}
	}
}

void create_child(int n, int iter) {
	if (iter == n) return;
	pid_t pid = fork();
	if (pid == 0) {
		create_child(n, ++iter);

		signal(SIGCHLD, signal_handler);
		int seedp = getpid();
		int x = rand_r(&seedp) / (RAND_MAX / 10) + 1;
		printf("Child %d is created by parent %d (sleeps for %d seconds)\n", getpid(), getppid(), x);
		sleep(x);
		exit(0);
	}
}

int main(int argc, const char **argv) {
	create_child(2, 0);
	signal(SIGCHLD, signal_handler);
	while (1);
}