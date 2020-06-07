#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include "barrier.h"

#define ELEMENTS 1000
#define NTHREADS 4

struct barrier_t barrier1;
struct barrier_t barrier2;
struct barrier_t barrier3;

int array[ELEMENTS];
long int sum[NTHREADS];

void *ThreadRoutine(void *arg)
{
	int id;

	id = *((int *)arg);

	for(int i = id *250; i<(id+1)*250; i++)
		sum[id]	+= array[i];
	// printf("Sum[%d - %d]: %ld \n", id*250, (id+1)*250, sum[id]);

	if(id == 0)
	{
		barrier_wait(&barrier1);
		sum[0] = sum[0] + sum [1];

		barrier_wait(&barrier3);
		// printf("\nSum[0]: %ld \n", sum[0]);
		// printf("Sum[2]: %ld \n", sum[2]);
		sum[0] = sum[0] + sum[2];
		printf("\nSum: %ld \n", sum[0]);

	}
	else if(id == 1)
	{
		barrier_wait(&barrier1);
	}
	else if (id == 2)
	{	
		barrier_wait(&barrier2);
		sum[2] = sum[2] + sum [3];

		barrier_wait(&barrier3);
	}
	else if(id == 3)
	{
		barrier_wait(&barrier2);
	}

}

int main()
{
	int ids[NTHREADS];
	pthread_t threads[NTHREADS];

	for(int i=0; i<ELEMENTS; i++)
		array[i] = 2;

	barrier_init(&barrier1, 2);
	barrier_init(&barrier2, 2);
	barrier_init(&barrier3, 2);

	for(int i=0; i<NTHREADS; i++)
	{
		ids[i] = i;
		pthread_create(&threads[i], NULL, ThreadRoutine, (void *)&ids[i]);
	}

	for(int i=0; i<NTHREADS; i++)
		pthread_join(threads[i], NULL);

	exit(1);
}
