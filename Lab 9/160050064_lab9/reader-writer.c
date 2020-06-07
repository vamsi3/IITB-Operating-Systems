#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>
#include <string.h>
#include <time.h>

struct argument_t {
	int delay;
	long int thread_id;
};

struct read_write_lock
{
	pthread_mutex_t data_lock;
	pthread_cond_t write;
	pthread_cond_t read;
	int readers;
	int writers;
	int waiters; // number of writers waiting
	// If required, use this strucure to create
	// reader-writer lock related variables

} rwlock;

long int data = 0;			//	Shared data variable

void InitalizeReadWriteLock(struct read_write_lock * rw)
{
	rw->readers = 0;
	rw->writers = 0;
	rw->waiters = 0;
	while (pthread_mutex_init(&rw->data_lock, NULL) != 0) {}
	while (pthread_cond_init(&rw->write, NULL) != 0) {}
	while (pthread_cond_init(&rw->read, NULL) != 0) {}
}


// The pthread based reader lock
void ReaderLock(struct read_write_lock * rw)
{
	pthread_mutex_lock(&rw->data_lock);
	while (rw->writers > 0 || rw->waiters > 0) {
		pthread_cond_wait(&rw->read, &rw->data_lock);
	}
	rw->readers++;
	pthread_mutex_unlock(&rw->data_lock);
}	

// The pthread based reader unlock
void ReaderUnlock(struct read_write_lock * rw)
{
	pthread_mutex_lock(&rw->data_lock);
	rw->readers--;
	if (rw->readers <= 0) {
		pthread_cond_signal(&rw->write);
	}
	pthread_mutex_unlock(&rw->data_lock);
}

// The pthread based writer lock
void WriterLock(struct read_write_lock * rw)
{
	pthread_mutex_lock(&rw->data_lock);
	rw->waiters++;
	while (rw->writers > 0 || rw->readers > 0) {
		pthread_cond_wait(&rw->write, &rw->data_lock);
	}
	rw->writers++;
	rw->waiters--;
	pthread_mutex_unlock(&rw->data_lock);
}

// The pthread based writer unlock
void WriterUnlock(struct read_write_lock * rw)
{
	pthread_mutex_lock(&rw->data_lock);
	rw->writers--;
	if (rw->writers <= 0) {
		pthread_cond_signal(&rw->write);
		if (rw->waiters <= 0) {
			pthread_cond_broadcast(&rw->read);
		}
	}
	pthread_mutex_unlock(&rw->data_lock);
}

//	Call this function to delay the execution by 'delay' ms
void delay(int delay)
{
	struct timespec wait;

	if(delay <= 0)
		return;

	wait.tv_sec = delay / 1000;
	wait.tv_nsec = (delay % 1000) * 1000 * 1000;
	nanosleep(&wait, NULL);
}

// The pthread reader start function
void *ReaderFunction(void *arg)
{
	struct argument_t args = *((struct argument_t *) arg);

	//	Delay the execution by arrival time specified in the input
	delay(args.delay);
	
	//  Get appropriate lock
	ReaderLock(&rwlock);

	//	Display  thread ID and value of the shared data variable
	printf("	Reader  %ld, data: %ld\n", args.thread_id, data);
	
    //  Add a dummy delay of 1 ms before lock release  
	delay(1);
	ReaderUnlock(&rwlock);
}

// The pthread writer start function
void *WriterFunction(void *arg)
{
	struct argument_t args = *((struct argument_t *) arg);

	//	Delay the execution by arrival time specified in the input
	delay(args.delay);
	
	//  Get appropriate lock
	WriterLock(&rwlock);
	//	Increment the shared data variable
	data++;
	//	Display  thread ID and value of the shared data variable
	printf("	Writer  %ld, data: %ld\n", args.thread_id, data);

    //  Add a dummy delay of 1 ms before lock release  
	delay(1);
	WriterUnlock(&rwlock);
	
}

int main(int argc, char *argv[])
{
	pthread_t *threads;
	struct argument_t *args;
	
	long int reader_number = 0;
	long int writer_number = 0;
	long int thread_number = 0;
	long int total_threads = 0;	
	
	int count = 0;			// Number of 3 tuples in the inputs.	Assume maximum 10 tuples 
	int rws[10];			
	int nthread[10];
	int delay[10];

	//	Verifying number of arguments
	if(argc<4 || (argc-1)%3!=0)
	{
		printf("reader-writer <r/w> <no-of-threads> <thread-arrival-delay in ms> ...\n");		
		printf("Any number of readers/writers can be added with repetitions of above mentioned 3 tuple \n");
		exit(1);
	}

	//	Reading inputs
	for(int i=0; i<(argc-1)/3; i++)
	{
		char rw[2];
		strcpy(rw, argv[(i*3)+1]);

		if(strcmp(rw, "r") == 0 || strcmp(rw, "w") == 0)
		{
			if(strcmp(rw, "r") == 0)
				rws[i] = 1;					// rws[i] = 1, for reader
			else
				rws[i] = 2;					// rws[i] = 2, for writer
			
			nthread[i] = atol(argv[(i*3)+2]);		
			delay[i] = atol(argv[(i*3)+3]);

			count ++;						//	Number of tuples
			total_threads += nthread[i];	//	Total number of threads
		}
		else
		{
			printf("reader-writer <r/w> <no-of-threads> <thread-arrival-delay in ms> ...\n");
			printf("Any number of readers/writers can be added with repetitions of above mentioned 3 tuple \n");
			exit(1);
		}
	}

	//	Create reader/writer threads based on the input and read and write.

	InitalizeReadWriteLock(&rwlock);

	threads = (pthread_t *) malloc(total_threads * sizeof(pthread_t));

	while (thread_number < count) {

		if (rws[thread_number] == 1) {
			for (int i=0; i<nthread[thread_number]; i++) {
				reader_number++;
				args = (struct argument_t *) malloc(sizeof(struct argument_t));
				args->delay = delay[thread_number];
				args->thread_id = reader_number;
				pthread_create(&threads[thread_number], NULL, ReaderFunction, (void *) args);
			}
		}
		else if (rws[thread_number] == 2) {
			for (int i=0; i<nthread[thread_number]; i++) {
				writer_number++;
				args = (struct argument_t *) malloc(sizeof(struct argument_t));
				args->delay = delay[thread_number];
				args->thread_id = writer_number;
				pthread_create(&threads[thread_number], NULL, WriterFunction, (void *) args);
			}
		}
		thread_number++;
	}

	//  Clean up threads on exit

	thread_number--;
	while (thread_number >= 0) {
		pthread_join(threads[thread_number], NULL);
		thread_number--;
	}

	exit(0);
}
