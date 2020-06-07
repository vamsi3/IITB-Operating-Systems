#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>

#define NTHREADS 10

long int counter[NTHREADS] = {0};
pthread_mutex_t lock[NTHREADS];

void *myThread(void *thread_id_ptr) {
	int thread_id = *((int *) thread_id_ptr);
	for(int i=0; i<1000; i++) {
		pthread_mutex_lock(&lock[thread_id]);
		counter[thread_id]++;
		pthread_mutex_unlock(&lock[thread_id]);
	}
}

int main() {
	pthread_t tid[NTHREADS];

	for (int thread_id=0; thread_id<NTHREADS; thread_id++) {
		while (pthread_mutex_init(&lock[thread_id], NULL) != 0) {}
	}

	for (int thread_id=0; thread_id<NTHREADS; thread_id++) {
		// printf("%d ...s \n", thread_id);
		int* thread_id_ptr = (int*) malloc(sizeof(int));
		*thread_id_ptr = thread_id;
		pthread_create(&tid[thread_id], NULL, myThread, (void *) thread_id_ptr);
	}

	for(int i=0; i<1000; i++) {
		for (int thread_id=0; thread_id<NTHREADS; thread_id++) {
			pthread_mutex_lock(&lock[thread_id]);
			counter[thread_id]++;
			pthread_mutex_unlock(&lock[thread_id]);
		}
	}

	for (int thread_id=0; thread_id<NTHREADS; thread_id++) {
		pthread_join(tid[thread_id], NULL);
	}

	for (int thread_id=0; thread_id<NTHREADS; thread_id++) {
		printf("Counter[%d]: %ld\n", thread_id, counter[thread_id]);
	}

	for (int thread_id=0; thread_id<NTHREADS; thread_id++) {
		while (pthread_mutex_destroy(&lock[thread_id]) != 0) {}
	}
	
	return 0;
}
