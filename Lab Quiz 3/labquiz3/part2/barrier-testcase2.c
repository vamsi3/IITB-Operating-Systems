#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include "barrier.h"

#define NTHREADS 1000

struct barrier_t barrier;
int array[NTHREADS];

void *ThreadRoutine(void *arg)
{
	int id = *((int *)arg);
	long int sum=0;

	array[id]++;

	barrier_wait(&barrier);
	if(id == 0)
	{
		for(int i=0; i<NTHREADS; i++)
			sum += array[i];
		printf("Sum1 = %ld \n",sum);
	}

	barrier_wait(&barrier);
	array[id] += 10;

	barrier_wait(&barrier);
	if(id == 0)
	{
		sum = 0;
		for(int i=0; i<NTHREADS; i++)
			sum += array[i];
		printf("Sum2 = %ld \n",sum);
	}
}

int main()
{
	int ids[NTHREADS];
	pthread_t threads[NTHREADS];

	barrier_init(&barrier, NTHREADS);

	for(int i=0; i<NTHREADS; i++)
	{
		ids[i] = i;
		pthread_create(&threads[i], NULL, ThreadRoutine, (void *)&ids[i]);
	}

	for(int i=0; i<NTHREADS; i++)
		pthread_join(threads[i], NULL);

	exit(1);
}
