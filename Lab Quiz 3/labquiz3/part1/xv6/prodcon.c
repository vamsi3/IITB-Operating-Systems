#include "types.h"
#include "stat.h"
#include "user.h"

// the multi-threaded producer function
void producer(int producer_id, int count)
{
	// setup the producer
	//  .......
	//  .......

	// produce
	set_var(0, get_var(0)+1);
	printf(1, "\t\t\t\t[%d]: P: %d %d %d \n", getpid(), producer_id, count, get_var(0));

	
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

	// consumer
	set_var(0, get_var(0)-1);
	printf(1, "\t\t\t\t[%d]: C: %d %d %d \n", getpid(), consumer_id, count, get_var(0));

	// cleanup
	//  .......
	//  .......

}

int main(int argc, char *argv[])
{
	/*
    int bsize;
	int np;
	int nc;
	int pitems;
	int citems;

	if(argc < 6)
	{
		printf(1, "usage: ./prodcon <buffer size> <#producers> <#items produced per producer> <#consumers> <#items consumed per consumer> \n");
		printf(1, "       buffer size denotes the maximum capacity of production.");
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

    */   


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




	exit();
}
