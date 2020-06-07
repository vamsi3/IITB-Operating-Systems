#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include "barrier.h"

void barrier_init(struct barrier_t * barrier, int nthreads)
{
	/*
		Todo
	*/
	barrier->nthreads = nthreads;
	barrier->cnt = 0;
	barrier->reached = 0;
	while (pthread_mutex_init(&barrier->mutex, NULL) < 0) {}
	while (pthread_cond_init(&barrier->condvar, NULL) < 0) {}
	while (pthread_cond_init(&barrier->endvar, NULL) < 0) {}

}

void barrier_wait(struct barrier_t *barrier)
{
	/*
		Todo
	*/
	pthread_mutex_lock(&barrier->mutex);
	if (barrier->reached == 1) {
		pthread_cond_wait(&barrier->endvar, &barrier->mutex);
	}
	barrier->cnt++;
	// printf("Wait called inc %d ... %d\n", barrier->id, barrier->cnt);
	if (barrier->cnt < barrier->nthreads) {
		pthread_cond_wait(&barrier->condvar, &barrier->mutex);
	}
	barrier->reached = 1;
	pthread_cond_broadcast(&barrier->condvar);
	barrier->cnt--;
	if (barrier->cnt <= 0) {
		barrier->reached = 0;
		pthread_cond_broadcast(&barrier->endvar);
	}
	// printf("Wait called dec %d ... %d\n", barrier->id, barrier->cnt);
	pthread_mutex_unlock(&barrier->mutex);
}
