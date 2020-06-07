#include "types.h"
#include "stat.h"
#include "user.h"

#define NTASKS 20

void task1(int id, int a, int b)
{
	int result;

	sleep(50);
	// printf(1, "[%d] Executing task1. ID: %d. a: %d. b: %d \n", getpid(), id, a, b);

	result = a + b;

	sleep(150);
	task_ret(id, result);
}

void task2(int id, int a, int b)
{
	int result;

	sleep(100);
	// printf(1, "[%d] Executing task2. ID: %d. a: %d. b: %d \n", getpid(), id, a, b);

	result = a * b;

	sleep(100);
	task_ret(id, result);
}

void worker_thread()
{
	int count = 0;
	int ret;

	while(1)
	{
		ret = wait_for_task();
		if(ret > 0)
		{
			count ++;
			// printf(1, "[%d] Completed %d tasks. Last completed ID: %d \n", getpid(), count, ret);
		}
		else
		{
			printf(1, "wait for task failed \n");
			exit();
		}
	}
}

int main(int argc, char* argv[])
{	
	int pid;
	int start_time;
	int end_time;
	int* pids;
	int results[NTASKS];
	int nworkers;

	if(argc <2 )
	{
		printf(1, "./test5 <# workers> \n");
		exit();
	}
	nworkers = atoi(argv[1]);

	pids = (int *)sbrk(nworkers * sizeof(int));
	init_taskmaster();

	//	Creating n workers
	for(int i=0; i<nworkers; i++)
	{
		pid = fork();
		if(pid == 0)
			worker_thread();
						
		pids[i] = pid;
	}

	start_time = uptime();

	// Master process issues NTASK tasks
	for(int i=0; i<NTASKS; i++)
	{
		if(i % 3 == 0)
			do_task((char *)task1, 100 + i,	i, i+2);
		else
			do_task((char *)task2, 100 + i, i, i+2);
	}

	//	Master process waits for all tasks to complete
	for(int i=0; i<NTASKS; i++)
		wait_for_task_to_complete(100 + i, &results[i]);

	end_time = uptime();

	sleep(100);
	printf(1, "\n--------------------------------------\n");
	for(int i=0; i<NTASKS; i++)
	{
		if(i % 2 == 0)
			printf(1, "Results. %d + %d = %d \n", i, i+2, results[i]);
		else 
			printf(1, "Results. %d * %d = %d \n", i, i+2, results[i]);
	}

	printf(1, "\nDuration: %d ticks \n", end_time - start_time);

	for(int i=0; i<nworkers; i++)
		kill(pids[i]);

	for(int i=0; i<nworkers; i++)
		wait();

	exit();
}


