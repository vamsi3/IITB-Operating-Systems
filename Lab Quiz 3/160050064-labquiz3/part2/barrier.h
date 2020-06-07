#include <pthread.h>

struct barrier_t
{
	/*
		Todo
		Barrier related variables
	*/
	int nthreads;
	int cnt;
	int reached;
	pthread_mutex_t mutex;
	pthread_cond_t condvar;
	pthread_cond_t endvar;
};

void barrier_init(struct barrier_t *, int);
void barrier_wait(struct barrier_t *);