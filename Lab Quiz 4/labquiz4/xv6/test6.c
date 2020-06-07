#include "types.h"
#include "stat.h"
#include "user.h"

#define NWORKERS 5
#define NTASKS 110

void task1(int id, int a, int b)
{
	int result;

	sleep(19);
	printf(1, "[%d] Executing task1. ID: %d. a: %d. b: %d \n", getpid(), id, a, b);

	result = a + b;
	task_ret(id, result);
}

void task2(int id, int a, int b)
{
	int result;

	sleep(13);
	printf(1, "[%d] Executing task2. ID: %d. a: %d. b: %d \n", getpid(), id, a, b);
	
	result = a * b;
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

int main()
{	
	int pid;
	int pids[NWORKERS];
	int results[NTASKS];

	init_taskmaster();

	for(int i=0; i<NWORKERS; i++)
	{
		pid = fork();
		if(pid == 0)
			worker_thread();
						
		pids[i] = pid;
	}

	printf(1, "\nIssuing tasks 100 to 199 \n");
	for(int i=0; i<NTASKS; i++)
	{
		if(do_task((char *)((i % 2 == 0) ? task1 : task2), 100 + i,	i, i+2) < 0)
			printf(1, "do task failed. task ID: %d \n");
	}

	for(int i=0; i<100; i++)
		wait_for_task_to_complete(100 + i, &results[i]);

	sleep(50);
	printf(1, "\n\n--------------------------------------\n");
	printf(1, "Tasks 100 to 199 have been completed execution \n");
	printf(1, "Issuing tasks from 200 to 209 \n\n");

	for(int i=100; i<NTASKS; i++)
	{
		if(do_task((char *)((i % 2 == 0) ? task1 : task2), 100 + i,	i, i+2) < 0)
			printf(1, "do task failed. task ID: %d \n");
	}

	for(int i=100; i<NTASKS; i++)
		wait_for_task_to_complete(100 + i, &results[i]);

	sleep(50);
	printf(1, "\n\n--------------------------------------\n");
	printf(1, "Tasks 200 to 209 have been completed execution \n\n");

	for(int i=0; i<NTASKS; i++)
	{
		if(i % 2 == 0)
			printf(1, "Results (%d). %d + %d = %d \n", 100+i, i, i+2, results[i]);
		else
			printf(1, "Results (%d). %d * %d = %d \n", 100+i, i, i+2, results[i]);
	}

	sleep(200);
	for(int i=0; i<NWORKERS; i++)
		kill(pids[i]);

	for(int i=0; i<NWORKERS; i++)
		wait();

	exit();
}


