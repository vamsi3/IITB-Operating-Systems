#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include "barrier.h"

#define NTHREADS 1000

int error = 1;
struct barrier_t barrier1;

void *ThreadRoutine(void *arg)
{
	int id = *((int *)arg);

	barrier_wait(&barrier1);
	if(id == 0)
	{
		printf("Thread 0: I am going to wait for 5s beforing calling 'barrier_wait()'\n");
		
		sleep(5);
		error = 0;
		printf("Thread 0: I am calling barrier_wait(). Everbody ready to cross the barrier.\n");
		
		barrier_wait(&barrier1);
		printf("Looks good !\n");
	}
	else
	{
		barrier_wait(&barrier1);
		if(error)
		{
			printf("Error: Thread %d:  How I crossed the barrier before Thread 0 invokes barrier_wait()?.\n", id);
			exit(1);
		}
	}
}

int main()
{
	pthread_t threads[NTHREADS];
	int ids[NTHREADS];

	barrier_init(&barrier1, NTHREADS);

	for(int i=0; i<NTHREADS; i++)
	{
		ids[i] = i;
		pthread_create(&threads[i], NULL, ThreadRoutine, (void *)&ids[i]);
	}
	
	for(int i=0; i<NTHREADS; i++)
		pthread_join(threads[i], NULL);

	exit(1);
}
