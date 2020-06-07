#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include "barrier.h"

#define NTHREADS 10

struct barrier_t barrier1;
int array[NTHREADS] = { 0 };

void *ThreadRoutine(void *arg)
{
	int id = *((int *)arg);
	long int sum = 0;

	array[id]++;

	barrier_wait(&barrier1); // wait till all threads reach this point
	                         // barrier1 is the object for this barrier point
	if(id == 0)
	{
		for(int i=0; i<NTHREADS; i++)
			sum += array[i];
		printf("Sum = %ld \n", sum);
	}
}

int main()
{
	int ids[NTHREADS];
	pthread_t threads[NTHREADS];

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
