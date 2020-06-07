#include "types.h"
#include "stat.h"
#include "user.h"

void delay(int ticks)
{
    int endtime;

    endtime = uptime() + ticks;
    while(uptime() < endtime);
}

// the multi-threaded producer function
void producer(int producer_id, int count, int bsize)
{
	// setup the producer
	//  .......
	//  .......
	while (get_var(0) >= bsize) {
		sem_down(1);
	}

	// produce
	sem_down(0);
	set_var(0, get_var(0)+1);
	delay(1);
	printf(1, "\t\t\t\t[%d]: P: %d %d %d \n", getpid(), producer_id, count, get_var(0));
	sem_up(0);

	sem_up(2);
	//cleanup
	//  .......
	//  .......    
}

// the mult-threaded consumer function
void consumer(int consumer_id, int count)
{
	// setup the consumer
	//  .......
	//  .......
	while (get_var(0) <= 0) {
		sem_down(2);
	}

	// consumer
	sem_down(0);

	set_var(0, get_var(0)-1);
	delay(1);
	printf(1, "\t\t\t\t[%d]: C: %d %d %d \n", getpid(), consumer_id, count, get_var(0));
	sem_up(0);

	sem_up(1);
	// cleanup
	//  .......
	//  .......

}

int main(int argc, char *argv[])
{
	
    int bsize;
	int np;
	int nc;
	int pitems;
	int citems;

	if(argc < 6)
	{
		printf(1, "usage: ./prodcon <buffer size> <#producers> <#items produced per producer> <#consumers> <#items consumed per consumer> \n");
		printf(1, "       buffer size denotes the maximum capacity of production.\n");
		exit();    
	}
	
	// get the arguments 

	bsize = atoi(argv[1]);
	np = atoi(argv[2]);
	pitems = atoi(argv[3]);
	nc = atoi(argv[4]);
	citems = atoi(argv[5]);

	// initialized counters etc.
	init_counters();
	// ...

    


    /* Todo

	   Create producer and consumer threads/processes and set them up
	   to produce pitems and consume citems each, respectively.

	   The processes need to be synchronized correctly for production
	   and consumption related updates.
       .......

	   .......

       .......

	   Cleanup
	*/

	// for sync on var values updates - binary semaphore - lock;
	sem_init(0, 1);

	// for ordering between producers and consumers - semaphores used for ordering
	sem_init(1, 0);
	sem_init(2, 0);

	int nprocess = 0;

	for (int i=1; i<=np; i++) {
		for (int j=1; j<=pitems; j++) {
			int ret = fork();
			if (ret == 0) {
				producer(i, j, bsize);
				exit();
			}
			else {
				nprocess++;
			}
		}
	}

	for (int i=1; i<=nc; i++) {
		for (int j=1; j<=citems; j++) {
			int ret = fork();
			if (ret == 0) {
				consumer(i, j);
				exit();
			}
			else {
				nprocess++;
			}
		}
	}

    for (int i=0; i<nprocess; i++)
        wait();

	exit();
}
