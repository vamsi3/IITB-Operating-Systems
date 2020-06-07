#include "types.h"
#include "stat.h"
#include "user.h"

#define NCHILDREN 30

void mutex_lock(int index)
{
	/*
		Todo
	*/
}

void mutex_unlock(int index)
{
	/*
		Todo
	*/
}

void delay(int ticks)
{
	uint endtime = uptime() + ticks;

	while(uptime() < endtime);
}


int main(int argc, char *argv[])
{
	int ret;
	int lock_type;

	if(argc < 2)
	{
		printf(1, "./lock-and-delay <lock-type> \n");
		exit();
	}
	lock_type = atoi(argv[1]);

	if(lock_type == 1)
		printf(1, "\nLock-and-dalay with spinlock \n");
	else if(lock_type == 2)
		printf(1, "\nLock-and-dalay with mutex \n");

	init_counters();
	init_mutex();

	uint starting = uptime();

	for (int i=0; i<NCHILDREN; i++) 
	{
		ret = fork();
		if (ret == 0) 
		{
			for (int j=0; j<10; j++) 
			{
				if(lock_type == 1)				
					acquire_mutex_spinlock(0);
				else if(lock_type == 2)
					mutex_lock(0);

				set_var(0, get_var(0)+1);
				delay(10);

				if(lock_type == 1)				
					release_mutex_spinlock(0);
				else if(lock_type == 2)
					mutex_unlock(0);
			}

			exit();		
		}
	}

	for (int i=0; i<NCHILDREN; i++) 
		wait();

	printf(1, "Data[0] = %d\n", get_var(0));
	printf(1, "Duration: %d ticks \n\n", uptime() - starting);

	exit();
}

