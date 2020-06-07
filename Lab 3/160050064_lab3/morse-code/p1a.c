#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>

void signal_handler(int signal_number) {
	if (signal_number == SIGINT || signal_number == SIGTERM) {
		if (signal_number == SIGINT) printf("\nInterrupt SIGINT received.\n");
		else if (signal_number == SIGTERM) printf("Interrupt SIGTERM received.\n");
		printf("Do you really want to quit (y|n)?\n");
		char response = 0;
		while (response != 'y' && response != 'n') scanf("%c", &response);
		if (response == 'y') exit(0);
		else if (response == 'n') return;
	}
}

int main() {
	signal(SIGINT, signal_handler);
	signal(SIGTERM, signal_handler);

	printf("%d\n", getpid());
	while (1);
}
