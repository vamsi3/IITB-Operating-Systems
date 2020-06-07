#include "types.h"
#include "stat.h"
#include "user.h"

#define NWORKERS 5

void task1(int id, int a, int b)
{
	int result;

	sleep(5);
	printf(1, "[%d] Executing task1. ID: %d. a: %d. b: %d \n", getpid(), id, a, b);
	result = a + b;

	sleep(300);
	task_ret(id, result);
}

void task2(int id, int a, int b)
{
	int result;

	sleep(15);
	printf(1, "[%d] Executing task2. ID: %d. a: %d. b: %d \n", getpid(), id, a, b);

	result = a * b;
	
	sleep(450);
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
			printf(1, "[%d] Completed %d tasks. Last completed task ID: %d \n", getpid(), count, ret);
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
	int result1;
	int pid;
	int pids[NWORKERS];

	init_taskmaster();

	for(int i=0; i<NWORKERS; i++)
	{
		pid = fork();
		if(pid == 0)
			worker_thread();
						
		pids[i] = pid;
	}

	if(do_task((char *)task1, 100,	10, 11) < 0)
		printf(1, "do_task failed. task ID: %d \n", 100);

	if(wait_for_task_to_complete(100, &result1) < 0)
		printf(1, "wait_for_task_to_complete failed. task ID: %d \n", 100);

	sleep(100);	
	printf(1, "\n\nResult (100): %d.  \n", result1);

	sleep(100);
	for(int i=0; i<NWORKERS; i++)
		kill(pids[i]);

	for(int i=0; i<NWORKERS; i++)
		wait();

	exit();
}


