#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include "barrier.h"

#define NTHREADS 2

struct barrier_t b1;
struct barrier_t b2;

void *ThreadRoutine(void *arg)
{
	int id = *((int *)arg);

	for(int i=0; i<10; i++)
	{
		if(id == 1)					// Thread 1
		{
			barrier_wait(&b1);
			printf("Thread 1: Hii \n");

			barrier_wait(&b2);
		}
		else						// Thread 2
		{
			barrier_wait(&b2);
			printf("Thread 2: \tHello \n");

			barrier_wait(&b1);
		}
	}

	if(id == 1) 
		barrier_wait(&b1);
}

int main()
{
	int ids[NTHREADS];
	pthread_t threads[NTHREADS];

	barrier_init(&b1, 2);
	barrier_init(&b2, 2);

	for(int i=0; i<NTHREADS; i++)
	{
		ids[i] = i+1;
		pthread_create(&threads[i], NULL, ThreadRoutine, (void *)&ids[i]);
	}

	barrier_wait(&b1);

	for(int i=0; i<NTHREADS; i++)
		pthread_join(threads[i], NULL);

	exit(1);
}
