#include <pthread.h>
#include <stdio.h>

#define NTHREADS 100

long int counter = 0;
pthread_mutex_t lock;

void *myThread() {
	for(int i=0; i<1000; i++) {
		pthread_mutex_lock(&lock);
		counter++;
		pthread_mutex_unlock(&lock);
	}
}

int main() {
	pthread_t tid[NTHREADS];

	while (pthread_mutex_init(&lock, NULL) != 0) {}

	for (int i=0; i<NTHREADS; i++) {
		pthread_create(&tid[i], NULL, myThread, NULL);
	}

	for (int i=0; i<NTHREADS; i++) {
		pthread_join(tid[i], NULL);
	}

	printf("Counter: %ld \n", counter);

	while (pthread_mutex_destroy(&lock) != 0) {}

	return 0;
}
