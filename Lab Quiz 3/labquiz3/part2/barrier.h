#include <pthread.h>

struct barrier_t
{
	/*
		Todo
		Barrier related variables
	*/
};

void barrier_init(struct barrier_t *, int);
void barrier_wait(struct barrier_t *);